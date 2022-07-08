import 'package:im_exchange_fw_test/zmock/db/db_mem.dart';

class DBClient {
  var connection = DBMem();

  Future<void> putData(String tableName, dynamic data) async {
    await connection.putData(tableName, data);
  }

  Future<List> getAllData(String tableName) async {
    return await connection.getAllData(tableName);
  }
}