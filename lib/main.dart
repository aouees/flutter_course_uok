import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:device_preview/device_preview.dart';
import '/lec2-1/lec21.dart';
import '/lec2/lect2.dart';
import '/wf/homepage.dart';




void main()async {
runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(), // Wrap your app
  ),

  //const MyApp()
);

}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Course',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        //useMaterial3: true,
        colorScheme: const ColorScheme.light().copyWith(
            primary: Colors.blue[900],
            secondary: Colors.blue[900],
            onSecondary: Colors.white
          ),
          textTheme: const TextTheme(
              titleLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          ),

      ),
     // home:  const Home(),
      home: const HomePage(),
    );
  }
}
