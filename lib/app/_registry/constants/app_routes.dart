// Flutter: Existing Libraries
import 'package:flutter/material.dart';
import 'package:im_exchange_fw_test/app/pages/app_init_page.dart';
import 'package:im_exchange_fw_test/modules/symbol/pages/pages.dart';
import 'package:im_exchange_fw_test/modules/user/pages/pages.dart';

// App
const routeAppMenu = '/app';

// Symbol module menu
const routeSymbolMenu = '/symbol';
const routeSymbolCreatePage = '$routeSymbolMenu/symbolCreatePage';
const routeSymbolListPage = '$routeSymbolMenu/symbolListPage';

// User module menu
const routeUserMenu = '/user';
const routeUserCreatePage = '$routeUserMenu/userCreatePage';
const routeUserListPage = '$routeUserMenu/userListPage';

final Map<String, Widget Function(BuildContext)> pageRoutes = {
  routeAppMenu: (_) => const AppInitPage(),
  routeSymbolMenu: (_) => const SymbolMenuPage(),
  routeSymbolCreatePage: (_) => const SymbolCreationPage(),
  routeSymbolListPage: (_) => const SymbolListPage(),
  routeUserMenu: (_) => const UserMenuPage(),
  routeUserCreatePage: (_) => const UserCreationPage(),
  routeUserListPage: (_) => const UserListPage(),
};
