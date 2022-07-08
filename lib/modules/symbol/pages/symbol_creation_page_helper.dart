import 'package:flutter/material.dart';
import 'package:im_exchange_fw_test/app/blocs/app_bloc.dart';
import 'package:provider/provider.dart';

import '../blocs/symbol_bloc.dart';
import '../blocs/events/symbol_creation_event.dart';

mixin SymbolCreationPageHelper {
  final TextEditingController _symbolIdController = TextEditingController();
  final TextEditingController _symbolNameController = TextEditingController();

  TextEditingController get symbolIdController => _symbolIdController;
  TextEditingController get symbolNameController => _symbolNameController;

  Future<void> onSymbolCreation(BuildContext context, GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      final bloc = Provider
          .of<AppBloc>(context, listen: false)
          .menuBlocFactory.currentMenuBloc as SymbolBloc;

      //final bloc = Provider.of<SymbolCreatePageBloc>(context, listen: false);

      await bloc.createSymbol(
            SymbolCreationEvent(id: int.parse(symbolIdController.text),
                name: _symbolNameController.text));

      _symbolIdController.text = '';
      _symbolNameController.text = '';
    }
  }
}