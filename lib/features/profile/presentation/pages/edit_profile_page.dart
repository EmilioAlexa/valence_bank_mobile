import 'package:flutter/material.dart';
import 'package:valence_mobile/core/constants/theme/theme.dart';
import 'package:valence_mobile/core/utils/responsive.dart';
import 'package:valence_mobile/core/widgets/widgets.dart';
import 'package:valence_mobile/features/profile/presentation/widgets/profile_avatar.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  static const routeName = '/profile/edit';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ValenceAppBar(title: 'Edit Profile'),
      body: ResponsivePage(
        child: Column(
          children: [
            const ProfileAvatar(radius: 52),
            AppSpacing.gapL,
            const AppCard(
              child: Column(
                children: [
                  AppTextField(
                    label: 'Name',
                    hintText: 'Emilio Valence',
                    prefixIcon: Icons.person_rounded,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: AppSpacing.m),
                  AppTextField(
                    label: 'Email',
                    hintText: 'emilio.valence@email.com',
                    prefixIcon: Icons.email_rounded,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
            ),
            AppSpacing.gapL,
            PrimaryButton(
              label: 'Save',
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
