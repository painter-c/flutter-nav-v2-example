import 'package:flutter/material.dart';
import 'package:routing_test_app/pages/app_info_page.dart';
import 'package:routing_test_app/pages/schedule_editor_page.dart';
import 'package:routing_test_app/pages/schedule_item_editor_page.dart';
import 'package:routing_test_app/pages/tab_group_container.dart';

class NavigationManager extends ChangeNotifier {
  static const ValueKey _tabGroupContainerKey = ValueKey("tab_group_container");
  static const ValueKey _infoPageKey = ValueKey("info_page");
  static const ValueKey _scheduleEditorPageKey =
      ValueKey("schedule_editor_page");
  static const ValueKey _scheduleItemEditorPageKey =
      ValueKey("schedule_item_editor_page");

  ValueKey _topPage;

  bool _showInfoPage;
  bool _showScheduleEditorPage;
  bool _showScheduleItemEditorPage;

  NavigationManager()
      : _showInfoPage = false,
        _showScheduleEditorPage = false,
        _showScheduleItemEditorPage = false,
        _topPage = null;

  bool get showInfoPage => _showInfoPage;
  set showInfoPage(val) {
    _showInfoPage = val;
    notifyListeners();
  }

  bool get showScheduleEditorPage => _showScheduleEditorPage;
  set showScheduleEditorPage(val) {
    _showScheduleEditorPage = val;
    notifyListeners();
  }

  bool get showScheduleItemEditorPage => _showScheduleItemEditorPage;
  set showScheduleItemEditorPage(val) {
    _showScheduleItemEditorPage = val;
    notifyListeners();
  }

  List<MaterialPage> get pages {
    var tmp = [
      MaterialPage(
        key: _tabGroupContainerKey,
        child: TabGroupContainer(),
      ),
      if (showInfoPage)
        MaterialPage(
          key: _infoPageKey,
          child: AppInfoPage(),
        ),
      if (showScheduleEditorPage)
        MaterialPage(
          key: _scheduleEditorPageKey,
          child: ScheduleEditorPage(),
        ),
      if (showScheduleItemEditorPage)
        MaterialPage(
          key: _scheduleItemEditorPageKey,
          child: ScheduleItemEditorPage(),
        ),
    ];

    _topPage = tmp.last.key;

    return tmp;
  }

  void pop() {
    if (showInfoPage && _topPage == _infoPageKey) {
      showInfoPage = false;
    }
    if (showScheduleEditorPage && _topPage == _scheduleEditorPageKey) {
      showScheduleEditorPage = false;
    }
    if (showScheduleItemEditorPage && _topPage == _scheduleItemEditorPageKey) {
      showScheduleItemEditorPage = false;
    }
  }
}
