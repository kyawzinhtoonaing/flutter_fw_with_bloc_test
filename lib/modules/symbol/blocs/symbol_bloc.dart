import 'dart:async';

import 'package:im_exchange_fw_test/app/_registry/framework/framework_bloc.dart';
import 'package:im_exchange_fw_test/zmock/db/db_client.dart';

import '../services/domain/dto/symbol_creation_dto.dart';
import '../services/domain/model/symbol_model.dart';
import '../services/repository/symbol_repo.dart';
import 'events/symbol_creation_event.dart';
import 'states/symbol_creation_state.dart';

class SymbolBloc extends AbstractBloc {
  final store = SymbolCreatePageBlocStore();

  final DBClient dbClient;

  SymbolBloc({required this.dbClient});

  Future<void> createSymbol(SymbolCreationEvent event) async {
    // Set symbol creation progress at 'inProgressState'.
    var symbolCreationState = store.symbolCreationState.stream.value;
    symbolCreationState.progress = SymbolCreationState.inProgressState;
    store.symbolCreationState.update(symbolCreationState);

    // Actual symbol creation.
    SymbolCreationDto symbol = SymbolCreationDto(
      id: event.id,
      name: event.name,
    );
    await SymbolRepository(dbClient: dbClient)
        .createSymbol(symbol);

    // Set symbol creation progress at 'successState'
    symbolCreationState = store.symbolCreationState.stream.value;
    symbolCreationState.progress = SymbolCreationState.successState;
    store.symbolCreationState.update(symbolCreationState);

    // Refresh symbol list state
    retrieveAllSymbols();
  }

  // Here you can set the return type as Future<List<SymbolModel>>
  // instead of Future<void> in case you want return direct result
  // to the caller of the method.
  Future<void> retrieveAllSymbols() async {
    var symbolList = await SymbolRepository(dbClient: dbClient).retrievalAllSymbol();
    store.symbolListState.update(symbolList);
  }

  Future<void> runAutoInsertSymbol() async {
    var count = store.symbolListState.stream.value.length;

    if (count == 0) {
      await retrieveAllSymbols();
      count = store.symbolListState.stream.value.length;
    }

    Timer.periodic(const Duration(seconds: 2), (timer) async {
      if (count >= 15) {
        timer.cancel();
      }

      count++;
      await createSymbol(SymbolCreationEvent(id: count, name: 'Symbol $count'));
    });
  }

  @override
  void dispose() {
    store.dispose();
  }
}

class SymbolCreatePageBlocStore extends AbstractBlocStore {
  // Sample of state with progress and data
  final symbolCreationState = BlocState<SymbolCreationState>(SymbolCreationState());

  // Sample of data-only state
  final symbolListState = BlocState<List<SymbolModel>>(<SymbolModel>[]);

  @override
  void dispose() {
    symbolCreationState.dispose();
    symbolListState.dispose();
  }
}