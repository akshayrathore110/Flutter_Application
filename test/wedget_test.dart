import 'package:com.cocksukergoogle.com/disable_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:com.cocksukergoogle.com/main.dart';

void main() {
  group('Widget Tests', () {
    testWidgets('Home Screen Widgets Test', (WidgetTester tester) async {
      // Build HomeScreen widget
      await tester.pumpWidget(const MaterialApp(
        home: HomeScreen(),
        title: 'Performance Booster', // Set the app display name
      ));

      // Find widgets in the HomeScreen
      final appBarTitleFinder = find.text('Performance Optimizer');
      final elevatedButtonFinder = find.byType(ElevatedButton);
      final textFinder = find.text('Use this command to grant permissions:');

      // Verify that the widgets are present in the HomeScreen
      expect(appBarTitleFinder, findsOneWidget);
      expect(elevatedButtonFinder, findsOneWidget);
      expect(textFinder, findsOneWidget);

      // Tap on the ElevatedButton to check if it triggers navigation
      await tester.tap(elevatedButtonFinder);
      await tester.pump();

      // Verify that the navigation to another screen occurred
      expect(find.byType(DisableScreen), findsOneWidget);
    });

    testWidgets('Disable Screen Widgets Test', (WidgetTester tester) async {
      // Build DisableScreen widget
      await tester.pumpWidget(const MaterialApp(
        home: DisableScreen(),
        title: 'Performance Booster', // Set the app display name
      ));

      // Find widgets in the DisableScreen
      final appBarTitleFinder = find.text('Disable');
      final toggleProfileButtonFinder = find.text('Toggle Profile');
      final editProfileButtonFinder = find.text('Edit Profile');

      // Verify that the widgets are present in the DisableScreen
      expect(appBarTitleFinder, findsOneWidget);
      expect(toggleProfileButtonFinder, findsOneWidget);
      expect(editProfileButtonFinder, findsOneWidget);

      // Tap on the Toggle Profile button and verify its functionality
      await tester.tap(toggleProfileButtonFinder);
      await tester.pump();

      // Verify that the profile toggle logic is working as expected
      // You can add more detailed tests for profile toggling here
    });

    // Add more widget tests for other screens (ResolutionScreen, BoostScreen) as needed
  });
}
