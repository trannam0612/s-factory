import 'package:s_factory/data/datasource/local/auth_local_datasource.dart';
import 'package:s_factory/data/datasource/remote/auth_remote_data_source.dart';
import 'package:s_factory/domain/entities/auth_entities.dart';
import 'package:s_factory/domain/entities/data_state.dart';
import 'package:s_factory/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this._authRemoteDataSource, this._authLocalDataSource);
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  @override
  Future<DataState<AuthEntity>> login(
      String phoneNumber, String password) async {
    DataState<AuthEntity> response =
        await _authRemoteDataSource.login(phoneNumber, password);
    if (response.isSuccess()) {
      final String? token = response.data?.token;
      if (token != null) {
        _authRemoteDataSource.setNewToken(token);
      }
    }
    return response;
  }
}
