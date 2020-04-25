import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get appTitle {
    return Intl.message('Mindfulness', name: 'appTitle');
  }

  String get meditation {
    return Intl.message('Meditation', name: 'meditation');
  }

  String get courses {
    return Intl.message('Courses', name: 'courses');
  }

  String get sounds {
    return Intl.message('Sounds', name: 'sounds');
  }

  String get someMenuItem {
    return Intl.message('Some menu item', name: 'someMenuItem');
  }

  String get begin {
    return Intl.message('Begin', name: 'begin');
  }

  String get pause {
    return Intl.message('Pause', name: 'pause');
  }

  String get stop {
    return Intl.message('Stop', name: 'stop');
  }

  String get resume {
    return Intl.message('Resume', name: 'resume');
  }

  String get volume {
    return Intl.message('Volume', name: 'volume');
  }

  String get sound {
    return Intl.message('Sound', name: 'sound');
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['ru', 'en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
