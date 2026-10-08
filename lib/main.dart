import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'services/plant_cabinet_service.dart';

Future<void> main() async {
  // Required before using plugins such as Hive.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the offline Plant Cabinet database.
  await PlantCabinetService.initialize();

  // Start the HerbVision application.
  runApp(const HerbVisionApp());
}

class HerbVisionApp extends StatelessWidget {
  const HerbVisionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HerbVision',

      debugShowCheckedModeBanner: false,

      theme: AppTheme.light(),

      darkTheme: AppTheme.dark(),

      // HerbVision currently uses light mode.
      themeMode: ThemeMode.light,

      home: const HomeScreen(),
    );
  }
}
