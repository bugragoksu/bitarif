// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "signIn": "Sign in",
  "signUp": "Sign Up",
  "email": "Email",
  "name": "Name",
  "password": "Password",
  "forgotPassword": "Forgot Password?",
  "login": "Login",
  "register": "Register",
  "or": "- OR -",
  "signInWith": "Sign in with",
  "dontHaveAccount": "Don't have an Account? ",
  "haveAccount": "Already register? ",
  "agreeTo": "By signing up you agree to ",
  "terms": "the terms of service ",
  "privacy": "privacy policy.",
  "and": "and ",
  "welcome": "Welcome"
};
static const Map<String,dynamic> tr = {
  "signIn": "Giriş Yap",
  "signUp": "Kayıt Ol",
  "email": "Email",
  "name": "Ad",
  "password": "Şifre",
  "forgotPassword": "Şifremi Unuttum",
  "login": "Giriş Yap",
  "register": "Kayıt Ol",
  "or": "- veya -",
  "signInWith": " ",
  "dontHaveAccount": "Hesabın yok mu? ",
  "haveAccount": "Zaten kayıtlı mısın? ",
  "agreeTo": "Giriş yaparak kabul etmiş olursunuz :",
  "terms": "Kullanım Şartları ",
  "privacy": "Gizlilik Sözleşmesi.",
  "and": "ve ",
  "welcome": "Hoşgeldin"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "tr": tr};
}
