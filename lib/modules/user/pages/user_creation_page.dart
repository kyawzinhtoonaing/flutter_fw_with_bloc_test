// SymbolCreationPage: StatefulWidget Class
import 'package:flutter/material.dart';
import 'package:im_exchange_fw_test/app/_registry/widgets/custom_button_widget.dart';
import 'package:im_exchange_fw_test/app/_registry/widgets/form_textfield_widget.dart';
import '../_registry/_registry.dart';
import 'user_creation_page_helper.dart';
import 'user_creation_page_validator.dart';

class UserCreationPage extends StatefulWidget {
  // Static & Constant: Class Properties

  // Constructor
  const UserCreationPage({Key? key}) : super(key: key);

  // createState: Override Class Method
  @override
  State<UserCreationPage> createState() => _UserCreationPageState();
}

class _UserCreationPageState extends State<UserCreationPage>
    with UserCreationPageHelper, UserCreationPageValidator {
  // Final: Class Properties
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return Scaffold(
      //drawer: const DrawerWidget(),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(SymbolWidgetsLabel.userCreationPageTitle),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FormTextfieldWidget(
                    controller: userIdController,
                    title: SymbolWidgetsLabel.userID,
                    hint: SymbolWidgetsLabel.userIDHint,
                    maxLength: 10,
                    maxLines: 1,
                    validator: numberValidation,
                  ),
                  const SizedBox(height: 10.0),
                  FormTextfieldWidget(
                    controller: userNameController,
                    title: SymbolWidgetsLabel.userName,
                    hint: SymbolWidgetsLabel.userNameHint,
                    maxLength: 20,
                    maxLines: 1,
                    validator: textValidation,
                  ),
                  const SizedBox(height: 10.0),
                  const SizedBox(height: 20.0),
                  const Divider(thickness: 2),
                  const SizedBox(height: 20.0),
                  CustomButtonWidget(
                    buttonTitle: SymbolWidgetsLabel.createUser,
                    color: Colors.lightBlue,
                    callback: () => onUserCreation(context, _formKey),
                    width: double.infinity,
                    height: 60.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}