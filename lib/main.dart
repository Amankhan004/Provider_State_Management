import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/favouriteitem_provider.dart';
import 'package:provider_state_management/provider/slider_provider.dart';
import 'package:provider_state_management/provider/theme_changer_provider.dart';
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
        providers: [
          ChangeNotifierProvider(create: (_) => SliderProvider()),
          ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
        ],
        child: Builder(
          builder: (context) {
            final themeChanger = Provider.of<ThemeChangerProvider>(context);
            return MaterialApp(
              themeMode: themeChanger.themeMode,
              theme: ThemeData(
                  brightness: Brightness.light,
                  primarySwatch: Colors.red,
                  iconTheme: IconThemeData(color: Colors.red)),
              darkTheme: ThemeData(
                  iconTheme: IconThemeData(color: Colors.teal),
                  appBarTheme: AppBarTheme(backgroundColor: Colors.teal),
                  brightness: Brightness.dark,
                  primarySwatch: Colors.purple,
                  primaryColor: Colors.purple),
              debugShowCheckedModeBanner: false,
              title: 'Provider State Management',
              home: SliderScreen(),
            );
          },
        ));
  }
}
