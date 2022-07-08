import 'package:im_exchange_fw_test/app/_registry/_registry.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';
import 'app/blocs/app_bloc.dart';

// Main Function
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    Provider(
      create: (_) => AppBloc(),
      child: App(),
    ),
  );
}
