// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get app_name => 'FogStorage';

  @override
  String get navbar_home => 'Startseite';

  @override
  String get navbar_search => 'Suchen';

  @override
  String get navbar_add => 'Hinzufügen';

  @override
  String get navbar_settings => 'Einstellungen';

  @override
  String get appbar_home => 'Startseite';

  @override
  String get appbar_search => 'Suchen';

  @override
  String get appbar_add => 'Hinzufügen';

  @override
  String get appbar_settings => 'Einstellungen';

  @override
  String get add_title_label => 'Titel';

  @override
  String get add_title_required => 'Bitte Titel eingeben';

  @override
  String get add_article_number_label => 'Artikelnummer';

  @override
  String get add_description_label => 'Beschreibung';

  @override
  String get add_quantity_label => 'Anzahl';

  @override
  String get add_price_label => 'Preis (€)';

  @override
  String get add_location_label => 'Lagerplatz';

  @override
  String get add_location_hint => 'Wähle einen Lagerplatz';

  @override
  String get add_location_required => 'Bitte Lagerplatz wählen';

  @override
  String get add_new_location => 'Neu hinzufügen...';

  @override
  String get add_save_button => 'In Datenbank speichern';

  @override
  String get add_dialog_title => 'Neuen Lagerplatz hinzufügen';

  @override
  String get add_dialog_hint => 'Z.B. Regal C3';

  @override
  String get add_dialog_cancel => 'Abbrechen';

  @override
  String get add_dialog_add => 'Hinzufügen';

  @override
  String get add_save_success =>
      'Teil und Lagerplatz erfolgreich verknüpft und gespeichert!';

  @override
  String add_save_error(Object error) {
    return 'Fehler beim Speichern: $error';
  }

  @override
  String home_load_error(Object error) {
    return 'Fehler beim Laden: $error';
  }

  @override
  String get home_empty_state =>
      'Noch keine Teile eingetragen.\nNutze das Plus-Symbol, um Daten hinzuzufügen.';

  @override
  String home_article_number_prefix(Object value) {
    return 'Art.-Nr: $value';
  }

  @override
  String get search_title_label => 'Teile nach Titel suchen';

  @override
  String get search_title_hint => 'z. B. Schraube, Motor, Gehäuse';

  @override
  String get search_filter_room_label => 'Nach Lagerort filtern';

  @override
  String get search_filter_room_all => 'Alle Lagerorte';

  @override
  String get search_sort_label => 'Sortieren nach';

  @override
  String get search_sort_title => 'Titel';

  @override
  String get search_sort_price => 'Preis';

  @override
  String get search_sort_quantity => 'Stückzahl';

  @override
  String search_error_loading_parts(Object error) {
    return 'Fehler beim Laden der Teile: $error';
  }

  @override
  String search_error_loading_rooms(Object error) {
    return 'Fehler beim Laden der Lagerorte: $error';
  }

  @override
  String get search_empty_parts => 'Noch keine Teile vorhanden.';

  @override
  String get search_no_results => 'Keine Treffer für diese Filter.';

  @override
  String search_room_prefix(Object value) {
    return 'Lagerort: $value';
  }

  @override
  String get update_section_title => 'Update-System';

  @override
  String get update_section_description =>
      'Nach neuen Versionen suchen und sie später bei Bedarf installieren.';

  @override
  String get update_current_version_label => 'Aktuelle Version';

  @override
  String get update_latest_version_label => 'Neueste Version';

  @override
  String get update_last_checked_label => 'Zuletzt geprüft';

  @override
  String get update_status_label => 'Status';

  @override
  String get update_status_not_checked => 'Noch nicht geprüft';

  @override
  String get update_status_checking => 'Suche nach Updates...';

  @override
  String get update_status_up_to_date => 'Du bist auf dem neuesten Stand';

  @override
  String get update_status_update_available => 'Update verfügbar';

  @override
  String get update_status_downloaded =>
      'Update heruntergeladen und bereit zur Installation';

  @override
  String get update_check_button => 'Jetzt prüfen';

  @override
  String get update_install_button => 'Update installieren';

  @override
  String get update_no_download =>
      'Noch kein heruntergeladenes Update verfügbar.';

  @override
  String update_error_prefix(Object error) {
    return 'Fehler: $error';
  }

  @override
  String get settings_version_label => 'App-Version';

  @override
  String get settings_github_title => 'GitHub Repository';

  @override
  String get settings_github_subtitle => 'Quellcode und Releases ansehen';
}
