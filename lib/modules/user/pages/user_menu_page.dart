import 'package:im_exchange_fw_test/app/_registry/_registry.dart';
import 'package:im_exchange_fw_test/app/_registry/widgets/drawer_widget.dart';

class UserMenuPage extends StatelessWidget {
  const UserMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBar(
          title: const Text(menuUser),
          centerTitle: true
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, routeUserCreatePage);
                  },
                  child: const Text(menuUserCreatePage)
              ),
              const Text(""),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, routeUserListPage);
                  },
                  child: const Text(menuUserListPage)
              ),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}