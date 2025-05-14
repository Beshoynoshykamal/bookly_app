
import 'package:url_launcher/url_launcher.dart';

import 'custom_snackbar.dart';

Future<void> launchCustomUri(context, String url) async {
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    custom_snackbar(context, "cannot launch $url");
  }
}


