import 'package:flutter/material.dart';
import 'package:valence_mobile/core/constants/theme/theme.dart';
import 'package:valence_mobile/core/utils/responsive.dart';
import 'package:valence_mobile/core/widgets/widgets.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

  static const routeName = '/settings/security';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ValenceAppBar(title: 'Security'),
      body: ResponsivePage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Secure access', style: AppTextStyles.headlineMedium),
            const SizedBox(height: 6),
            Text(
              'Configure local authentication for premium account protection.',
              style: AppTextStyles.bodyMedium,
            ),
            AppSpacing.gapL,
            AppCard(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 23,
                    backgroundColor: AppColors.primaryOpacity(0.1),
                    child: const Icon(
                      Icons.fingerprint_rounded,
                      color: AppColors.primary,
                    ),
                  ),
                  AppSpacing.gapM,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Fingerprint', style: AppTextStyles.titleSmall),
                        const SizedBox(height: 2),
                        Text('Use biometric access',
                            style: AppTextStyles.bodySmall),
                      ],
                    ),
                  ),
                  Switch(value: true, onChanged: (_) {}),
                ],
              ),
            ),
            AppSpacing.gapL,
            const AppCard(
              child: Column(
                children: [
                  AppTextField(
                    label: 'Create PIN',
                    hintText: 'Enter new PIN',
                    prefixIcon: Icons.lock_rounded,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: AppSpacing.m),
                  AppTextField(
                    label: 'Change PIN',
                    hintText: 'Enter current PIN',
                    prefixIcon: Icons.password_rounded,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: AppSpacing.m),
                  AppTextField(
                    label: 'Confirm PIN',
                    hintText: 'Confirm new PIN',
                    prefixIcon: Icons.verified_user_rounded,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
            ),
            AppSpacing.gapL,
            PrimaryButton(
              label: 'Save Security Settings',
              icon: Icons.check_rounded,
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
