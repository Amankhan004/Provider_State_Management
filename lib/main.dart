import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/slider_provider.dart';
import 'package:provider_state_management/screen/slider_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => SliderProvider())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Provider State Management',
          home: SliderScreen(),
        ));
  }
}
