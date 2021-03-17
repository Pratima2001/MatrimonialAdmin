import 'package:flutter/cupertino.dart';

class Demolocalization {
  final Locale locale;
  Demolocalization(this.locale);
  static Demolocalization of(BuildContext context) {
    return Localizations.of<Demolocalization>(context, Demolocalization);
  }

  Map<String, String> _localized;
}
