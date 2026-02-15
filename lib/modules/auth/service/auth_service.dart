import 'package:either_dart/either.dart';

import '../../../models/my_error.dart';

abstract class AuthService {
  Future<Either<MyError, String>> login({required String username,required String password } );

}