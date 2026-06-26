import 'package:flutter/material.dart';
import 'package:valence_mobile/core/constants/theme/theme.dart';
import 'package:valence_mobile/features/dashboard/presentation/pages/dashboard_shell.dart';
import 'package:valence_mobile/features/maps/presentation/pages/branches_page.dart';
import 'package:valence_mobile/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:valence_mobile/features/profile/presentation/pages/profile_page.dart';
import 'package:valence_mobile/features/profile/presentation/pages/upload_identification_page.dart';
import 'package:valence_mobile/features/security/presentation/pages/security_page.dart';
import 'package:valence_mobile/features/settings/presentation/pages/settings_page.dart';
import 'package:valence_mobile/features/transactions/presentation/pages/transactions_page.dart';
import 'package:valence_mobile/features/transfer/presentation/pages/transfer_page.dart';

void main() {
  runApp(const ValenceApp());
}

class ValenceApp extends StatelessWidget {
  const ValenceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valence Mobile',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const DashboardShell(),
      routes: {
        BranchesPage.routeName: (_) => const BranchesPage(showAppBar: true),
        EditProfilePage.routeName: (_) => const EditProfilePage(),
        ProfilePage.routeName: (_) => const ProfilePage(showAppBar: true),
        SecurityPage.routeName: (_) => const SecurityPage(),
        SettingsPage.routeName: (_) => const SettingsPage(),
        TransactionsPage.routeName: (_) => const TransactionsPage(),
        TransferPage.routeName: (_) => const TransferPage(),
        UploadIdentificationPage.routeName: (_) =>
            const UploadIdentificationPage(),
      },
    );
  }
}
