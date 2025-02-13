import 'package:clean_code_bloc/services/splash_serivces/splash_serivces.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices _splashServices = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Splash Screen'),
      ),
      body: Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
