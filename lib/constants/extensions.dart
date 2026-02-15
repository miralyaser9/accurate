import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences sharedPrefs;

extension ExtBox on num {
  SizedBox get sbh => SizedBox(height: toDouble());

  SizedBox get sbw => SizedBox(width: toDouble());
}
