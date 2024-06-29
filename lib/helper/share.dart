import 'package:share_plus/share_plus.dart';

share({required String title, String? content}) async {
  await Share.share('$title \n\n $content');
}
