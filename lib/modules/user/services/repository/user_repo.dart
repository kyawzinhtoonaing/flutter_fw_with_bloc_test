import 'package:im_exchange_fw_test/zmock/db/db_client.dart';

import '../api/user_api.dart';
import '../domain/dto/user_creation_dto.dart';
import '../domain/model/user_model.dart';

class UserRepository {
  final DBClient dbClient;

  late final UserAPI symbolAPI;

  // Constructor
  UserRepository({required this.dbClient}) {
    symbolAPI = UserAPI(dbClient: dbClient);
  }

  Future<void> createUser(UserCreationDto symbolCreationDto) async {
    await symbolAPI.createUser(symbolCreationDto);
  }

  Future<List<UserModel>> retrievalAllUsers() async {
    return await symbolAPI.retrievalAllUsers();
  }
}