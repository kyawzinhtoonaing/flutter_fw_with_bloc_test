import 'dart:async';

import 'package:im_exchange_fw_test/app/_registry/framework/framework_bloc.dart';
import 'package:im_exchange_fw_test/zmock/db/db_client.dart';

import '../services/domain/dto/user_creation_dto.dart';
import '../services/domain/model/user_model.dart';
import '../services/repository/user_repo.dart';
import 'events/user_creation_event.dart';
import 'states/user_creation_state.dart';

class UserBloc extends AbstractBloc {
  final store = SymbolCreatePageBlocStore();

  final DBClient dbClient;

  UserBloc({required this.dbClient});

  Future<void> createUser(UserCreationEvent event) async {
    // Set user creation progress at 'inProgressState'.
    var userCreationState = store.userCreationState.stream.value;
    userCreationState.progress = UserCreationState.inProgressState;
    store.userCreationState.update(userCreationState);

    // Actual user creation.
    UserCreationDto symbol = UserCreationDto(
      id: event.id,
      name: event.name,
    );
    await UserRepository(dbClient: dbClient)
        .createUser(symbol);

    // Set symbol creation progress at 'successState'
    userCreationState = store.userCreationState.stream.value;
    userCreationState.progress = UserCreationState.successState;
    store.userCreationState.update(userCreationState);

    // Refresh symbol list state
    retrieveAllUsers();
  }

  // Here you can set the return type as Future<List<SymbolModel>>
  // instead of Future<void> in case you want return direct result
  // to the caller of the method.
  Future<void> retrieveAllUsers() async {
    var userList = await UserRepository(dbClient: dbClient).retrievalAllUsers();
    store.userListState.update(userList);
  }

  Future<void> runAutoInsertUser() async {
    var count = store.userListState.stream.value.length;

    if (count == 0) {
      await retrieveAllUsers();
      count = store.userListState.stream.value.length;
    }

    Timer.periodic(const Duration(seconds: 2), (timer) async {
      if (count >= 15) {
        timer.cancel();
      }

      count++;
      await createUser(UserCreationEvent(id: count, name: 'User $count'));
    });
  }

  @override
  void dispose() {
    store.dispose();
  }
}

class SymbolCreatePageBlocStore extends AbstractBlocStore {
  // Sample of state with progress and data
  final userCreationState = BlocState<UserCreationState>(UserCreationState());

  // Sample of data-only state
  final userListState = BlocState<List<UserModel>>(<UserModel>[]);

  @override
  void dispose() {
    userCreationState.dispose();
    userListState.dispose();
  }
}