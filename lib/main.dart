import 'package:calculadora/provider/firebase_provider.dart';
import 'package:calculadora/services/auth/auth_gate.dart';
import 'package:calculadora/services/auth/auth_service.dart';
import 'package:calculadora/src/calc_page.dart';
import 'package:calculadora/src/controllers/theme.dart';
import 'package:calculadora/src/conversas.dart';
import 'package:calculadora/src/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:calculadora/src/controllers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  timeago.setLocaleMessages('pt_br', timeago.PtBrShortMessages());
  runApp(
    
    
    ChangeNotifierProvider(
      
      create: (context) =>ThemeProvider(),

    child: MyApp()));
    ChangeNotifierProvider(
      
      create: (context) => AuthService(),);
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Future<FirebaseApp> _inicializacao = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) =>
    ChangeNotifierProvider(
      create: (_) => FirebaseProvider(),
     child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: AuthGate(),
      
    )
    );
}



