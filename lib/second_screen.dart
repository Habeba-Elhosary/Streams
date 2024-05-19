import 'package:flutter/material.dart';
import 'package:streams_example/counter_stream.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  CounterStream counterStream = CounterStream();
  @override
  void dispose() {
    super.dispose();
    debugPrint('Dispose second screen');
    CounterStream.subscription?.resume();
    CounterStream.autoIncrement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('Second Screen')),
    );
  }
}
