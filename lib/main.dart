import 'dart:math';

import 'package:example/screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shorebird Demo!',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _timeTaken = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            child: Image.network(
              'https://i.giphy.com/media/g79am6uuZJKSc/giphy.webp',
            ),
          ),
          Text(
            'This is not fine $_timeTaken',
            style: const TextStyle(
              fontSize: 48,
              color: Colors.white,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final timer = Stopwatch();
          timer.start();
          // write a heavy operation here
          // like a big loop
          heavyLoop();
          timer.stop();
          print('Time taken: ${timer.elapsed}');
          setState(() {
            _timeTaken = timer.elapsed.toString();
          });
        },
        tooltip: 'Shorebird',
        child: const Icon(Icons.add),
      ),
    );
  }

  void heavyLoop() {
    var latest = 0;
    for (var i = 0; i < 1000000000; i++) {
      latest += i ^ Random().nextInt(1000000);
    }
    // ignore: avoid_print
    print(latest);
  }
}
