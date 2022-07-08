// Dart: Existing Libraries
import 'dart:async';

import 'package:im_exchange_fw_test/app/_registry/_registry.dart';
import 'package:im_exchange_fw_test/app/_registry/widgets/widgets.dart';
import 'package:im_exchange_fw_test/app/pages/widgets/login_widget_helper.dart';

import 'login_widget_validator.dart';

// LoginWidget: StatefulWidget Class
class LoginWidget extends StatefulWidget {
  // Constructor
  const LoginWidget({Key? key}) : super(key: key);

  // createState: Override Class Method
  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

// _LoginWidgetState: State Class
class _LoginWidgetState extends State<LoginWidget>
    with LoginWidgetHelper, LoginWidgetValidator {
  // Final: Class Properties
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 20.0,
      ),
      child: Column(
        children: [
          const TitleWidget(title: "Login"),
          const SizedBox(height: 30.0),
          Expanded(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FormTextfieldWidget(
                      controller: mailController,
                      title: AppWidgetsLabel.email,
                      hint: AppWidgetsLabel.emailHint,
                      validator: mailValidation,
                      maxLength: 50,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 60.0),
                    const Divider(
                      thickness: 2,
                    ),
                    const SizedBox(height: 20.0),
                    CustomButtonWidget(
                      buttonTitle: AppWidgetsLabel.login,
                      color: Colors.lightBlue,
                      callback: () => onLogin(context),
                      width: double.infinity,
                      height: 60.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
