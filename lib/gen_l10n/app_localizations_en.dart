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

  @override
  String get search_title_label => 'Search parts by title';

  @override
  String get search_title_hint => 'e.g. screw, motor, housing';

  @override
  String get search_filter_room_label => 'Filter by storage location';

  @override
  String get search_filter_room_all => 'All storage locations';

  @override
  String get search_sort_label => 'Sort by';

  @override
  String get search_sort_title => 'Title';

  @override
  String get search_sort_price => 'Price';

  @override
  String get search_sort_quantity => 'Quantity';

  @override
  String search_error_loading_parts(Object error) {
    return 'Error while loading parts: $error';
  }

  @override
  String search_error_loading_rooms(Object error) {
    return 'Error while loading storage locations: $error';
  }

  @override
  String get search_empty_parts => 'No parts have been added yet.';

  @override
  String get search_no_results => 'No results for these filters.';

  @override
  String search_room_prefix(Object value) {
    return 'Storage location: $value';
  }

  @override
  String get update_section_title => 'Update system';

  @override
  String get update_section_description =>
      'Check for new releases and install them later if you want.';

  @override
  String get update_current_version_label => 'Current version';

  @override
  String get update_latest_version_label => 'Latest version';

  @override
  String get update_last_checked_label => 'Last checked';

  @override
  String get update_status_label => 'Status';

  @override
  String get update_status_not_checked => 'Not checked yet';

  @override
  String get update_status_checking => 'Checking for updates...';

  @override
  String get update_status_up_to_date => 'You are up to date';

  @override
  String get update_status_update_available => 'Update available';

  @override
  String get update_status_downloaded =>
      'Update downloaded and ready to install';

  @override
  String get update_check_button => 'Check now';

  @override
  String get update_install_button => 'Install update';

  @override
  String get update_no_download => 'No downloaded update is available yet.';

  @override
  String update_error_prefix(Object error) {
    return 'Error: $error';
  }

  @override
  String get settings_version_label => 'App version';

  @override
  String get settings_github_title => 'GitHub repository';

  @override
  String get settings_github_subtitle => 'View source code and releases';
}
