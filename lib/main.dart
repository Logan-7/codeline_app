import 'package:codeline_app/view/drawer_dashboard_panel.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const apiKey = 'AIzaSyC7Ab96U2YbeC1cV4MVvGETEO0RqcbUMAI';
const projectId = 'codeline-admin';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firestore.initialize(projectId);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Codeline Admin',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
    );
  }
}
