import 'dart:math';

class UserQRService {
  static final Map<String, String> _userQRCodes = {};

  /// Generate or return existing QR code for a user
  static String getUserQRCode(String userId) {
    if (_userQRCodes.containsKey(userId)) {
      // return the saved QR
      return _userQRCodes[userId]!;
    } else {
      // generate new QR string (random for uniqueness)
      final randomString = _generateRandomString(10);
      final qrData = "$userId-$randomString";

      _userQRCodes[userId] = qrData; // save it in memory (or DB)
      return qrData;
    }
  }

  /// Helper: generate random string
  static String _generateRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final rand = Random();
    return List.generate(
      length,
      (index) => chars[rand.nextInt(chars.length)],
    ).join();
  }
}
