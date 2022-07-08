import 'package:im_exchange_fw_test/app/blocs/app_bloc.dart';
import 'package:im_exchange_fw_test/modules/symbol/blocs/blocs.dart';
import 'package:im_exchange_fw_test/modules/user/blocs/blocs.dart';

import '../_registry/framework/framework_bloc.dart';

class AppBlocFactory {
  AbstractBloc _menuBloc = DummyBloc();

  AbstractBloc get currentMenuBloc => _menuBloc;

  void _destroyCurrentMenuBloc() {
    _menuBloc.dispose();
    _menuBloc = DummyBloc();
  }

  // Menu blocs initializations.
  void initDummyBloc() {
    _destroyCurrentMenuBloc();
    _menuBloc = DummyBloc();
  }

  void initSymbolBloc(AppBloc appBloc) {
    _destroyCurrentMenuBloc();
    _menuBloc = SymbolBloc(dbClient: appBloc.store.dbClient);
  }

  void initUserBloc(AppBloc appBloc) {
    _destroyCurrentMenuBloc();
    _menuBloc = UserBloc(dbClient: appBloc.store.dbClient);
  }

  void dispose() {
    _destroyCurrentMenuBloc();
  }
}

class DummyBloc extends AbstractBloc {
  @override
  void dispose() { }
}