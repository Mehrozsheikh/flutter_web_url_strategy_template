import 'package:flutter/material.dart';
import 'package:flutter_web_url_strategy_template/models/test_data.dart';
import 'package:flutter_web_url_strategy_template/routes/router.dart';
import 'package:flutter_web_url_strategy_template/routes/web_router.dart';
import 'package:flutter_web_url_strategy_template/services/locator.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final data = TestData(
              id: "1",
              title: "Flutter Web URL Strategy Template",
              description:
                  "This is a template for Flutter Web URL Strategy developed by Mehroz Sheikh",
            );
            locator<WebRouter>().navigateTo(
              AppRoutes.test,
              queryParams: data.toQueryParamsMap(),
            );
          },
          child: const Text("Go to Test"),
        ),
      ),
    );
  }
}
