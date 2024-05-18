import 'package:flutter_web_url_strategy_template/routes/web_router.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => WebRouter());
}
