import 'package:intl/intl.dart';

bool hasAnyRtl(String text) {
  final bool hasRtl = Bidi.hasAnyRtl(text);
  return hasRtl;
}
