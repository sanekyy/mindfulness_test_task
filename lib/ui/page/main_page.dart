import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/data/repository/task_repository.dart';
import 'package:task/localizations.dart';
import 'package:task/ui/page/task_groups_page.dart';

enum Tab { meditation, courses, sounds }

class MainPage extends StatefulWidget {
  static const routeName = '/';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _pageController = PageController();

  TaskRepository _taskRepository;
  AppLocalizations _appLocalizations;

  _MainPageTab _activeTab = _MainPageTab.meditation;

  @override
  void initState() {
    super.initState();
    _taskRepository = context.read();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _appLocalizations = AppLocalizations.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButtonIcon(),
        title: Text(_appLocalizations.appTitle),
        actions: _appBarActions(),
        bottom: _slidingSegmentedControl(),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        TaskGroupsPage(taskGroups: _taskRepository.meditationTaskGroupsSubject),
        TaskGroupsPage(taskGroups: _taskRepository.coursesTaskGroupsSubject),
        TaskGroupsPage(taskGroups: _taskRepository.soundsTaskGroupsSubject),
      ],
    );
  }

  PreferredSize _slidingSegmentedControl() {
    return PreferredSize(
      preferredSize: Size(double.infinity, 44),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 7),
        child: CupertinoSlidingSegmentedControl(
          groupValue: _activeTab,
          onValueChanged: _onTabChanged,
          children: Map.fromEntries(
            _MainPageTab.values.map(
              (tab) => MapEntry(
                tab,
                Text(
                  tab.title(_appLocalizations).toUpperCase(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTabChanged(_MainPageTab value) {
    setState(() {
      _activeTab = value;
      _pageController.animateToPage(
        _MainPageTab.values.indexOf(_activeTab),
        duration: Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
      );
    });
  }

  List<Widget> _appBarActions() {
    return [
      PopupMenuButton(
        itemBuilder: (_) {
          return [
            PopupMenuItem(
              child: new Text(_appLocalizations.someMenuItem),
            ),
          ];
        },
      )
    ];
  }
}

typedef _StringFromAppLocalizations = String Function(
    AppLocalizations appLocalizations);

class _MainPageTab {
  static final meditation =
      _MainPageTab._((appLocalizations) => appLocalizations.meditation);
  static final courses =
      _MainPageTab._((appLocalizations) => appLocalizations.courses);
  static final sounds =
      _MainPageTab._((appLocalizations) => appLocalizations.sounds);

  final _StringFromAppLocalizations title;

  const _MainPageTab._(this.title);

  static final values = [
    meditation,
    courses,
    sounds,
  ];
}
