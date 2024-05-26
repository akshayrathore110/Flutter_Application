import 'package:flutter/material.dart';

class ResolutionScreen extends StatelessWidget {
  const ResolutionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resolution')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Change Resolution:'),
            ElevatedButton(
              onPressed: () {
                // Adjust resolution logic
                // Execute ADB command: adb shell wm size <width>x<height>
                // Execute ADB command: adb shell wm density <dpi>
              },
              child: const Text('Adjust Resolution'),
            ),
            const SizedBox(height: 20),
            const Text('Current resolution scale: x.x'),
          ],
        ),
      ),
    );
  }
}
