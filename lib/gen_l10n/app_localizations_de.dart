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
}
