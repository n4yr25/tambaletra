import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tambaletra/models/board_adapter.dart';
import 'package:tambaletra/screens/game.dart';
import 'package:tambaletra/screens/home.dart';

void main() async {
  //Allow only portrait mode on Android & iOS
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  //Make sure Hive is initialized first and only after register the adapter.
  await Hive.initFlutter();
  Hive.registerAdapter(BoardAdapter());
  runApp(const ProviderScope(
    child: MaterialApp(
      title: '2048',
      home: Home(),
    ),
  ));
}
