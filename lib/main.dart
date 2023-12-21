import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:medway_app/controller/providers/appointment_provider.dart';
import 'package:medway_app/controller/providers/doctors_list_provider.dart';
import 'package:medway_app/controller/providers/main_screen_provider.dart';
import 'package:medway_app/model/cancel_model/canceled_model.dart';
import 'package:medway_app/model/favourite_model/fvrt_model.dart';
import 'package:medway_app/model/patient_model/patient_model.dart';
import 'package:medway_app/model/profile_model/profile_model.dart';
import 'package:medway_app/view/welcome_pages/splash_screen.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainScreenProvider>(
          create: (context) => MainScreenProvider(),
        ),
        ChangeNotifierProvider<AppointmentProvider>(
          create: (context) => AppointmentProvider(),
        ),
        ChangeNotifierProvider<DoctorsListProvider>(
          create: (context) => DoctorsListProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
