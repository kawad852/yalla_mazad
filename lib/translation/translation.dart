import 'package:get/get.dart';
import 'package:yalla_mazad/translation/arabic.dart';
import 'package:yalla_mazad/translation/english.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en": en,
        "ar": ar,
      };
}
