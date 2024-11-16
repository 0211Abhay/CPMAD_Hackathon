import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'collections_viewer.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb
import 'firebase_options.dart'; // Import your firebase_options.dart


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Ensure Firebase is initialized with the correct options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,  // Pass the correct platform-specific options
  );


  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Academic Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthStateHandler(),
    );
  }
}

class AuthStateHandler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return CollectionsViewer();
        } else {
          return LoginPage();
        }
      },

    );
  }
}
