import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:valence_mobile/core/constants/theme/theme.dart';

class PinInput extends StatelessWidget {
  const PinInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(4, (index) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: index == 3 ? 0 : AppSpacing.s,
            ),
            child: TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              keyboardType: TextInputType.number,
              maxLength: 1,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              style: AppTextStyles.headlineSmall,
              decoration: const InputDecoration(counterText: ''),
            ),
          ),
        );
      }),
    );
  }
}
