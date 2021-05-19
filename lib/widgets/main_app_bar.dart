import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routing_test_app/navigation_manager.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  final Size _preferredSize = Size(0, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Scheduler"),
      actions: [
        IconButton(
          icon: Icon(Icons.info_outline),
          onPressed: () {
            var pageNavigatorState =
                Provider.of<NavigationManager>(context, listen: false);
            pageNavigatorState.showInfoPage = true;
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => _preferredSize;
}
