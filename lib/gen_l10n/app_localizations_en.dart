// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_name => 'FogStorage';

  @override
  String get navbar_home => 'Home';

  @override
  String get navbar_search => 'Search';

  @override
  String get navbar_add => 'Add';

  @override
  String get navbar_settings => 'Settings';

  @override
  String get appbar_home => 'Home';

  @override
  String get appbar_search => 'Search';

  @override
  String get appbar_add => 'Add';

  @override
  String get appbar_settings => 'Settings';

  @override
  String get add_title_label => 'Title';

  @override
  String get add_title_required => 'Please enter a title';

  @override
  String get add_article_number_label => 'Article number';

  @override
  String get add_description_label => 'Description';

  @override
  String get add_quantity_label => 'Quantity';

  @override
  String get add_price_label => 'Price (€)';

  @override
  String get add_location_label => 'Storage location';

  @override
  String get add_location_hint => 'Choose a storage location';

  @override
  String get add_location_required => 'Please choose a storage location';

  @override
  String get add_new_location => 'Add new...';

  @override
  String get add_save_button => 'Save to database';

  @override
  String get add_dialog_title => 'Add new storage location';

  @override
  String get add_dialog_hint => 'e.g. Shelf C3';

  @override
  String get add_dialog_cancel => 'Cancel';

  @override
  String get add_dialog_add => 'Add';

  @override
  String get add_save_success =>
      'Part and storage location were successfully linked and saved!';

  @override
  String add_save_error(Object error) {
    return 'Error while saving: $error';
  }

  @override
  String home_load_error(Object error) {
    return 'Error while loading: $error';
  }

  @override
  String get home_empty_state =>
      'No parts have been added yet.\nUse the plus symbol to add data.';

  @override
  String home_article_number_prefix(Object value) {
    return 'Art. No.: $value';
  }
}
