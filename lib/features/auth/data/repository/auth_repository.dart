import 'package:food_app/core/network/supabase/supabase_services.dart';

abstract class AuthRepository {}

class AuthRepositoryImpl extends AuthRepository {
  final SupabaseServices supabase;

  AuthRepositoryImpl({required this.supabase});
}