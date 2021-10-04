import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerapp/controller/user_notifier.dart';
import 'package:providerapp/screens/home.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserNotifier()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color(0xFF2F5233)),
        primaryColor: Color(0xFF2F5233),
        backgroundColor: Color(0xFFDCDCDC),
      ),
      home: MyHomePage(),
    );
  }
}
