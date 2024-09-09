import 'package:blog_app/core/error/exception.dart';
import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:blog_app/core/entities/user.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;
  AuthRepositoryImpl(this.remoteDatasource);

  // @override
  // Future<Either<Failure, User>> logoutUser() async {
  //   try {
  //     final user = await remoteDatasource.logOutCurrentUser();

  //     if (user == null) {
  //       return left(Failure('Cannot logged out user'));
  //     }
  //     return right(user);
  //   } on ServerException catch (e) {
  //     throw ServerException(e.message);
  //   }
  // }

  @override
  Future<Either<Failure, User>> currentUser() async {
    try {
      final user = await remoteDatasource.getCurrentUserData();
      if (user == null) {
        return left(Failure('User not Logged in'));
      }
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> logInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteDatasource.logInWithEmailPassword(
        email: email,
        password: password,
      );
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteDatasource.signUpWithEmailPassword(
          name: name, email: email, password: password);

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
