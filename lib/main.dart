import 'package:flutter/material.dart';
import 'package:food_app/core/services/service_locator.dart';
import 'package:food_app/core/utils/app_themes.dart';

import 'core/network/supabase/supabase_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIt<SupabaseServices>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      theme: AppThemes.theme,
    );
  }
}
