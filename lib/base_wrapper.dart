import 'package:flutter/material.dart';

class BaseWrapper extends StatelessWidget {
  final Widget child;
  const BaseWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: child);
  }
}
