/// Display-formatting helpers shared across feature modules.
///
/// Currency/date/account-number formatting must stay identical
/// wherever money or sensitive identifiers are rendered, so all
/// formatting logic lives here rather than being duplicated per page.
class Formatters {
  Formatters._();

  /// Formats a numeric amount as currency, e.g. 20000 -> "$20,000.00".
  static String currency(double amount, {String symbol = '\$'}) {
    final isNegative = amount < 0;
    final value = amount.abs();
    final parts = value.toStringAsFixed(2).split('.');
    final wholePart = parts[0];
    final decimalPart = parts[1];

    final buffer = StringBuffer();
    for (int i = 0; i < wholePart.length; i++) {
      final reverseIndex = wholePart.length - i;
      buffer.write(wholePart[i]);
      final isNotLast = reverseIndex != 1;
      if (isNotLast && reverseIndex % 3 == 1) buffer.write(',');
    }

    final sign = isNegative ? '-' : '';
    return '$sign$symbol${buffer.toString()}.$decimalPart';
  }

  /// Masks an account number, showing only the last [visibleDigits].
  /// e.g. "1234567890123" -> "•••• •••• 0123"
  static String maskAccountNumber(String accountNumber, {int visibleDigits = 4}) {
    final digits = accountNumber.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.length <= visibleDigits) return digits;
    final visible = digits.substring(digits.length - visibleDigits);
    final maskedLength = digits.length - visibleDigits;
    final maskGroups = (maskedLength / 4).ceil();
    final masked = List.filled(maskGroups, '••••').join(' ');
    return '$masked $visible';
  }

  /// Formats a card number with spaces every 4 digits.
  static String cardNumber(String number) {
    final digits = number.replaceAll(RegExp(r'[^0-9]'), '');
    final buffer = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      buffer.write(digits[i]);
      if ((i + 1) % 4 == 0 && i != digits.length - 1) buffer.write(' ');
    }
    return buffer.toString();
  }

  static String relativeTime(DateTime dateTime) {
    final diff = DateTime.now().difference(dateTime);
    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }
}
