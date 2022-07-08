import 'package:im_exchange_fw_test/app/_registry/_registry.dart';
import 'package:im_exchange_fw_test/app/_registry/widgets/drawer_widget.dart';
import 'package:im_exchange_fw_test/app/blocs/app_bloc.dart';
import 'package:provider/provider.dart';

import '../_registry/_registry.dart';
import '../blocs/user_bloc.dart';
import '../services/domain/model/user_model.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AppBloc>(context, listen: false)
        .menuBlocFactory
        .currentMenuBloc as UserBloc;

    final userListState = bloc.store.userListState;
    /*if (!(userListState.stream.hasValue &&
        userListState.stream.value.isNotEmpty)) {
      bloc.retrieveAllSymbols();
    }*/
    bloc.runAutoInsertUser();

    return Scaffold(
      //drawer: const DrawerWidget(),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(SymbolWidgetsLabel.userListPageTitle),
        centerTitle: true,
      ),
      body: SafeArea(
          child: StreamBuilder<List<UserModel>>(
              stream: userListState.stream,
              builder: (context, snapshot) {
                if (!snapshot.hasData ||
                    (snapshot.data as List<UserModel>).isEmpty) {
                  return const Center(
                    child: Text("Data is Empty!"),
                  );
                }
                var userList = snapshot.data as List<UserModel>;
                return ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: ListTile(
                        title: Text(userList[index].id.toString()),
                        subtitle: Text(userList[index].name),
                      ));
                    });
              })),
    );
  }
}
