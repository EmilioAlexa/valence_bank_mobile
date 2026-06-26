import 'package:flutter/material.dart';
import 'package:valence_mobile/core/constants/theme/theme.dart';
import 'package:valence_mobile/core/utils/responsive.dart';
import 'package:valence_mobile/core/widgets/widgets.dart';
import 'package:valence_mobile/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:valence_mobile/features/profile/presentation/pages/upload_identification_page.dart';
import 'package:valence_mobile/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:valence_mobile/features/profile/presentation/widgets/profile_menu_tile.dart';
import 'package:valence_mobile/features/settings/presentation/pages/settings_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, this.showAppBar = false});

  static const routeName = '/profile';

  final bool showAppBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar ? const ValenceAppBar(title: 'Profile') : null,
      body: ResponsivePage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!showAppBar)
              const ValenceAppBar(title: 'Profile', showBackButton: false),
            AppSpacing.gapM,
            Center(
              child: Column(
                children: [
                  const ProfileAvatar(radius: 52),
                  AppSpacing.gapM,
                  Text('Emilio Valence', style: AppTextStyles.headlineSmall),
                  const SizedBox(height: 4),
                  Text('emilio.valence@email.com',
                      style: AppTextStyles.bodyMedium),
                ],
              ),
            ),
            AppSpacing.gapL,
            AppCard(
              child: Column(
                children: [
                  ProfileMenuTile(
                    icon: Icons.edit_rounded,
                    title: 'Edit Profile',
                    subtitle: 'Update photo, name, and email',
                    onTap: () => Navigator.of(context)
                        .pushNamed(EditProfilePage.routeName),
                  ),
                  const Divider(height: 24),
                  ProfileMenuTile(
                    icon: Icons.badge_rounded,
                    title: 'Upload Identification',
                    subtitle: 'Add a valid identification document',
                    onTap: () => Navigator.of(context)
                        .pushNamed(UploadIdentificationPage.routeName),
                  ),
                  const Divider(height: 24),
                  ProfileMenuTile(
                    icon: Icons.settings_rounded,
                    title: 'Settings',
                    subtitle: 'Notifications, security, and account access',
                    onTap: () =>
                        Navigator.of(context).pushNamed(SettingsPage.routeName),
                  ),
                ],
              ),
            ),
            AppSpacing.gapXl,
          ],
        ),
      ),
    );
  }
}
