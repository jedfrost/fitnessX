import 'package:fitnessx/gen/l10n/app_localizations.dart';
import 'package:fitnessx/gen/l10n/app_localizations_en.dart';
import 'package:flutter/widgets.dart';


extension CommonUtil on BuildContext {
  AppLocalizations getLocaleString() =>  AppLocalizations.of(this) ?? AppLocalizationsEn();
}