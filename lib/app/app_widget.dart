import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';

class AppWidget extends StatelessWidget {
  final AppController appController = Modular.get<AppController>();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return MaterialApp(
          navigatorKey: Modular.navigatorKey,
          title: 'Chat Online',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.blue,
            buttonTheme: ButtonThemeData(
              buttonColor: Colors.blue,     //  <-- dark color
              textTheme: ButtonTextTheme.primary, //  <-- this auto selects the right color
            ),
            inputDecorationTheme: InputDecorationTheme(
              fillColor: Colors.blue,
            ),
            
          ),
          themeMode: appController.isDark ? ThemeMode.dark : ThemeMode.light,
          darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.blue,
              cursorColor: Colors.lightGreen,
              inputDecorationTheme: InputDecorationTheme(
              fillColor: Color.fromRGBO(42, 42, 42, 1),
            )
          ),
          initialRoute: '/',
          onGenerateRoute: Modular.generateRoute,
        );
      },
    );
  }
}
