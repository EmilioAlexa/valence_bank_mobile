import 'package:flutter/material.dart';
import 'package:valence_mobile/core/constants/theme/theme.dart';
import 'package:valence_mobile/core/utils/responsive.dart';
import 'package:valence_mobile/core/widgets/widgets.dart';

class UploadIdentificationPage extends StatelessWidget {
  const UploadIdentificationPage({super.key});

  static const routeName = '/profile/upload-identification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ValenceAppBar(title: 'Upload Identification'),
      body: ResponsivePage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Verify your identity', style: AppTextStyles.headlineMedium),
            const SizedBox(height: 6),
            Text(
              'Capture a clear image of your identification document.',
              style: AppTextStyles.bodyMedium,
            ),
            AppSpacing.gapL,
            Container(
              width: double.infinity,
              height: 260,
              decoration: BoxDecoration(
                color: AppColors.dark,
                borderRadius: AppRadius.radiusL,
                boxShadow: AppShadows.card,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 78,
                    height: 78,
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.12),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.photo_camera_rounded,
                      color: AppColors.white,
                      size: 38,
                    ),
                  ),
                  AppSpacing.gapM,
                  Text(
                    'Camera Preview',
                    style:
                        AppTextStyles.titleMedium.copyWith(color: AppColors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Mock camera placeholder',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            AppSpacing.gapL,
            AppCard(
              child: Row(
                children: [
                  Container(
                    width: 72,
                    height: 52,
                    decoration: BoxDecoration(
                      color: AppColors.primaryOpacity(0.1),
                      borderRadius: AppRadius.radiusS,
                    ),
                    child: const Icon(
                      Icons.credit_card_rounded,
                      color: AppColors.primary,
                    ),
                  ),
                  AppSpacing.gapM,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Identification Preview',
                            style: AppTextStyles.titleSmall),
                        const SizedBox(height: 2),
                        Text('Front side ready to save',
                            style: AppTextStyles.bodySmall),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AppSpacing.gapL,
            PrimaryButton(
              label: 'Save',
              icon: Icons.save_rounded,
              gradient: AppColors.primaryGradient,
              onPressed: () => Navigator.of(context).maybePop(),
            ),
            AppSpacing.gapXl,
          ],
        ),
      ),
    );
  }
}
