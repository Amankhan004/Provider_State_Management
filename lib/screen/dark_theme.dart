import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/theme_changer_provider.dart';
import 'package:provider_state_management/screen/val_notify_screen.dart';

class DarkThemeScreen extends StatelessWidget {
  const DarkThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Themes")),
      ),
      body: Consumer<ThemeChangerProvider>(
        builder: (context, value, child) {
          return Column(
            children: [
              RadioListTile<ThemeMode>(
                  title: Text("Light Mode"),
                  value: ThemeMode.light,
                  groupValue: value.themeMode,
                  onChanged: value.setTheme),
              RadioListTile<ThemeMode>(
                title: Text("Dark Mode"),
                value: ThemeMode.dark,
                groupValue: value.themeMode,
                onChanged: value.setTheme,
              ),
              RadioListTile<ThemeMode>(
                  title: Text("System Mode"),
                  value: ThemeMode.system,
                  groupValue: value.themeMode,
                  onChanged: value.setTheme),
              Icon(Icons.favorite),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_circle_right),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NotifiyScreen()));
          }),
    );
  }
}
