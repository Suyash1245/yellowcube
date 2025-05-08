import 'package:flutter/material.dart';
import 'package:yellow/screens/signin.dart';
import 'package:yellow/screens/signup.dart';
import 'package:yellow/screens/home.dart';
import 'package:yellow/auth/auth_gate.dart'; // Import the AuthGate
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Important for async initialization

  await Supabase.initialize(
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFucWN6ZGZpb25peHZraWJkbWR1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY2MjgyMDIsImV4cCI6MjA2MjIwNDIwMn0.jZeZ2we013c2yxGkxTtEULXnfBzidpXpguwWqfB31fA',
    url: 'https://anqczdfionixvkibdmdu.supabase.co',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Replace initialRoute with home set to AuthGate
      home: const AuthGate(),
      routes: {
        '/signin': (context) => const SignIn(),
        '/signup': (context) => const Signup(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
