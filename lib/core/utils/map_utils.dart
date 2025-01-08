import "dart:io";

import "package:url_launcher/url_launcher.dart";

final class MapUtils {
  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    final Uri mapsUri;
    if (Platform.isAndroid) {
      mapsUri = Uri.parse("geo:$latitude,$longitude?q=$latitude,$longitude");
    } else {
      mapsUri = Uri.parse("https://www.google.com/maps/search/?api=1&query=$latitude,$longitude");
    }
    // final Uri mapsUri = Uri.parse("geo:$latitude,$longitude");
    if (await canLaunchUrl(mapsUri)) {
      await launchUrl(mapsUri);
    } else {
      throw Exception("Harita bağlantısı açılamadı. Lütfen uygulamayı güncelleyin ya da Uygulama konum izinlerinizi gözden geçirin.");
    }
  }
}
