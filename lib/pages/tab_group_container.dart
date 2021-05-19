import 'package:flutter/material.dart';
import 'package:routing_test_app/pages/current_schedule_page.dart';
import 'package:routing_test_app/pages/options_page.dart';
import 'package:routing_test_app/pages/schedule_management_page.dart';
import 'package:routing_test_app/widgets/main_app_bar.dart';

class TabGroupContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabGroupContainerState();
}

class _TabGroupContainerState extends State<TabGroupContainer> with SingleTickerProviderStateMixin {

  final List<StatefulWidget> pages = [
    CurrentSchedulePage(),
    ScheduleManagementPage(),
    OptionsPage(),
  ];

  final List<Tab> tabs = [
    Tab(text: "Today"),
    Tab(text: "Schedules"),
    Tab(text: "Options"),
  ];

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      bottomNavigationBar: TabBar(
        tabs: tabs,
        controller: _tabController,
        labelColor: Color.fromRGBO(0, 0, 0, 1),
      ),
      body: Center(
        child: TabBarView(
          controller: _tabController,
          children: pages,
        ),
      ),
    );
  }
}

