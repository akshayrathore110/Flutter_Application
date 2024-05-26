import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'disable_screen.dart';
import 'resolution_screen.dart';
import 'boost_screen.dart';


void main() {
  runApp(const PerformanceOptimizerApp());
}

class PerformanceOptimizerApp extends StatelessWidget {
  const PerformanceOptimizerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Performance Optimizer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Performance Optimizer')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                // Check if permissions are granted
                var status = await Permission.storage.status;
                if (!status.isGranted) {
                  await Permission.storage.request();
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setBool('permissions_granted', true);
                }
                // Navigate to other screens based on permissions
                // ignore: use_build_context_synchronously
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DisableScreen()));
              },
              child: const Text('Grant Permissions and Continue'),
            ),
            const SizedBox(height: 20),
            const Text('Use this command to grant permissions:'),
            const Text('adb shell pm grant your.package.name android.permission.MANAGE_EXTERNAL_STORAGE'),
          ],
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(decoration: BoxDecoration(color: Colors.blue), child: Text('Menu')),
          ListTile(
            title: const Text('Home'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen())),
          ),
          ListTile(
            title: const Text('Disable'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DisableScreen())),
          ),
          ListTile(
            title: const Text('Resolution'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ResolutionScreen())),
          ),
          ListTile(
            title: const Text('Boost'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const BoostScreen())),
          ),
        ],
      ),
    );
  }
}
Future<void> checkAndRequestPermission() async {
  var status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  }
}
void handlePermissionStatus() async {
  var status = await Permission.storage.status;
  if (status.isGranted) {
    // Permission is granted, proceed with your app logic
  } else if (status.isDenied) {
    // Permission is denied, show a message or take appropriate action
  } else if (status.isPermanentlyDenied) {
    // Permission is permanently denied, show a dialog to open app settings
    openAppSettings();
  }
}
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Permissions Example')),
    body: Center(
      child: ElevatedButton(
        onPressed: () async {
          await checkAndRequestPermission();
          handlePermissionStatus();
        },
        child: const Text('Check and Request Permission'),
      ),
    ),
  );
}
Future<void> checkAndRequestPermissions() async {
  // ignore: unused_local_variable
  Map<Permission, PermissionStatus> statuses = await [
    Permission.storage,
    Permission.camera,
  ].request();
  // Handle statuses for each permission
}
