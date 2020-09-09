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
  "password": "Password",
  "forgotPassword": "Forgot Password?",
  "login": "Login",
  "or": "- OR -",
  "signInWith": "Sign in with",
  "dontHaveAccount": "Don't have an Account? "
};
static const Map<String,dynamic> tr = {
  "signIn": "Giriş Yap",
  "signUp": "Kayıt Ol",
  "email": "Email",
  "password": "Şifre",
  "forgotPassword": "Şifremi Unuttum",
  "login": "Giriş Yap",
  "or": "- veya -",
  "signInWith": " ",
  "dontHaveAccount": "Hesabın yok mu? "
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "tr": tr};
}
