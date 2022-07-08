import 'package:im_exchange_fw_test/app/_registry/_registry.dart';
import 'package:im_exchange_fw_test/app/_registry/widgets/drawer_widget.dart';
import 'package:im_exchange_fw_test/app/blocs/app_bloc.dart';
import 'package:provider/provider.dart';

import '../_registry/_registry.dart';
import '../blocs/symbol_bloc.dart';
import '../services/domain/model/symbol_model.dart';

class SymbolListPage extends StatelessWidget {
  const SymbolListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AppBloc>(context, listen: false)
        .menuBlocFactory
        .currentMenuBloc as SymbolBloc;

    final symbolListState = bloc.store.symbolListState;
    /*if (!(symbolListState.stream.hasValue &&
        symbolListState.stream.value.isNotEmpty)) {
      bloc.retrieveAllSymbols();
    }*/
    bloc.runAutoInsertSymbol();

    return Scaffold(
      //drawer: const DrawerWidget(),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(SymbolWidgetsLabel.symbolListPageTitle),
        centerTitle: true,
      ),
      body: SafeArea(
          child: StreamBuilder<List<SymbolModel>>(
              stream: symbolListState.stream,
              builder: (context, snapshot) {
                if (!snapshot.hasData ||
                    (snapshot.data as List<SymbolModel>).isEmpty) {
                  return const Center(
                    child: Text("Data is Empty!"),
                  );
                }
                var symbolList = snapshot.data as List<SymbolModel>;
                return ListView.builder(
                    itemCount: symbolList.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: ListTile(
                        title: Text(symbolList[index].id.toString()),
                        subtitle: Text(symbolList[index].name),
                      ));
                    });
              })),
    );
  }
}
