import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:food_app/core/services/service_locator.dart';
import 'package:food_app/core/utils/app_themes.dart';

import 'core/network/supabase/supabase_services.dart';
import 'core/route/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  setupServiceLocator();
  await getIt<SupabaseServices>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Food App',
      theme: AppThemes.theme,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
