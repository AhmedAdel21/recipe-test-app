import 'package:flutter/foundation.dart';

bool isNotNull(Object? ob) => ob != null;

void securePrint(Object? object) {
  if (kDebugMode) {
    print(object);
  }
}
