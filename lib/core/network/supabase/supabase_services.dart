import 'package:supabase_flutter/supabase_flutter.dart';

import 'supabase_keys.dart';

class SupabaseServices {

  late final SupabaseClient client;

  Future<void> init() async{
    await Supabase.initialize(url: SupabaseKeys.url, publishableKey: SupabaseKeys.publicKey);
    client = Supabase.instance.client;
  }
}