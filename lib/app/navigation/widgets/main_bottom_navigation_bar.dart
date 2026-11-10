import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../theme/app_colors.dart';

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({
    required this.currentIndex,
    required this.onDestinationSelected,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  static const double _itemHeight = 55;
  static const double _indicatorWidth = 45;
  static const double _indicatorHeight = 32;
  static const double _selectedIconSize = 24;
  static const double _unselectedIconSize = 22;
  static const double _labelFontSize = 11;

  static const Duration _animationDuration = Duration(milliseconds: 220);

  static const List<_NavigationItem> _items = [
    _NavigationItem(
      label: 'হোম',
      icon: IconsaxPlusLinear.home_1,
      selectedIcon: IconsaxPlusBold.home_1,
    ),
    _NavigationItem(
      label: 'কুরআন',
      icon: IconsaxPlusLinear.book_1,
      selectedIcon: IconsaxPlusBold.book_1,
    ),
    _NavigationItem(
      label: 'দোয়া',
      icon: IconsaxPlusLinear.heart,
      selectedIcon: IconsaxPlusBold.heart,
    ),
    _NavigationItem(
      label: 'হাদিস',
      icon: IconsaxPlusLinear.book_saved,
      selectedIcon: IconsaxPlusBold.book_saved,
    ),
    _NavigationItem(
      label: 'আরও',
      icon: IconsaxPlusLinear.more,
      selectedIcon: IconsaxPlusBold.more,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.divider, width: 0.8)),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 12,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 8, 5, 4),
          child: Row(
            children: List.generate(_items.length, (index) {
              return Expanded(
                child: _NavigationDestination(
                  item: _items[index],
                  isSelected: currentIndex == index,
                  onTap: () => onDestinationSelected(index),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavigationDestination extends StatelessWidget {
  const _NavigationDestination({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  final _NavigationItem item;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final selectedColor = AppColors.deepGreen;
    final unselectedColor = AppColors.textSecondary;

    return Semantics(
      button: true,
      selected: isSelected,
      label: item.label,
      child: ExcludeSemantics(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            splashColor: AppColors.primaryOverlay,
            highlightColor: AppColors.primaryOverlay,
            child: SizedBox(
              height: MainBottomNavigationBar._itemHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: MainBottomNavigationBar._animationDuration,
                    curve: Curves.easeInOut,
                    width: MainBottomNavigationBar._indicatorWidth,
                    height: MainBottomNavigationBar._indicatorHeight,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.softSage
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    alignment: Alignment.center,
                    child: AnimatedSwitcher(
                      duration: MainBottomNavigationBar._animationDuration,
                      switchInCurve: Curves.easeOutBack,
                      switchOutCurve: Curves.easeIn,
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: ScaleTransition(
                            scale: animation,
                            child: child,
                          ),
                        );
                      },
                      child: Icon(
                        isSelected ? item.selectedIcon : item.icon,
                        key: ValueKey<bool>(isSelected),
                        size: isSelected
                            ? MainBottomNavigationBar._selectedIconSize
                            : MainBottomNavigationBar._unselectedIconSize,
                        color: isSelected ? selectedColor : unselectedColor,
                      ),
                    ),
                  ),

                  const SizedBox(height: 5),

                  AnimatedDefaultTextStyle(
                    duration: MainBottomNavigationBar._animationDuration,
                    curve: Curves.easeInOut,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: MainBottomNavigationBar._labelFontSize,
                      height: 1.4,
                      fontWeight: isSelected
                          ? FontWeight.w700
                          : FontWeight.w500,
                      color: isSelected ? selectedColor : unselectedColor,
                    ),
                    child: Text(
                      item.label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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

class _NavigationItem {
  const _NavigationItem({
    required this.label,
    required this.icon,
    required this.selectedIcon,
  });

  final String label;
  final IconData icon;
  final IconData selectedIcon;
}
