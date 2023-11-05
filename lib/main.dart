import 'package:flutter/material.dart';
import 'package:multiprovider/controllers/countercontroller.dart';
import 'package:multiprovider/controllers/imageupload.dart';
import 'package:multiprovider/views/incrementscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterController>(
          create: (context) => CounterController(),
        ),
       ChangeNotifierProvider<UploadImages>(create: (context) => UploadImages())
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const Increment()),
    );
  }
}
