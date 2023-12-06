import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:medway_app/model/data_model.dart';
import 'package:medway_app/screens/main_screen.dart';
import 'package:medway_app/screens/splash_screen.dart';

const save_key_name = 'userloggedin';
void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  if (!Hive.isAdapterRegistered(PatientModelAdapter().typeId)) {
    Hive.registerAdapter(PatientModelAdapter());
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
