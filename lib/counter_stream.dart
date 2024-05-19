import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:streams_example/second_screen.dart';

class CounterStream {
  static final StreamController<int> _controller =
      StreamController<int>.broadcast();
  static StreamSubscription<int>? subscription;
  static Stream<int> get stream => _controller.stream;

  static int _counter = 0;
  static int get counter => _counter;

  static Timer? timer;
  static void listen(BuildContext context) {
    subscription = _controller.stream.listen(
      (event) {
        if (kDebugMode) {
          print(event);
        }
        if (event == 10) {
          controllerPause();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SecondScreen()),
          );
        }
      },
    );
  }

  static void increment() {
    _counter++;
    _controller.sink.add(_counter);
  }

  static void decrement() {
    _counter--;
    _controller.sink.add(_counter);
  }

  static void autoIncrement() {
    if (timer?.isActive ?? false) {
      timer?.cancel();
    }
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      increment();
    });
  }

  static void stopTimer() {
    timer?.cancel();
  }

  static void controllerPause() {
    debugPrint('CONTROLLER CLOSED');
    subscription?.pause();
    stopTimer();
  }
}
