import 'package:flutter/material.dart';

class DisableScreen extends StatelessWidget {
  const DisableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Disable')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Toggle profile logic
                // Execute ADB command: adb shell pm disable package_name
              },
              child: const Text('Toggle Profile'),
            ),
            ElevatedButton(
              onPressed: () {
                // Edit profile logic
              },
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
