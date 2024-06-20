import 'dart:io';

class Tools {
  static bool isWeb() {
    var kisweb = false;
    try {
      if (Platform.isAndroid || Platform.isIOS) {
        kisweb = false;
      } else {
        kisweb = true;
      }
    } catch (e) {
      kisweb = true;
    }
    return kisweb;
  }
}
