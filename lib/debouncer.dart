import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  final int milliseconds;
  Timer? timer;

  Debouncer({required this.milliseconds});

  void call(VoidCallback callback) {
    timer?.cancel();
    timer = Timer(Duration(milliseconds: milliseconds), callback);
  }
}
