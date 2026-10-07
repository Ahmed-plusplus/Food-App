import 'package:food_app/core/network/api/end_points.dart';

class ErrorModel {
  // final int status;
  final String errorMessage;

  ErrorModel({required this.errorMessage});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      // status: jsonData[ApiKey.status],
      errorMessage: jsonData[ApiKey.message] ?? jsonData[ApiKey.error] ?? 'Unknown error',
    );
  }
}
