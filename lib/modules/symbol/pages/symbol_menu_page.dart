import 'package:im_exchange_fw_test/app/_registry/_registry.dart';
import 'package:im_exchange_fw_test/app/_registry/widgets/drawer_widget.dart';

class SymbolMenuPage extends StatelessWidget {
  static const String routeName = "/home";

  const SymbolMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBar(
          title: const Text(menuSymbol),
          centerTitle: true
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, routeSymbolCreatePage);
                  },
                  child: const Text(menuSymbolCreatePage)
              ),
              const Text(""),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, routeSymbolListPage);
                  },
                  child: const Text(menuSymbolListPage)
              ),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}