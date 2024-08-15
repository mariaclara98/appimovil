import 'package:flutter/material.dart';
import 'package:flutter_movie_api/src/screens/home_page.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

//0. Inicio de la ejecución
void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

// whenever your initialization is completed, remove the splash screen:

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData myTheme = ThemeData(primarySwatch: Colors.orange);

    //1. MaterialApp inicializa la Aplicación móvil
    MaterialApp myApp = MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Proyecto API",
      home: const MyHomePage(title: "Top 100 Películas"),
      theme: myTheme,
    );

    return myApp;
  }
}
