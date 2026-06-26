import 'package:flutter/material.dart';
import 'package:valence_mobile/core/constants/theme/theme.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key, this.radius = 48});

  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppColors.primaryGradient,
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: AppColors.primaryLighter,
        child: Icon(
          Icons.person_rounded,
          color: AppColors.primary,
          size: radius,
        ),
      ),
    );
  }
}
