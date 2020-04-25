import 'package:flutter/material.dart';
import 'package:task/data/model/task.dart';
import 'package:task/localizations.dart';
import 'package:task/ui/kit/task_images.dart';
import 'package:task/ui/kit/task_layouts.dart';
import 'package:task/ui/page/task_page.dart';
import 'package:task/utils/texts.dart';

class TaskCard extends StatefulWidget {
  final Task task;

  const TaskCard({Key key, @required this.task}) : super(key: key);

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _backgroundImage(),
        _infoOverlay(),
      ],
    );
  }

  Widget _backgroundImage() {
    return Image.asset(
      TaskImages.cardBackground,
      fit: BoxFit.cover,
    );
  }

  Widget _infoOverlay() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _openTask,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _info(widget.task.info),
                    Spacer(),
                    _title(widget.task.title),
                    _subtitle(widget.task.subtitle),
                    SizedBox(height: 16),
                    _time(widget.task.duration),
                  ],
                ),
              ),
              SizedBox(width: 10),
              _beginButton(),
            ],
          ),
        ),
      ),
    );
    return Center(
      child: Text("Text"),
    );
  }

  Widget _beginButton() {
    return RaisedButton(
      padding: EdgeInsets.zero,
      child: Text(
        AppLocalizations.of(context).begin.toUpperCase(),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 15,
          letterSpacing: -0.24,
        ),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: _openTask,
      color: Color(0xFF08C5D1),
      shape: TaskLayouts.roundedBorder,
    );
  }

  Widget _info(String info) {
    return SizedBox(
      width: 100,
      child: Text(
        info,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.white,
          fontSize: 13,
          letterSpacing: -0.31,
        ),
      ),
    );
  }

  Widget _title(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 17,
        letterSpacing: -0.41,
      ),
    );
  }

  Widget _subtitle(String subtitle) {
    return Text(
      subtitle,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w300,
        fontSize: 11,
        height: 1.18,
        letterSpacing: 0.07,
      ),
    );
  }

  Widget _time(Duration duration) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.timer,
          color: Colors.white,
        ),
        SizedBox(width: 5),
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(
            Texts.formatTaskDuration(duration),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  void _openTask() {
    Navigator.pushNamed(context, TaskPage.routeName, arguments: [widget.task]);
  }
}
