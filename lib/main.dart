import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:medway_app/model/canceled_model.dart';
import 'package:medway_app/model/patient_model.dart';
import 'package:medway_app/model/fvrt_model.dart';
import 'package:medway_app/model/profile_model.dart';
import 'package:medway_app/screens/splash_screen.dart';

// ignore: constant_identifier_names
const save_key_name = 'userloggedin';
void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  if (!Hive.isAdapterRegistered(PatientModelAdapter().typeId)) {
    Hive.registerAdapter(PatientModelAdapter());
  }
  if (!Hive.isAdapterRegistered(UserModelAdapter().typeId)) {
    Hive.registerAdapter(UserModelAdapter());
  }

  if (!Hive.isAdapterRegistered(FavouriteModelAdapter().typeId)) {
    Hive.registerAdapter(FavouriteModelAdapter());
  }
  if (!Hive.isAdapterRegistered(CanceldModelAdapter().typeId)) {
    Hive.registerAdapter(CanceldModelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
