import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_theme.dart';
import '../home_dimensions.dart';

class HomeFeatureCard extends StatelessWidget {
  const HomeFeatureCard({
    required this.title,
    required this.imagePath,
    required this.backgroundColor,
    required this.iconColor,
    this.onTap,
    super.key,
  });

  final String title;
  final String imagePath;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.lg),
      side: BorderSide(color: iconColor.withValues(alpha: 0.10), width: 0.8),
    );

    return Semantics(
      button: onTap != null,
      label: title,
      child: Material(
        color: backgroundColor,
        elevation: 0.7,
        shadowColor: AppColors.shadow,
        shape: shape,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          customBorder: shape,
          splashColor: iconColor.withValues(alpha: 0.08),
          highlightColor: iconColor.withValues(alpha: 0.04),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: AppSpacing.md,
            ),
            child: ExcludeSemantics(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    imagePath,
                    width: HomeDimensions.featureImageSize,
                    height: HomeDimensions.featureImageSize,
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.image_not_supported_outlined,
                        size: 32,
                        color: iconColor,
                      );
                    },
                  ),

                  const SizedBox(height: AppSpacing.sm),

                  Text(
                    title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.labelMedium?.copyWith(
                      fontSize: HomeDimensions.featureTitleSize,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
