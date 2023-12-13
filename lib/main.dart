import 'package:flutter/material.dart';
import 'app.dart';
import 'injection.dart';

void main() {
  Injector().initInjector();
  runApp(const MyApp());
}
