import 'package:flutter/material.dart';
import 'package:im_exchange_fw_test/app/blocs/app_bloc.dart';
import 'package:provider/provider.dart';

import '../blocs/user_bloc.dart';
import '../blocs/events/user_creation_event.dart';

mixin UserCreationPageHelper {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  TextEditingController get userIdController => _userIdController;
  TextEditingController get userNameController => _userNameController;

  Future<void> onUserCreation(BuildContext context, GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      final bloc = Provider
          .of<AppBloc>(context, listen: false)
          .menuBlocFactory.currentMenuBloc as UserBloc;

      await bloc.createUser(
            UserCreationEvent(id: int.parse(userIdController.text),
                name: _userNameController.text));

      _userIdController.text = '';
      _userNameController.text = '';
    }
  }
}