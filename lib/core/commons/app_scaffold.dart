import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Color? backgroundColor;

  const AppScaffold({
    super.key,
    this.appBar,
    this.body,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: backgroundColor ?? Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Scaffold(
          appBar: appBar,
          body: body,
        ),
      ),
    );
  }
}
