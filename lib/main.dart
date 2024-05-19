import 'package:flutter/material.dart';
import 'package:streams_example/counter_stream.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamExamples(title: 'Stream Examples'),
    );
  }
}

class StreamExamples extends StatefulWidget {
  const StreamExamples({super.key, required this.title});
  final String title;
  @override
  State<StreamExamples> createState() => _StreamExamplesState();
}

class _StreamExamplesState extends State<StreamExamples> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => CounterStream.listen(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          widget.title,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<int>(
              stream: CounterStream.stream,
              initialData: CounterStream.counter,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return Text(
                  'Counter: ${snapshot.data}',
                  style: const TextStyle(fontSize: 24.0),
                );
              },
            ),
            StreamBuilder<int>(
              stream: CounterStream.stream,
              initialData: CounterStream.counter,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return Text(
                  'Counter: ${snapshot.data}',
                  style: const TextStyle(fontSize: 24.0),
                );
              },
            ),
            ElevatedButton(
                onPressed: () => CounterStream.autoIncrement(),
                child: const Text('Auto Increment')),
            ElevatedButton(
                onPressed: () => CounterStream.stopTimer(),
                child: const Text('Stop Timer')),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => CounterStream.increment(),
            heroTag: UniqueKey(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () => CounterStream.decrement(),
            heroTag: UniqueKey(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
