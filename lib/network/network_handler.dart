import 'dart:convert';
import 'package:accurate/constants/extensions.dart';
import 'package:http/http.dart' as http;
import 'package:either_dart/either.dart';

import '../models/my_error.dart';

class NetworkHandler {
  static const String _baseUrl =
      "https://accurate.lg.accuratess.com:8443/graphql";

  static Future<Either<MyError, Map<String, dynamic>>> post({
    required String query,
    Map<String, dynamic>? variables,
  }) async {
    final token = sharedPrefs.getString("token");

    final bodyMap = {
      "query": query,
      "variables": variables ?? {},
    };

    print("🔹GraphQL Request:");
    print(jsonEncode(bodyMap));

    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {
        "Content-Type": "application/json",
        if (token != null) "Authorization": "Bearer $token",
      },
      body: jsonEncode(bodyMap),
    );

    print("✅GraphQL Response:");

    print(response.body);

    final decoded = jsonDecode(response.body);

    if (decoded["errors"] != null && decoded["errors"] is List) {
      final error = decoded["errors"][0];
      return Left(MyError.fromGraphQL(error));
    }

    if (response.statusCode == 200) {
      return Right(decoded["data"] ?? {});
    } else {
      return Left(
        MyError(message: "Server Error: ${response.statusCode}", code: null),
      );
    }
  }
}
