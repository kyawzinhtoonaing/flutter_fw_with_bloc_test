// SymbolCreationPage: StatefulWidget Class
import 'package:flutter/material.dart';
import 'package:im_exchange_fw_test/app/_registry/widgets/custom_button_widget.dart';
import 'package:im_exchange_fw_test/app/_registry/widgets/drawer_widget.dart';
import 'package:im_exchange_fw_test/app/_registry/widgets/form_textfield_widget.dart';
import '../_registry/_registry.dart';
import 'symbol_creation_page_helper.dart';
import 'symbol_creation_page_validator.dart';

class SymbolCreationPage extends StatefulWidget {
  // Static & Constant: Class Properties

  // Constructor
  const SymbolCreationPage({Key? key}) : super(key: key);

  // createState: Override Class Method
  @override
  State<SymbolCreationPage> createState() => _SymbolCreationPageState();
}

// _SymbolCreationPageState: State Class
class _SymbolCreationPageState extends State<SymbolCreationPage>
    with SymbolCreationPageHelper, SymbolCreationPageValidator {
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
        title: const Text(SymbolWidgetsLabel.symbolCreationPageTitle),
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
                    controller: symbolIdController,
                    title: SymbolWidgetsLabel.symbolID,
                    hint: SymbolWidgetsLabel.symbolIDHint,
                    maxLength: 10,
                    maxLines: 1,
                    validator: numberValidation,
                  ),
                  const SizedBox(height: 10.0),
                  FormTextfieldWidget(
                    controller: symbolNameController,
                    title: SymbolWidgetsLabel.symbolName,
                    hint: SymbolWidgetsLabel.symbolNameHint,
                    maxLength: 20,
                    maxLines: 1,
                    validator: textValidation,
                  ),
                  const SizedBox(height: 10.0),
                  const SizedBox(height: 20.0),
                  const Divider(thickness: 2),
                  const SizedBox(height: 20.0),
                  CustomButtonWidget(
                    buttonTitle: SymbolWidgetsLabel.createSymbol,
                    color: Colors.lightBlue,
                    callback: () => onSymbolCreation(context, _formKey),
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