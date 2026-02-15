import 'package:accurate/modules/auth/service/auth_service.dart';
import 'package:either_dart/either.dart';

import '../../../models/my_error.dart';
import '../../../network/network_handler.dart';

class AuthServiceImpl implements AuthService {
  @override
  Future<Either<MyError, String>> login({
    required String username,
    required String password,
  }) async {
    final String mutation =
        """
      mutation {
        login(
          input: {
            username: "$username"
            password: "$password"
          }
        ) {
          token
          expiresAt
        }
      }
    """;

    final result = await NetworkHandler.post(query: mutation);

    return result.either(
      (left) => MyError(message: left.message),
      (data) {
        final token = data["login"]?["token"];
        return token;
      },
    );
  }
}
