import 'package:flutter/material.dart';
import 'package:flutter_web_url_strategy_template/models/routing_data.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';

extension SuperString on String {
  Future<void> push(BuildContext context, {Object? arguments}) =>
      Navigator.pushNamed(
        context,
        this,
        arguments: arguments,
      );

  Future<void> pushReplace(BuildContext context, {Object? arguments}) =>
      Navigator.pushReplacementNamed(
        context,
        this,
        arguments: arguments,
      );

  Future<void> pop<T extends Object?>(BuildContext context,
          [T? result]) async =>
      Navigator.pop(context, result);

  Future<void> popUntil(BuildContext context) async =>
      Navigator.popUntil(context, ModalRoute.withName(this));

  bool sameRoute() =>
      NavigationHistoryObserver().history.isNotEmpty &&
      NavigationHistoryObserver().top?.settings.name == this;

  RoutingData get getRoutingData {
    final uriData = Uri.parse(this);

    return RoutingData(
      route: uriData.path,
      queryParams: uriData.queryParameters,
    );
  }
}
