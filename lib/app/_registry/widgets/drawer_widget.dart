import '../_registry.dart';
import 'drawer_cell_widget.dart';

// DrawerWidget: StatelessWidget Class
class DrawerWidget extends StatelessWidget {
  // Constructor
  const DrawerWidget({Key? key}) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    var widgets = <DrawerCellWidget>[
      DrawerCellWidget(
        icon: Icons.abc,
        title: menuSymbol,
        routeName: appMenus[menuSymbol] as String,
      ),
      DrawerCellWidget(
        icon: Icons.abc,
        title: menuUser,
        routeName: appMenus[menuUser] as String,
      ),
      /*const DrawerCellWidget(
        icon: Icons.logout,
        title: menuSymbolListPage,
        routeName: routeSymbolListPage,
      ),*/
    ];

    // Returning Widgets
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.lightBlue,
            child: const DrawerHeader(
              child: Center(
                child: Text(
                  "Digital Exchange",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          ...widgets,
        ],
      ),
    );
  }
}
