import 'package:flutter/material.dart';
import 'package:flutter_web_url_strategy_template/helper/string_ext.dart';
import 'package:flutter_web_url_strategy_template/models/test_data.dart';
import 'package:flutter_web_url_strategy_template/routes/router.dart';
import 'package:flutter_web_url_strategy_template/views/home_view.dart';
import 'package:flutter_web_url_strategy_template/views/test_view.dart';

// WebRouter class for handling routing in the application
class WebRouter {
  // GlobalKey for NavigatorState to manage navigation stack
  static final navigatorKey = GlobalKey<NavigatorState>();

  // Function to generate routes based on RouteSettings
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // Extracting routing data from settings name
    final queryParams = settings.name!.getRoutingData;

    // Switching over the route
    switch (queryParams.route) {
      // Route for home
      case AppRoutes.home:
        return _FadeRoute(
          // HomeView is the widget to be displayed when this route is navigated to
          child: const HomeView(),
          settings: settings,
        );
      // Route for test
      case AppRoutes.test:
        late TestData testData;
        final params = queryParams.params;
        final backendParams = params['data'];
        // If backendParams is not null, create TestData from it
        if (backendParams != null) {
          testData = TestData.fromJson(backendParams);
        } else if (params.isNotEmpty) {
          // If params is not empty, create TestData from it
          final raw = queryParams.params;
          testData = TestData.fromQuerParamsMap(raw);
        }

        return _FadeRoute(
          // TestView is the widget to be displayed when this route is navigated to
          child: TestView(data: testData),
          settings: settings,
        );

      // Default route
      default:
        return _FadeRoute(
          // HomeView is the widget to be displayed when this route is navigated to
          child: const HomeView(),
          settings: settings,
        );
    }
  }

  // Function to navigate to a specific route with optional query parameters
  Future<dynamic> navigateTo(String route,
      {Map<String, dynamic>? queryParams}) {
    // If queryParams is not null, append it to the route
    if (queryParams != null) {
      route = Uri(path: route, queryParameters: queryParams).toString();
    }

    // Push the route to the navigation stack
    return navigatorKey.currentState!.pushNamed(route, arguments: queryParams);
  }
}

// _FadeRoute class for creating a fade transition route
class _FadeRoute extends PageRouteBuilder {
  // Widget to be displayed when this route is navigated to
  final Widget child;
  @override
  final RouteSettings settings;

  _FadeRoute({required this.child, required this.settings})
      : super(
          settings: settings,
          // Page builder function for building the page
          pageBuilder: (context, ani1, ani2) => child,
          // Transitions builder function for building the transition
          transitionsBuilder: (context, ani1, ani2, child) {
            return FadeTransition(
              // Opacity animation
              opacity: ani1,
              child: child,
            );
          },
        );
}
