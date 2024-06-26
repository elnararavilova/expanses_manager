import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/theme_viewmodel.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeViewModel = Provider.of<ThemeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Настройки'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text('Темная тема'),
              trailing: Switch(
                value: themeViewModel.isDarkMode,
                onChanged: (value) {
                  themeViewModel.toggleTheme();
                },
              ),
            ),
            ListTile(
              title: Text('Выбор валюты'),
              trailing: DropdownButton<String>(
                value: themeViewModel.currency,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    themeViewModel.setCurrency(newValue);
                  }
                },
                items: <String>['USD', 'EUR', 'RUB', 'JPY']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
