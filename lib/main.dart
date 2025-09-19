import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Importe firebase_core
import 'firebase_options.dart'; // Assure-toi que ce fichier est généré et importé

import 'features/authentication/presentation/screens/login_screen.dart'; // Importe ton LoginScreen

Future<void> main() async {
  // Assure-toi que les widgets Flutter sont initialisés avant d'utiliser Firebase
  WidgetsFlutterBinding.ensureInitialized();

  // Initialise Firebase avec les options spécifiques à ta plateforme
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ibrahim Gen-Track App', // Titre de ton application
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
        ), // Tu peux changer la couleur
        useMaterial3: true, // Utilise Material 3 pour un look moderne
      ),
      // Ici, on lance directement le LoginScreen
      // La gestion de la navigation (vers l'accueil après connexion) sera ajoutée plus tard
      home: const LoginScreen(), // Affiche le LoginScreen par défaut
    );
  }
}

// Les classes MyHomePage et _MyHomePageState ne sont plus nécessaires pour le moment,
// car nous avons remplacé la home page par le LoginScreen.
// Tu peux les supprimer ou les commenter si tu le souhaites pour garder le code propre.
