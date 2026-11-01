import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_assets.dart';
import 'swipe_indicator.dart';

class WelcomeContent extends StatelessWidget {
  const WelcomeContent({required this.onNext, super.key});

  final VoidCallback onNext;

  static const String _title = 'আমার ইসলাম';
  static const String _subtitle = 'দৈনন্দিন জীবনের ইসলামি সঙ্গী';

  static const double _horizontalPadding = 24;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const ColoredBox(color: AppColors.splashBackground),

        Image.asset(
          AppAssets.splashImage,
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
          excludeFromSemantics: true,
        ),

        SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final titleBottom = (constraints.maxHeight * 0.20 + 24)
                  .clamp(140.0, 190.0)
                  .toDouble();

              final titleFontSize = constraints.maxWidth < 360 ? 32.0 : 42.0;

              final subtitleFontSize = constraints.maxWidth < 360 ? 16.0 : 18.0;

              final textTheme = Theme.of(context).textTheme;

              return Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    left: _horizontalPadding,
                    right: _horizontalPadding,
                    bottom: titleBottom,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Semantics(
                          header: true,
                          child: Text(
                            _title,
                            textAlign: TextAlign.center,
                            style: textTheme.displayLarge?.copyWith(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.w700,
                              height: 1.3,
                              letterSpacing: 0,
                              color: AppColors.mutedGold,
                              shadows: const [
                                Shadow(
                                  color: Color(0x40000000),
                                  offset: Offset(0, 2),
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          _subtitle,
                          textAlign: TextAlign.center,
                          style: textTheme.titleMedium?.copyWith(
                            fontSize: subtitleFontSize,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                            color: AppColors.warmCream.withValues(alpha: 0.92),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Center(child: SwipeIndicator(onTap: onNext)),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
