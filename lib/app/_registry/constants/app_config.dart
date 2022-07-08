class AppConfig {
  AppConfig() {
    String host = '192.168.1.3';
    // if (Platform.isAndroid) {
    //   host = '10.0.2.2';
    // }
    params['dev'] = AppConfigParams(
        "http://$host:3000",
        "http://$host:8545",
        "ws://$host:8546",
        "http://$host:3000/graphql",
        "ws://$host:3000/wsendpoint");
  }

  Map<String, AppConfigParams> params = <String, AppConfigParams>{};
}

class AppConfigParams {
  AppConfigParams(this.baseApiUrl, this.web3HttpUrl, this.web3WsUrl,
      this.graphqlEndpoint, this.subscriptionEndpoint);
  final String baseApiUrl;
  final String web3WsUrl;
  final String web3HttpUrl;
  final String graphqlEndpoint;
  final String subscriptionEndpoint;
}

class ActiveAppSetup {
  late AppConfigParams activeAppConfigParams;

  static final ActiveAppSetup _instance = ActiveAppSetup._internal();

  factory ActiveAppSetup() {
    return _instance;
  }

  ActiveAppSetup._internal() {
    final AppConfigParams params = AppConfig().params["dev"] as AppConfigParams;
    activeAppConfigParams = params;
  }

  /*Future<void> initHiveData() async {
    var box = await Hive.openBox(hive_keys.fileKeyExchange);
    await box.put(hive_keys.adminName, 'admin');
    await box.put(hive_keys.adminEmail, 'admin@gmail.com');
    await box.put(hive_keys.adminAddress, 'Yangon');
    await box.put(hive_keys.adminRole, 'admin');
    await box.put(hive_keys.adminPubKey, '123');
    await box.put(hive_keys.adminPriKey, '123');
  }*/
}
