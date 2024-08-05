import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchModel extends ChangeNotifier {
  bool _isRunning = false;
  Duration _elapsed = Duration.zero;
  Timer? _timer;

  bool get isRunning => _isRunning;
  Duration get elapsed => _elapsed;

  void start() {
    if (_isRunning) return;
    _isRunning = true;
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      _elapsed += Duration(milliseconds: 10);
      notifyListeners();
    });
    notifyListeners();
  }

  void pause() {
    if (!_isRunning) return;
    _isRunning = false;
    _timer?.cancel();
    notifyListeners();
  }

  void reset() {
    _isRunning = false;
    _timer?.cancel();
    _elapsed = Duration.zero;
    notifyListeners();
  }
}
