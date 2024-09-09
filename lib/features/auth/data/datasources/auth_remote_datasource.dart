import 'package:blog_app/core/error/exception.dart';
import 'package:blog_app/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDatasource {
  Session? get currentUserSession;
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> logInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<UserModel?> getCurrentUserData();

  // Future<UserModel?> logOutCurrentUser();
}

// In this class you can Implement the actual logic
//This class also called a General Class for implementation of the interface class Above
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final SupabaseClient supabaseClient;
  AuthRemoteDatasourceImpl(
    this.supabaseClient,
  );

  // @override
  // Future<UserModel?> logOutCurrentUser() async {
  //   try {
  //     if (currentUserSession != null) {
  //       await supabaseClient.auth.signOut();
  //     }
  //     return null;
  //   } catch (e) {
  //     throw ServerException(e.toString());
  //   }
  // }

  @override
  Session? get currentUserSession => supabaseClient.auth.currentSession;

  @override
  Future<UserModel?> getCurrentUserData() async {
    try {
      if (currentUserSession != null) {
        final userData = await supabaseClient.from("profiles").select().eq(
              'id',
              currentUserSession!.user.id,
            );
        return UserModel.fromJson(userData.first)
            .copyWith(email: currentUserSession!.user.email);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
    return null;
  }

  @override
  Future<UserModel> logInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw ServerException("Empty User");
      }
      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth
          .signUp(password: password, email: email, data: {
        'name': name,
      });

      if (response.user == null) {
        throw ServerException("User is null");
      }
      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
