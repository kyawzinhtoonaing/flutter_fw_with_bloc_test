import 'package:im_exchange_fw_test/zmock/db/db_client.dart';
import 'package:im_exchange_fw_test/zmock/db/db_table_names.dart';

import '../domain/dto/symbol_creation_dto.dart';
import '../domain/model/symbol_model.dart';

class SymbolAPI {
  final DBClient dbClient;

  // Constructor
  SymbolAPI({required this.dbClient});

  Future<void> createSymbol(SymbolCreationDto symbolCreationDto) async {
    await dbClient.putData(symbolTable,
        SymbolModel(id: symbolCreationDto.id, name: symbolCreationDto.name));
  }

  Future<List<SymbolModel>> retrievalAllSymbol() async {
    return await dbClient.getAllData(symbolTable) as List<SymbolModel>;
  }
}
