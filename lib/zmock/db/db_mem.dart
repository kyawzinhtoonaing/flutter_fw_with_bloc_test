import 'package:im_exchange_fw_test/modules/symbol/services/domain/model/symbol_model.dart';
import 'package:im_exchange_fw_test/modules/user/services/domain/model/user_model.dart';
import 'package:im_exchange_fw_test/zmock/db/db_table_names.dart';

class DBMem {
  Future<void> putData(String tableName, dynamic data) async {
    (_dbTables[tableName] as List).add(data);
  }

  Future<List> getAllData(String tableName) async {
    return (_dbTables[tableName] as List);
  }
}

final _dbTables = <String, List> {
  symbolTable: _symbolTable,
  userTable: _userTable
};

final _symbolTable = <SymbolModel> [
  const SymbolModel(id: 1, name: 'symbol 1'),
  const SymbolModel(id: 2, name: 'symbol 2'),
  const SymbolModel(id: 3, name: 'symbol 3'),
];

final _userTable = <UserModel> [
  const UserModel(id: 1, name: 'user 1'),
  const UserModel(id: 2, name: 'user 2'),
  const UserModel(id: 3, name: 'user 3'),
];