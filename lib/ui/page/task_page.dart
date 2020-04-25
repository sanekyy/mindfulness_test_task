import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:task/data/model/state/task_state.dart';
import 'package:task/data/model/task.dart';
import 'package:task/domain/task_page_bloc.dart';
import 'package:task/localizations.dart';
import 'package:task/ui/kit/task_images.dart';
import 'package:task/ui/kit/task_layouts.dart';
import 'package:task/ui/widget/settings.dart';
import 'package:task/utils/texts.dart';

class TaskPage extends StatefulWidget {
  static const routeName = '/task';

  final Task _task;

  TaskPage(this._task);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  TaskPageBloc _bloc;
  AppLocalizations _appLocalizations;

  _PageContent _pageContent = _PageContent.player;

  @override
  void initState() {
    super.initState();

    _bloc = TaskPageBloc(
      task: widget._task,
      soundRepository: context.read(),
      playerService: context.read(),
      prefs: context.read(),
    );
  }
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _appLocalizations = AppLocalizations.of(context);
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          _soundActionButton(),
          _settingsActionButton(),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: _body(),
    );
  }

  Widget _body() {
    return Stack(
      fit: StackFit.expand,
      children: [
        _backgroundImage(),
        _shadowOverlay(),
        _content(),
      ],
    );
  }

  Widget _backgroundImage() {
    return Image.asset(
      TaskImages.playerBackground,
      fit: BoxFit.cover,
    );
  }

  Widget _shadowOverlay() {
    return Container(
      color: Color(0xFF191919).withOpacity(0.5),
    );
  }

  Widget _content() {
    return AnimatedCrossFade(
      crossFadeState: _pageContent == _PageContent.player
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: Duration(milliseconds: 300),
      firstChild: _mainContent(),
      secondChild: Settings(_bloc),
      layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) {
        return Stack(
          fit: StackFit.expand,
          children: [
            topChild,
            bottomChild,
          ],
        );
      },
    );
  }

  Widget _mainContent() {
    return Column(
      children: [
        SizedBox(
          height: 44,
        ),
        _title(),
        _centralCircle(),
        _buttons(),
      ],
    );
  }

  Widget _title() {
    return Expanded(
      child: Center(
        child: Padding(
          padding: TaskLayouts.horizontalPadding,
          child: Text(
            widget._task.title,
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 34,
              letterSpacing: 0.41,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _centralCircle() {
    return IgnorePointer(
      ignoring: true,
      child: Container(
        width: 230,
        height: 230,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _progress(),
            _timeWithSubtitle(),
          ],
        ),
      ),
    );
  }

  Widget _progress() {
    return StreamBuilder<TaskPageState>(
        stream: _bloc.state,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();

          final state = snapshot.data;

          final duration = widget._task.duration.inMilliseconds;

          double value;

          if (duration == 0) {
            value = 0;
          } else {
            value = state.currentPosition.inMilliseconds.toDouble() / duration;
          }

          return CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.white.withOpacity(0.3),
            value: value,
          );
        });
  }

  Widget _timeWithSubtitle() {
    return Column(
      children: [
        Spacer(),
        _time(),
        _subtitle(),
      ],
    );
  }

  Widget _time() {
    return StreamBuilder<Duration>(
      stream: _bloc.state.map((it) => it.currentPosition),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();

        final formattedTime = Texts.formatTrackDuration(snapshot.data);

        return Text(
          formattedTime,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w200,
            fontSize: 34,
            letterSpacing: 0.41,
          ),
        );
      },
    );
  }

  Widget _subtitle() {
    return Expanded(
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(left: 28, right: 28, top: 16),
          child: Text(
            widget._task.subtitle,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              letterSpacing: -0.08,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttons() {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: ButtonTheme(
            minWidth: 135,
            height: 42,
            child: StreamBuilder<bool>(
              initialData: true,
              stream: _bloc.state
                  .map((it) => it.playing || it.currentPosition == Duration()),
              builder: (context, snapshot) {
                return AnimatedCrossFade(
                  crossFadeState: snapshot.data
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _beginPauseButton(),
                    ],
                  ),
                  secondChild: _stopAndResumeButtons(),
                  duration: Duration(milliseconds: 200),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _outlineButton({
    @required String text,
    @required VoidCallback onPressed,
  }) {
    return OutlineButton(
      borderSide: BorderSide(color: Colors.white),
      shape: TaskLayouts.roundedBorder,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16,
          letterSpacing: -0.41,
        ),
      ),
      onPressed: onPressed,
    );
  }

  Widget _stopAndResumeButtons() {
    return Padding(
      padding: TaskLayouts.horizontalPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _outlineButton(text: _appLocalizations.stop, onPressed: _bloc.stop),
          _resumeButton(),
        ],
      ),
    );
  }

  _resumeButton() {
    return RaisedButton(
      color: Colors.white,
      shape: TaskLayouts.roundedBorder,
      child: Text(
        _appLocalizations.resume,
        style: TextStyle(
          color: Color(0xFF0C2830),
          fontWeight: FontWeight.w600,
          fontSize: 16,
          letterSpacing: -0.41,
        ),
      ),
      onPressed: _bloc.resume,
    );
  }

  void _onSettingsClicked() {
    setState(() {
      if (_pageContent == _PageContent.player) {
        _pageContent = _PageContent.settings;
      } else {
        _pageContent = _PageContent.player;
      }
    });
  }

  Widget _soundActionButton() {
    return StreamBuilder<bool>(
        stream: _bloc.state.map((it) => it.volume == 0),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();

          final muted = snapshot.data;
          return IconButton(
            icon: SvgPicture.asset(
              TaskImages.sound,
              width: 16.67,
              height: 16.67,
              color: muted ? Colors.redAccent : Colors.white,
            ),
            onPressed: _bloc.toggleVolume,
          );
        });
  }

  Widget _settingsActionButton() {
    return IconButton(
      icon: SvgPicture.asset(
        _pageContent == _PageContent.settings
            ? TaskImages.activeSettings
            : TaskImages.inactiveSettings,
        width: 20,
        height: 20,
        color: Colors.white,
      ),
      onPressed: _onSettingsClicked,
    );
  }

  Widget _beginPauseButton() {
    return StreamBuilder<bool>(
      initialData: false,
      stream: _bloc.state
          .map((it) => !it.playing && it.currentPosition == Duration()),
      builder: (context, snapshot) {
        final showPlay = snapshot.data;
        if (showPlay) {
          return _outlineButton(
            text: _appLocalizations.begin,
            onPressed: _bloc.play,
          );
        } else {
          return _outlineButton(
            text: _appLocalizations.pause,
            onPressed: _bloc.pause,
          );
        }
      },
    );
  }
}

enum _PageContent {
  player,
  settings,
}
