import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
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
    Locale('de'),
    Locale('en'),
  ];

  /// No description provided for @app_name.
  ///
  /// In en, this message translates to:
  /// **'FogStorage'**
  String get app_name;

  /// No description provided for @navbar_home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navbar_home;

  /// No description provided for @navbar_search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get navbar_search;

  /// No description provided for @navbar_add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get navbar_add;

  /// No description provided for @navbar_settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navbar_settings;

  /// No description provided for @appbar_home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get appbar_home;

  /// No description provided for @appbar_search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get appbar_search;

  /// No description provided for @appbar_add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get appbar_add;

  /// No description provided for @appbar_settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get appbar_settings;

  /// No description provided for @add_title_label.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get add_title_label;

  /// No description provided for @add_title_required.
  ///
  /// In en, this message translates to:
  /// **'Please enter a title'**
  String get add_title_required;

  /// No description provided for @add_article_number_label.
  ///
  /// In en, this message translates to:
  /// **'Article number'**
  String get add_article_number_label;

  /// No description provided for @add_description_label.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get add_description_label;

  /// No description provided for @add_quantity_label.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get add_quantity_label;

  /// No description provided for @add_price_label.
  ///
  /// In en, this message translates to:
  /// **'Price (€)'**
  String get add_price_label;

  /// No description provided for @add_location_label.
  ///
  /// In en, this message translates to:
  /// **'Storage location'**
  String get add_location_label;

  /// No description provided for @add_location_hint.
  ///
  /// In en, this message translates to:
  /// **'Choose a storage location'**
  String get add_location_hint;

  /// No description provided for @add_location_required.
  ///
  /// In en, this message translates to:
  /// **'Please choose a storage location'**
  String get add_location_required;

  /// No description provided for @add_new_location.
  ///
  /// In en, this message translates to:
  /// **'Add new...'**
  String get add_new_location;

  /// No description provided for @add_save_button.
  ///
  /// In en, this message translates to:
  /// **'Save to database'**
  String get add_save_button;

  /// No description provided for @add_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Add new storage location'**
  String get add_dialog_title;

  /// No description provided for @add_dialog_hint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Shelf C3'**
  String get add_dialog_hint;

  /// No description provided for @add_dialog_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get add_dialog_cancel;

  /// No description provided for @add_dialog_add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add_dialog_add;

  /// No description provided for @add_save_success.
  ///
  /// In en, this message translates to:
  /// **'Part and storage location were successfully linked and saved!'**
  String get add_save_success;

  /// No description provided for @add_save_error.
  ///
  /// In en, this message translates to:
  /// **'Error while saving: {error}'**
  String add_save_error(Object error);

  /// No description provided for @home_load_error.
  ///
  /// In en, this message translates to:
  /// **'Error while loading: {error}'**
  String home_load_error(Object error);

  /// No description provided for @home_empty_state.
  ///
  /// In en, this message translates to:
  /// **'No parts have been added yet.\nUse the plus symbol to add data.'**
  String get home_empty_state;

  /// No description provided for @home_article_number_prefix.
  ///
  /// In en, this message translates to:
  /// **'Art. No.: {value}'**
  String home_article_number_prefix(Object value);

  /// No description provided for @search_title_label.
  ///
  /// In en, this message translates to:
  /// **'Search parts by title'**
  String get search_title_label;

  /// No description provided for @search_title_hint.
  ///
  /// In en, this message translates to:
  /// **'e.g. screw, motor, housing'**
  String get search_title_hint;

  /// No description provided for @search_filter_room_label.
  ///
  /// In en, this message translates to:
  /// **'Filter by storage location'**
  String get search_filter_room_label;

  /// No description provided for @search_filter_room_all.
  ///
  /// In en, this message translates to:
  /// **'All storage locations'**
  String get search_filter_room_all;

  /// No description provided for @search_sort_label.
  ///
  /// In en, this message translates to:
  /// **'Sort by'**
  String get search_sort_label;

  /// No description provided for @search_sort_title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get search_sort_title;

  /// No description provided for @search_sort_price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get search_sort_price;

  /// No description provided for @search_sort_quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get search_sort_quantity;

  /// No description provided for @search_error_loading_parts.
  ///
  /// In en, this message translates to:
  /// **'Error while loading parts: {error}'**
  String search_error_loading_parts(Object error);

  /// No description provided for @search_error_loading_rooms.
  ///
  /// In en, this message translates to:
  /// **'Error while loading storage locations: {error}'**
  String search_error_loading_rooms(Object error);

  /// No description provided for @search_empty_parts.
  ///
  /// In en, this message translates to:
  /// **'No parts have been added yet.'**
  String get search_empty_parts;

  /// No description provided for @search_no_results.
  ///
  /// In en, this message translates to:
  /// **'No results for these filters.'**
  String get search_no_results;

  /// No description provided for @search_room_prefix.
  ///
  /// In en, this message translates to:
  /// **'Storage location: {value}'**
  String search_room_prefix(Object value);

  /// No description provided for @update_section_title.
  ///
  /// In en, this message translates to:
  /// **'Update system'**
  String get update_section_title;

  /// No description provided for @update_section_description.
  ///
  /// In en, this message translates to:
  /// **'Check for new releases and install them later if you want.'**
  String get update_section_description;

  /// No description provided for @update_current_version_label.
  ///
  /// In en, this message translates to:
  /// **'Current version'**
  String get update_current_version_label;

  /// No description provided for @update_latest_version_label.
  ///
  /// In en, this message translates to:
  /// **'Latest version'**
  String get update_latest_version_label;

  /// No description provided for @update_last_checked_label.
  ///
  /// In en, this message translates to:
  /// **'Last checked'**
  String get update_last_checked_label;

  /// No description provided for @update_status_label.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get update_status_label;

  /// No description provided for @update_status_not_checked.
  ///
  /// In en, this message translates to:
  /// **'Not checked yet'**
  String get update_status_not_checked;

  /// No description provided for @update_status_checking.
  ///
  /// In en, this message translates to:
  /// **'Checking for updates...'**
  String get update_status_checking;

  /// No description provided for @update_status_up_to_date.
  ///
  /// In en, this message translates to:
  /// **'You are up to date'**
  String get update_status_up_to_date;

  /// No description provided for @update_status_update_available.
  ///
  /// In en, this message translates to:
  /// **'Update available'**
  String get update_status_update_available;

  /// No description provided for @update_status_downloaded.
  ///
  /// In en, this message translates to:
  /// **'Update downloaded and ready to install'**
  String get update_status_downloaded;

  /// No description provided for @update_check_button.
  ///
  /// In en, this message translates to:
  /// **'Check now'**
  String get update_check_button;

  /// No description provided for @update_install_button.
  ///
  /// In en, this message translates to:
  /// **'Install update'**
  String get update_install_button;

  /// No description provided for @update_no_download.
  ///
  /// In en, this message translates to:
  /// **'No downloaded update is available yet.'**
  String get update_no_download;

  /// No description provided for @update_error_prefix.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String update_error_prefix(Object error);

  /// No description provided for @settings_version_label.
  ///
  /// In en, this message translates to:
  /// **'App version'**
  String get settings_version_label;

  /// No description provided for @settings_github_title.
  ///
  /// In en, this message translates to:
  /// **'GitHub repository'**
  String get settings_github_title;

  /// No description provided for @settings_github_subtitle.
  ///
  /// In en, this message translates to:
  /// **'View source code and releases'**
  String get settings_github_subtitle;
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
      <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
