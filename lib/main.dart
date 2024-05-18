import 'package:flutter/material.dart';
import 'package:flutter_web_url_strategy_template/base_wrapper.dart';
import 'package:flutter_web_url_strategy_template/routes/router.dart';
import 'package:flutter_web_url_strategy_template/routes/web_router.dart';
import 'package:flutter_web_url_strategy_template/services/locator.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // removes the '#' in the URL for web
  setPathUrlStrategy();

  // routing service get_it
  setUpLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Web URL Strategy Template",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      builder: (context, child) => BaseWrapper(child: child!),
      initialRoute: AppRoutes.home,
      navigatorKey: WebRouter.navigatorKey,
      onGenerateRoute: WebRouter.onGenerateRoute,
    );
  }
}
