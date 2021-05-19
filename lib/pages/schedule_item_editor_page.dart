import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routing_test_app/navigation_manager.dart';

class ScheduleItemEditorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Schedule Item"),
        actions: [
          TextButton(
            child: Text("SAVE"),
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            onPressed: () {
              var navigationManager =
                  Provider.of<NavigationManager>(context, listen: false);
              navigationManager.pop();
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Center(
            child: Text("schedule_item_editor"),
          ),
          Positioned(
            child: TextButton(
              child: Text("SAVE"),
              onPressed: () {
                var navigationManager =
                    Provider.of<NavigationManager>(context, listen: false);
                navigationManager.pop();
              },
            ),
            right: 15,
            bottom: 15,
          ),
        ],
      ),
    );
  }
}
