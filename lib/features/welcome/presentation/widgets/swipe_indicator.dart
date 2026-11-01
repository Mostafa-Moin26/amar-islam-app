import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class SwipeIndicator extends StatefulWidget {
  const SwipeIndicator({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  State<SwipeIndicator> createState() => _SwipeIndicatorState();
}

class _SwipeIndicatorState extends State<SwipeIndicator>
    with SingleTickerProviderStateMixin {
  static const double _pillWidth = 56;
  static const double _pillHeight = 6;

  static const Duration _animationDuration = Duration(milliseconds: 2400);

  late final AnimationController _animationController;
  late final Animation<double> _shineAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );

    _shineAnimation = TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: -1.5,
          end: 1.5,
        ).chain(CurveTween(curve: Curves.easeInOutCubic)),
        weight: 60,
      ),
      TweenSequenceItem<double>(tween: ConstantTween<double>(1.5), weight: 40),
    ]).animate(_animationController);

    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'শুরু করতে ট্যাপ করুন',
      hint: 'অথবা সামনে যেতে স্ক্রিনে সোয়াইপ করুন',
      onTap: widget.onTap,
      child: ExcludeSemantics(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(32),
            splashColor: AppColors.warmCream.withValues(alpha: 0.12),
            highlightColor: AppColors.warmCream.withValues(alpha: 0.08),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 21),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildStaticPill(),
                  const SizedBox(width: 8),
                  _buildAnimatedPill(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStaticPill() {
    return SizedBox(
      width: _pillWidth,
      height: _pillHeight,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.warmCream,
          borderRadius: BorderRadius.circular(_pillHeight),
        ),
      ),
    );
  }

  Widget _buildAnimatedPill() {
    final baseColor = AppColors.warmCream.withValues(alpha: 0.3);

    final highlightColor = AppColors.warmCream.withValues(alpha: 0.95);

    return AnimatedBuilder(
      animation: _shineAnimation,
      builder: (context, child) {
        final position = _shineAnimation.value;

        return SizedBox(
          width: _pillWidth,
          height: _pillHeight,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_pillHeight),
              gradient: LinearGradient(
                begin: Alignment(position - 1.0, 0),
                end: Alignment(position + 1.0, 0),
                colors: [baseColor, highlightColor, baseColor],
              ),
            ),
          ),
        );
      },
    );
  }
}
