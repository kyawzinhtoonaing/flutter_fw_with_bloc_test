import 'package:im_exchange_fw_test/app/_registry/_registry.dart';

mixin LoginWidgetHelper {
  final TextEditingController _mailController = TextEditingController();

  TextEditingController get mailController => _mailController;

  void onLogin(BuildContext context) async {
    Navigator.popAndPushNamed(context, routeSymbolMenu);
  }
}