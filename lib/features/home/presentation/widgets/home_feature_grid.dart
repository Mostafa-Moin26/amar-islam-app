import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';
import '../home_dimensions.dart';
import 'home_feature_card.dart';

enum HomeFeature {
  quran,
  salahLearning,
  duaZikr,
  hadith,
  surahLearning,
  islamicKnowledge,
  tasbih,
  qibla,
}

class HomeFeatureGrid extends StatelessWidget {
  const HomeFeatureGrid({this.onFeatureTap, super.key});

  final ValueChanged<HomeFeature>? onFeatureTap;

  static const List<_HomeFeatureItem> _features = [
    _HomeFeatureItem(
      feature: HomeFeature.quran,
      title: AppStrings.featureQuran,
      imagePath: AppAssets.featureQuran,
      backgroundColor: AppColors.quranBg,
      iconColor: AppColors.quranIcon,
    ),
    _HomeFeatureItem(
      feature: HomeFeature.salahLearning,
      title: AppStrings.featureSalahLearning,
      imagePath: AppAssets.featureSalahLearning,
      backgroundColor: AppColors.salahLearningBg,
      iconColor: AppColors.salahLearningIcon,
    ),
    _HomeFeatureItem(
      feature: HomeFeature.duaZikr,
      title: AppStrings.featureDuaZikr,
      imagePath: AppAssets.featureDuaZikr,
      backgroundColor: AppColors.duaBg,
      iconColor: AppColors.duaIcon,
    ),
    _HomeFeatureItem(
      feature: HomeFeature.hadith,
      title: AppStrings.featureHadith,
      imagePath: AppAssets.featureHadith,
      backgroundColor: AppColors.hadithBg,
      iconColor: AppColors.hadithIcon,
    ),
    _HomeFeatureItem(
      feature: HomeFeature.surahLearning,
      title: AppStrings.featureSurahLearning,
      imagePath: AppAssets.featureSurahLearning,
      backgroundColor: AppColors.surahLearningBg,
      iconColor: AppColors.surahLearningIcon,
    ),
    _HomeFeatureItem(
      feature: HomeFeature.islamicKnowledge,
      title: AppStrings.featureIslamicKnowledge,
      imagePath: AppAssets.featureIslamicKnowledge,
      backgroundColor: AppColors.islamicKnowledgeBg,
      iconColor: AppColors.islamicKnowledgeIcon,
    ),
    _HomeFeatureItem(
      feature: HomeFeature.tasbih,
      title: AppStrings.featureTasbih,
      imagePath: AppAssets.featureTasbih,
      backgroundColor: AppColors.tasbihBg,
      iconColor: AppColors.tasbihIcon,
    ),
    _HomeFeatureItem(
      feature: HomeFeature.qibla,
      title: AppStrings.featureQibla,
      imagePath: AppAssets.featureQibla,
      backgroundColor: AppColors.qiblaBg,
      iconColor: AppColors.qiblaIcon,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth < 350 ? 2 : 4;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _features.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: HomeDimensions.featureCrossAxisSpacing,
            mainAxisSpacing: HomeDimensions.featureMainAxisSpacing,
            mainAxisExtent: HomeDimensions.featureCardHeight,
          ),
          itemBuilder: (context, index) {
            final item = _features[index];

            return HomeFeatureCard(
              title: item.title,
              imagePath: item.imagePath,
              backgroundColor: item.backgroundColor,
              iconColor: item.iconColor,
              onTap: onFeatureTap == null
                  ? null
                  : () => onFeatureTap!(item.feature),
            );
          },
        );
      },
    );
  }
}

class _HomeFeatureItem {
  const _HomeFeatureItem({
    required this.feature,
    required this.title,
    required this.imagePath,
    required this.backgroundColor,
    required this.iconColor,
  });

  final HomeFeature feature;
  final String title;
  final String imagePath;
  final Color backgroundColor;
  final Color iconColor;
}
