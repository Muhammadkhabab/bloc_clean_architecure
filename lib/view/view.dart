/// A barrel file is essentially a Dart file (e.g., exports.dart) that contains export
/// statements for other Dart files in a directory. Instead of
/// importing multiple files individually, you can import everything through the barrel file.
library;

//this is the barrel file we export all the screen in one file that screen we import int he routes screen
export 'splash/splash.dart';
export 'auth/login/login.dart';
export 'home/home.dart';
