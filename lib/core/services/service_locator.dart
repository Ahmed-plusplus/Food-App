import 'package:food_app/core/network/supabase/supabase_services.dart';
import 'package:food_app/features/auth/data/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<SupabaseServices>(SupabaseServices());
  final supabase = getIt<SupabaseServices>();
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl(supabase: supabase));

}