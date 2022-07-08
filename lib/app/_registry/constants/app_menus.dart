// Menu Title
import 'app_routes.dart';

const menuSymbol = 'Symbol';
const menuSymbolCreatePage = 'Symbol Creation';
const menuSymbolListPage = 'Symbol List';

const menuUser = 'User';
const menuUserCreatePage = 'User Creation';
const menuUserListPage = 'User List';

final Map<String, String> appMenus = {
  menuSymbol: routeSymbolMenu,
  //menuSymbolCreatePage: routeSymbolCreatePage,
  //menuSymbolListPage: routeSymbolListPage,
  menuUser: routeUserMenu,
};