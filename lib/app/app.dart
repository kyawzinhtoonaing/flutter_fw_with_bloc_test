import 'package:im_exchange_fw_test/app/_registry/_registry.dart';
import 'package:provider/provider.dart';

import 'blocs/app_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppWidgetsLabel.appTitle,
      //initialRoute: PsMwpAppRoutes.mwp00001S0001Login,
      initialRoute: routeAppMenu,
      routes: pageRoutes,
      navigatorObservers: [AppRouteObserver(context)],
    );
  }
}

class AppRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  final BuildContext _buildContext;
  late final AppBloc _appBloc;

  AppRouteObserver(this._buildContext) {
    _appBloc = Provider.of<AppBloc>(_buildContext, listen: false);
  }

  void _checkIfModuleMenuAndInitModuleBloc(PageRoute<dynamic> route) {
    String screenName = route.settings.name as String;
    switch (screenName) {
      case routeAppMenu : {
        _appBloc.menuBlocFactory.initDummyBloc();
      }
      break;

      case routeSymbolMenu : {
        _appBloc.menuBlocFactory.initSymbolBloc(_appBloc);
      }
      break;

      case routeUserMenu : {
        _appBloc.menuBlocFactory.initUserBloc(_appBloc);
      }
      break;

      default: {};
      break;
    }
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      _checkIfModuleMenuAndInitModuleBloc(route);
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      _checkIfModuleMenuAndInitModuleBloc(newRoute);
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute) {
      _checkIfModuleMenuAndInitModuleBloc(previousRoute);
    }
  }
}
