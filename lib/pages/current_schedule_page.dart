import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routing_test_app/navigation_manager.dart';

class CurrentSchedulePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CurrentSchedulePageState();
}

class _CurrentSchedulePageState extends State<CurrentSchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: Text("current_schedule_page")),
        Positioned(
          child: FloatingActionButton(
            child: Icon(Icons.edit),
            onPressed: () {
              var navigationManager = Provider.of<NavigationManager>(context, listen:false);
              navigationManager.showScheduleEditorPage = true;
            },
          ),
          bottom: 16,
          right: 16,
        ),
      ],
    );
  }
}
