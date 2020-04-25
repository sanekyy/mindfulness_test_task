import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:task/data/model/task_group.dart';
import 'package:task/ui/kit/task_layouts.dart';
import 'package:task/ui/widget/task_card.dart';

class TaskGroupsPage extends StatefulWidget {
  final Stream<BuiltList<TaskGroup>> taskGroups;

  const TaskGroupsPage({Key key, @required this.taskGroups}) : super(key: key);

  @override
  _TaskGroupsPageState createState() => _TaskGroupsPageState();
}

class _TaskGroupsPageState extends State<TaskGroupsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return StreamBuilder<BuiltList<TaskGroup>>(
      stream: widget.taskGroups,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();

        final taskGroups = snapshot.data;

        return ListView.builder(
          itemCount: taskGroups.length,
          padding: EdgeInsets.only(bottom: TaskLayouts.padding),
          itemBuilder: (context, i) {
            return _group(taskGroups[i]);
          },
        );
      },
    );
  }

  Widget _group(TaskGroup taskGroup) {
    return Column(
      children: [
        _groupTitle(taskGroup.title),
        _taskCardList(taskGroup),
      ],
    );
  }

  _groupTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: TaskLayouts.padding),
      child: SizedBox(
        height: 44,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Color(0xFF393C4F),
                fontWeight: FontWeight.w600,
                fontSize: 13,
                letterSpacing: -0.08,
              ),
            ),
            _seeAllButton(),
          ],
        ),
      ),
    );
  }

  Widget _seeAllButton() {
    return ButtonTheme(
      padding: EdgeInsets.symmetric(horizontal: 16),
      minWidth: 0,
      child: FlatButton(
        child: Text(
          "See all",
          style: TextStyle(
            color: Color.fromARGB((0.5 * 255).toInt(), 57, 60, 79),
            fontSize: 13,
            letterSpacing: -0.08,
          ),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _taskCardList(TaskGroup taskGroup) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth - TaskLayouts.padding * 2;

    return SizedBox(
      height: 175,
      child: PageView.builder(
        controller: PageController(viewportFraction: cardWidth / screenWidth),
        itemCount: taskGroup.tasks.length,
        allowImplicitScrolling: true,
        itemBuilder: (context, i) => Card(
          clipBehavior: Clip.antiAlias,
          shape: TaskLayouts.roundedBorder,
          margin: i == 0
              ? EdgeInsets.only(right: 16, left: 0)
              : (i == 1
                  ? EdgeInsets.only(right: 8, left: 0)
                  : EdgeInsets.only(right: 8, left: 8)),
          child: TaskCard(task: taskGroup.tasks[i]),
        ),
      ),
    );
  }
}
