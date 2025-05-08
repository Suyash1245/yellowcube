/*


AuthGate is a widget that checks if the user is authenticated and redirects them to the appropriate screen based on their authentication status. It uses the AuthService to check the authentication status and the Navigator to redirect the user.

authenticated: If the user is authenticated, it redirects them to the HomeScreen.
unauthenticated: If the user is not authenticated, it redirects them to the LoginScreen.
*/

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yellow/screens/home.dart';
import 'package:yellow/screens/signin.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      // Correct stream access in Supabase v2.x
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        // Show loading indicator while waiting for auth state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // Safe null-aware access to session
        final session = snapshot.data?.session;

        if (session != null) {
          // User is authenticated
          return const HomePage();
        } else {
          // User is not authenticated
          return const SignIn();
        }
      },
    );
  }
}
