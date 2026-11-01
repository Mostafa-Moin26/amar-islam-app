import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_theme.dart';
import '../../../../core/constants/app_strings.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({this.onSettingsTap, super.key});

  final VoidCallback? onSettingsTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildAppIcon(),

        const SizedBox(width: AppSpacing.lg),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.homeGreeting,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.titleMedium?.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: AppSpacing.xs),

              Text(
                AppStrings.homeGreetingSubtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodySmall?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: AppSpacing.sm),

        _buildSettingsButton(),
      ],
    );
  }

  Widget _buildAppIcon() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.softSage,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.deepGreen.withValues(alpha: 0.12),
          width: 1,
        ),
      ),
      alignment: Alignment.center,
      child: const Icon(
        Icons.mosque_rounded,
        color: AppColors.deepGreen,
        size: 25,
      ),
    );
  }

  Widget _buildSettingsButton() {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.lg),
      side: const BorderSide(color: AppColors.divider, width: 1),
    );

    return Material(
      color: AppColors.surface,
      shape: shape,
      child: InkWell(
        onTap: onSettingsTap,
        customBorder: shape,
        child: SizedBox(
          width: 44,
          height: 44,
          child: Tooltip(
            message: AppStrings.settings,
            child: const Icon(
              IconsaxPlusLinear.setting_2,
              color: AppColors.textPrimary,
              size: 21,
            ),
          ),
        ),
      ),
    );
  }
}
