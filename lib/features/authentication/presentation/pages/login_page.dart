import 'package:flutter/material.dart';
import 'package:valence_mobile/core/utils/responsive.dart';
import 'package:valence_mobile/features/authentication/presentation/pages/register_page.dart';
import 'package:valence_mobile/features/dashboard/presentation/pages/dashboard_shell.dart';
import 'package:valence_mobile/core/constants/theme/colors.dart';
import 'package:valence_mobile/core/constants/theme/text_styles.dart';
import 'package:valence_mobile/core/constants/theme/spacing.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const routeName = '/login';

  void _handleLogin(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const DashboardShell()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsivePage(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 48),
              Text(
                'Welcome back',
                style: AppTextStyles.displayMedium.copyWith(color: AppColors.primary),
                textAlign: TextAlign.start,
              ),
              AppSpacing.gapS,
              Text(
                'Sign in to continue',
                style: AppTextStyles.bodySmall,
                textAlign: TextAlign.start,
              ),
              AppSpacing.gapXl,
              Image.asset(
                'assets/images/Illustration_login.png',
                height: 180,
              ),
              AppSpacing.gapXl,
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              AppSpacing.gapM,
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const Text(
                'Forgot your password ?',
                style: TextStyle(color: AppColors.primary),
                textAlign: TextAlign.end,
              ),
              AppSpacing.gapXl,
              FilledButton(
                onPressed: () => _handleLogin(context),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Text('Sign In'),
                ),
              ),
              AppSpacing.gapXl,
              TextButton(
                onPressed: () => Navigator.of(context).pushNamed(
                  RegisterPage.routeName,
                ),
                child: const Text("Don't have an account? Sign up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}