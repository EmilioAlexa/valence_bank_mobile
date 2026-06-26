/// Centralized form validation logic for Valence Mobile.
///
/// Keeping validators here (instead of inline in each form) means
/// password/PIN/account-number rules stay consistent across
/// authentication, transfers, and profile editing flows.
class Validators {
  Validators._();

  static final RegExp _emailRegex = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)+$",
  );

  static String? required(String? value, {String fieldName = 'This field'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) return 'Email is required';
    if (!_emailRegex.hasMatch(value.trim())) return 'Enter a valid email address';
    return null;
  }

  static String? password(String? value, {int minLength = 8}) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < minLength) return 'Password must be at least $minLength characters';
    if (!RegExp(r'[A-Z]').hasMatch(value)) return 'Include at least one uppercase letter';
    if (!RegExp(r'[0-9]').hasMatch(value)) return 'Include at least one number';
    return null;
  }

  static String? confirmPassword(String? value, String original) {
    if (value == null || value.isEmpty) return 'Please confirm your password';
    if (value != original) return 'Passwords do not match';
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) return 'Phone number is required';
    final digitsOnly = value.replaceAll(RegExp(r'[^0-9]'), '');
    if (digitsOnly.length < 8 || digitsOnly.length > 15) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  static String? pin(String? value, {int length = 4}) {
    if (value == null || value.isEmpty) return 'PIN is required';
    if (value.length != length) return 'PIN must be $length digits';
    if (!RegExp(r'^\d+$').hasMatch(value)) return 'PIN must contain digits only';
    return null;
  }

  static String? accountNumber(String? value) {
    if (value == null || value.trim().isEmpty) return 'Account number is required';
    if (!RegExp(r'^\d{8,17}$').hasMatch(value.trim())) {
      return 'Enter a valid account number';
    }
    return null;
  }

  static String? amount(String? value, {double? min, double? max}) {
    if (value == null || value.trim().isEmpty) return 'Amount is required';
    final parsed = double.tryParse(value.replaceAll(',', ''));
    if (parsed == null) return 'Enter a valid amount';
    if (parsed <= 0) return 'Amount must be greater than zero';
    if (min != null && parsed < min) return 'Minimum amount is $min';
    if (max != null && parsed > max) return 'Maximum amount is $max';
    return null;
  }
}
