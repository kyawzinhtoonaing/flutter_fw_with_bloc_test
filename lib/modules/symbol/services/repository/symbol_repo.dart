import 'package:im_exchange_fw_test/zmock/db/db_client.dart';

import '../api/symbol_api.dart';
import '../domain/dto/symbol_creation_dto.dart';
import '../domain/model/symbol_model.dart';

class SymbolRepository {
  final DBClient dbClient;

  late final SymbolAPI symbolAPI;

  // Constructor
  SymbolRepository({required this.dbClient}) {
    symbolAPI = SymbolAPI(dbClient: dbClient);
  }

  Future<void> createSymbol(SymbolCreationDto symbolCreationDto) async {
    await symbolAPI.createSymbol(symbolCreationDto);
  }

  Future<List<SymbolModel>> retrievalAllSymbol() async {
    return await symbolAPI.retrievalAllSymbol();
  }
}