// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hi! 👋`
  String get welcomeText1 {
    return Intl.message(
      'Hi! 👋',
      name: 'welcomeText1',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back!, You've been missed`
  String get welcomeText2 {
    return Intl.message(
      'Welcome Back!, You\'ve been missed',
      name: 'welcomeText2',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get userName {
    return Intl.message(
      'User Name',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `or sign in with`
  String get textForAnotherOptions {
    return Intl.message(
      'or sign in with',
      name: 'textForAnotherOptions',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with google account`
  String get signInWithGoogle {
    return Intl.message(
      'Sign in with google account',
      name: 'signInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with google apple`
  String get signInWithApple {
    return Intl.message(
      'Sign in with google apple',
      name: 'signInWithApple',
      desc: '',
      args: [],
    );
  }

  /// `you don't have account`
  String get youDoNotHaveAccount {
    return Intl.message(
      'you don\'t have account',
      name: 'youDoNotHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign UP`
  String get signUp {
    return Intl.message(
      'Sign UP',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your Email`
  String get pleaseEnterYourEmail {
    return Intl.message(
      'Please enter your Email',
      name: 'pleaseEnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your Password`
  String get pleaseEnterYourPassword {
    return Intl.message(
      'Please enter your Password',
      name: 'pleaseEnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your Name`
  String get pleaseEnterYourName {
    return Intl.message(
      'Please enter your Name',
      name: 'pleaseEnterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Register `
  String get register {
    return Intl.message(
      'Register ',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Now `
  String get now {
    return Intl.message(
      'Now ',
      name: 'now',
      desc: '',
      args: [],
    );
  }

  /// `Already Have Account `
  String get alreadyHaveAccount {
    return Intl.message(
      'Already Have Account ',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already Have Account `
  String get thisEmailAlreadyRegistered {
    return Intl.message(
      'Already Have Account ',
      name: 'thisEmailAlreadyRegistered',
      desc: '',
      args: [],
    );
  }

  /// `Search...`
  String get search {
    return Intl.message(
      'Search...',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Saved`
  String get saved {
    return Intl.message(
      'Saved',
      name: 'saved',
      desc: '',
      args: [],
    );
  }

  /// `Updates`
  String get updates {
    return Intl.message(
      'Updates',
      name: 'updates',
      desc: '',
      args: [],
    );
  }

  /// `FAQs`
  String get FAQs {
    return Intl.message(
      'FAQs',
      name: 'FAQs',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message(
      'Sign Out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `You are on the latest version`
  String get youAreOnLatestVersion {
    return Intl.message(
      'You are on the latest version',
      name: 'youAreOnLatestVersion',
      desc: '',
      args: [],
    );
  }

  /// `Discover more plants to save them`
  String get discoverMorePlants {
    return Intl.message(
      'Discover more plants to save them',
      name: 'discoverMorePlants',
      desc: '',
      args: [],
    );
  }

  /// `Plants always make people better, happier, and more helpful; they are sunshine, food and medicine for the soul.`
  String get splashText {
    return Intl.message(
      'Plants always make people better, happier, and more helpful; they are sunshine, food and medicine for the soul.',
      name: 'splashText',
      desc: '',
      args: [],
    );
  }

  /// `Plant Details`
  String get plantsDetails {
    return Intl.message(
      'Plant Details',
      name: 'plantsDetails',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
