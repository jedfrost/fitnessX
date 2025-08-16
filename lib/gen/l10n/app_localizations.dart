import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @everybodyCanTraing.
  ///
  /// In en, this message translates to:
  /// **'Everybody Can Train'**
  String get everybodyCanTraing;

  /// No description provided for @onBoardingTitle1.
  ///
  /// In en, this message translates to:
  /// **'Track Your Goal'**
  String get onBoardingTitle1;

  /// No description provided for @onBoardingDesc1.
  ///
  /// In en, this message translates to:
  /// **'Don\'t worry if you have trouble determining your goals, We can help you determine your goals and track your goals'**
  String get onBoardingDesc1;

  /// No description provided for @onBoardingTitle2.
  ///
  /// In en, this message translates to:
  /// **'Get Burn'**
  String get onBoardingTitle2;

  /// No description provided for @onBoardingDesc2.
  ///
  /// In en, this message translates to:
  /// **'Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever'**
  String get onBoardingDesc2;

  /// No description provided for @onBoardingTitle3.
  ///
  /// In en, this message translates to:
  /// **'Eat Well'**
  String get onBoardingTitle3;

  /// No description provided for @onBoardingDesc3.
  ///
  /// In en, this message translates to:
  /// **'Let\'s start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun'**
  String get onBoardingDesc3;

  /// No description provided for @onBoardingTitle4.
  ///
  /// In en, this message translates to:
  /// **'Improve Sleep  Quality'**
  String get onBoardingTitle4;

  /// No description provided for @onBoardingDesc4.
  ///
  /// In en, this message translates to:
  /// **'Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning'**
  String get onBoardingDesc4;

  /// No description provided for @heyThere.
  ///
  /// In en, this message translates to:
  /// **'Hey there,'**
  String get heyThere;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcomeBack;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get forgotPassword;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @donthaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account yet?'**
  String get donthaveAccount;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @whatsYourGoal.
  ///
  /// In en, this message translates to:
  /// **'What is your goal ?'**
  String get whatsYourGoal;

  /// No description provided for @itHelps.
  ///
  /// In en, this message translates to:
  /// **'It will help us to choose a best\nprogram for you'**
  String get itHelps;

  /// No description provided for @createAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Create an Account'**
  String get createAnAccount;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @termsCondition.
  ///
  /// In en, this message translates to:
  /// **'By continuing you accept our Privacy Policy and Term of Use'**
  String get termsCondition;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @chooseGender.
  ///
  /// In en, this message translates to:
  /// **'Choose Gender'**
  String get chooseGender;

  /// No description provided for @dateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dateOfBirth;

  /// No description provided for @yourWeight.
  ///
  /// In en, this message translates to:
  /// **'Your Weight'**
  String get yourWeight;

  /// No description provided for @yourHeight.
  ///
  /// In en, this message translates to:
  /// **'Your Height'**
  String get yourHeight;

  /// No description provided for @improveShare.
  ///
  /// In en, this message translates to:
  /// **'Improve Shape'**
  String get improveShare;

  /// No description provided for @imporveShapeDesc.
  ///
  /// In en, this message translates to:
  /// **'I have a low amount of body fat and need / want to build more muscle'**
  String get imporveShapeDesc;

  /// No description provided for @leanTone.
  ///
  /// In en, this message translates to:
  /// **'Lean & Tone'**
  String get leanTone;

  /// No description provided for @leanToneDesc.
  ///
  /// In en, this message translates to:
  /// **'I’m “skinny fat”. look thin but have no shape. I want to add learn muscle in the right way'**
  String get leanToneDesc;

  /// No description provided for @loseFat.
  ///
  /// In en, this message translates to:
  /// **'Lose a Fat'**
  String get loseFat;

  /// No description provided for @loseFatDesc.
  ///
  /// In en, this message translates to:
  /// **'I have over 20 lbs to lose. I want to drop all this fat and gain muscle mass'**
  String get loseFatDesc;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
