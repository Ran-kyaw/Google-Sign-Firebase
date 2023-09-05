import 'package:flutter/material.dart';
import 'package:google_sign/controllerLogin.dart';
import 'package:google_sign/loginScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> ControllerLogin())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 16, 2, 38)),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
