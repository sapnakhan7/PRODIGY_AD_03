import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'stopwatch_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => StopwatchModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stopwatch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StopwatchPage(),
    );
  }
}

class StopwatchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stopwatch = Provider.of<StopwatchModel>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent app bar
        elevation: 0,
        centerTitle: true,
        title: const Text('STOPWATCH' , style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body: Stack(
        children: [
          // Background Image with Transparency
          Positioned.fill(
            child: Opacity(
              opacity: 0.6, // Adjust opacity as needed
              child: Image.asset(
                'assets/images/background.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Stopwatch UI
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${stopwatch.elapsed.inMinutes.toString().padLeft(2, '0')}:${(stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0')}:${(stopwatch.elapsed.inMilliseconds % 1000).toString().padLeft(3, '0')}',
                  style: TextStyle(fontSize: 48, color: Colors.white),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: stopwatch.isRunning ? stopwatch.pause : stopwatch.start,
                      child: Text(stopwatch.isRunning ? 'Pause' : 'Start'),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: stopwatch.reset,
                      child: Text('Reset'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
