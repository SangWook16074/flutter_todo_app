import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todo_app/firebase_options.dart';
import 'package:flutter_todo_app/src/binding/init_binding.dart';
import 'package:flutter_todo_app/src/ui/pages/onboarding.dart';
import 'package:get/get.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          backgroundColor: const Color.fromARGB(255, 0, 12, 49),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 0, 12, 49),
          )),
      home: const OnBoard(),
      initialBinding: InitBinding(),
    );
  }
}
