import 'package:im_exchange_fw_test/zmock/db/db_client.dart';
import 'package:im_exchange_fw_test/zmock/db/db_table_names.dart';

import '../domain/dto/user_creation_dto.dart';
import '../domain/model/user_model.dart';

class UserAPI {
  final DBClient dbClient;

  // Constructor
  UserAPI({required this.dbClient});

  Future<void> createUser(UserCreationDto symbolCreationDto) async {
    await dbClient.putData(userTable,
        UserModel(id: symbolCreationDto.id, name: symbolCreationDto.name));
  }

  Future<List<UserModel>> retrievalAllUsers() async {
    return await dbClient.getAllData(userTable) as List<UserModel>;
  }
}
