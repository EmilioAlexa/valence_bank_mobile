import 'package:flutter/material.dart';
import 'package:valence_mobile/core/utils/responsive.dart';
import 'package:valence_mobile/features/dashboard/presentation/pages/dashboard_shell.dart';
import 'package:valence_mobile/core/constants/theme/colors.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const routeName = '/register';

  void _handleRegister(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const DashboardShell()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: ResponsivePage(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary
                ),
              ),
              const SizedBox(height: 24),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Full name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () => _handleRegister(context),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Text('Create account'),
                ),
              ),
              const SizedBox(height: 16),
              const Center(child: Text('Or')),
              const SizedBox(height: 16),
              const OutlinedButton(
                onPressed: null,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: 
                  Text(
                    'Sign up with google',
                    style: TextStyle(color: AppColors.primaryDark),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}