import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routing_test_app/navigation_manager.dart';
import 'dart:io' show Platform;

void main() {
  final NavigationManager navigationManager = NavigationManager();

  runApp(
    ChangeNotifierProvider(
      create: (context) => navigationManager,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Consumer<NavigationManager>(
        builder: (context, navigationManager, child) {
          return WillPopScope(
            onWillPop: () async => !await _navigatorKey.currentState.maybePop(),
            child: Navigator(
              key: _navigatorKey,
              pages: navigationManager.pages,
              onPopPage: (route, result) {
                navigationManager.pop();
                return route.didPop(result);
              },
            ),
          );
        },
      ),
    );
  }
}
