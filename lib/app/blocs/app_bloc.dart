import 'package:im_exchange_fw_test/app/_registry/framework/framework_bloc.dart';
import 'package:im_exchange_fw_test/zmock/db/db_client.dart';

import 'app_bloc_factory.dart';

class AppBloc extends AbstractBloc {
  final AppBlocStore store = AppBlocStore();
  final AppBlocFactory menuBlocFactory = AppBlocFactory();

  @override
  void dispose() {
    store.dispose();
  }
}

class AppBlocStore extends AbstractBlocStore {
  DBClient dbClient = DBClient();

  @override
  void dispose() {
  }
}