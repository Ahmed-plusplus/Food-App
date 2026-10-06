import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class SupabaseKeys {
  static final url = dotenv.get('SB_URL');
  static final publicKey = dotenv.get('SB_PUBLISH_KEY');

  static const authHeader = 'Authentication';
  static String bearerAuth(String token) => 'Bearer $token';


}