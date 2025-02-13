import 'package:clean_code_bloc/config/routes/routes.dart';
import 'package:clean_code_bloc/config/routes/routes_name.dart';
import 'package:clean_code_bloc/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.themeData,
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoute, // Generating routes,
    );
  }
}
