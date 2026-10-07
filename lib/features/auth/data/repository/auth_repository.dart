import 'package:dartz/dartz.dart';
import 'package:food_app/core/network/errors/failure.dart';
import 'package:food_app/core/network/supabase/supabase_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository {
  Future<Either<Failure, dynamic>> login(String email, String password);
}

class AuthRepositoryImpl extends AuthRepository {
  final SupabaseServices _supabase;

  AuthRepositoryImpl({required this._supabase});

  @override
  Future<Either<Failure, dynamic>> login(String email, String password) async {
    try {
      final response = await _supabase.client.auth.signInWithPassword(email: email, password: password);
      return Right(response);
    } on AuthException catch (e) {
      return Left(Failure(errMessage: e.message));
    } on Exception catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }
}