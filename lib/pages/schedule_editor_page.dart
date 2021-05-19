import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routing_test_app/navigation_manager.dart';

class ScheduleEditorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Schedule"),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              var navigationManager = Provider.of<NavigationManager>(context, listen:false);
              navigationManager.pop();
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text("schedule_editor_page"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          var navigationManager = Provider.of<NavigationManager>(context, listen:false);
          navigationManager.showScheduleItemEditorPage = true;
        }
      ),
    );
  }
}