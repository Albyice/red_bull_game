import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['it', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? itText = '',
    String? enText = '',
  }) =>
      [itText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'pqygluk4': {
      'it': 'TI METTE LE AAALIII',
      'en': '',
    },
    '7ue0fn7q': {
      'it': 'Home',
      'en': '',
    },
  },
  // quizpage
  {
    '9rczwzem': {
      'it': 'Rispondi qui ',
      'en': '',
    },
    'bjzwmt17': {
      'it': 'Result',
      'en': '',
    },
  },
  // resultpage
  {
    's0q16xgg': {
      'it': 'GRAZIE PER AVER GIOCATO !!!',
      'en': '',
    },
    'q2smvl9q': {
      'it': 'Riprova',
      'en': '',
    },
    'e9y5hd9d': {
      'it': 'Home',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'qdptmjcd': {
      'it': '',
      'en': '',
    },
    '0yp9rvp5': {
      'it': '',
      'en': '',
    },
    'c8nwyumd': {
      'it': '',
      'en': '',
    },
    'w9m4foui': {
      'it': '',
      'en': '',
    },
    'd0iq8p03': {
      'it': '',
      'en': '',
    },
    '0miqy70u': {
      'it': '',
      'en': '',
    },
    'dxbx1rmk': {
      'it': '',
      'en': '',
    },
    'o3jt8b2g': {
      'it': '',
      'en': '',
    },
    'jmd0hoa1': {
      'it': '',
      'en': '',
    },
    'n0lq8q6b': {
      'it': '',
      'en': '',
    },
    'f72v246u': {
      'it': '',
      'en': '',
    },
    'x9tbn7nl': {
      'it': '',
      'en': '',
    },
    'lvjmp4t4': {
      'it': '',
      'en': '',
    },
    '7r9rwfp5': {
      'it': '',
      'en': '',
    },
    'eljdwu0a': {
      'it': '',
      'en': '',
    },
    'nc9bgkf1': {
      'it': '',
      'en': '',
    },
    '9pgqsnbk': {
      'it': '',
      'en': '',
    },
    'nj47mnv4': {
      'it': '',
      'en': '',
    },
    'vz6lmv4h': {
      'it': '',
      'en': '',
    },
    'wylt5thr': {
      'it': '',
      'en': '',
    },
    'xezw2258': {
      'it': '',
      'en': '',
    },
    '96w7hflt': {
      'it': '',
      'en': '',
    },
    'fp4wlxv3': {
      'it': '',
      'en': '',
    },
    'j306ynck': {
      'it': '',
      'en': '',
    },
    'uxcmz4e1': {
      'it': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
