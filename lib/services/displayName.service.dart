import 'dart:math';

class DisplayNameService {
  static String anonymous() => 'Anonymous-${Random().nextInt(9999)}';
}
