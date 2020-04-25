import 'package:built_collection/built_collection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/data/model/sound.dart';
import 'package:task/domain/task_page_bloc.dart';
import 'package:task/localizations.dart';
import 'package:task/ui/kit/task_layouts.dart';
import 'package:task/ui/widget/volume_slider.dart';

class Settings extends StatefulWidget {
  final TaskPageBloc _bloc;

  Settings(this._bloc);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  AppLocalizations _appLocalizations;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _appLocalizations = AppLocalizations.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return _settingsContent();
  }

  Widget _settingsContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(_appLocalizations.volume),
        SizedBox(height: 10),
        _volumeSlider(),
        SizedBox(height: 36),
        _title(_appLocalizations.sound),
        SizedBox(height: 18),
        _sounds(),
      ],
    );
  }

  _title(String title) {
    return Padding(
      padding: TaskLayouts.horizontalPadding,
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 13,
          letterSpacing: -0.08,
        ),
      ),
    );
  }

  Widget _volumeSlider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: TaskLayouts.padding / 2 + 1),
      child: StreamBuilder<double>(
        initialData: 0,
        stream: widget._bloc.state.map((it) => it.volume),
        builder: (context, snapshot) {
          return VolumeSlider(
            value: snapshot.data,
            onChanged: widget._bloc.setVolume,
          );
        },
      ),
    );
  }

  Widget _sounds() {
    return StreamBuilder<BuiltList<Sound>>(
      initialData: BuiltList<Sound>(),
      stream: widget._bloc.state.map((it) => it.sounds),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: snapshot.data.map(_soundItem).toList(),
          ),
        );
      },
    );
  }

  Widget _soundItem(Sound sound) {
    return StreamBuilder<bool>(
      initialData: false,
      stream: widget._bloc.state.map((it) => it.activeSound == sound),
      builder: (context, snapshot) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => widget._bloc.setActiveSound(sound),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Opacity(
              opacity: snapshot.data ? 1 : 0.4,
              child: Column(
                children: [
                  _soundItemImage(sound.imageUrl),
                  SizedBox(height: 10),
                  _soundItemTitle(sound.title),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _soundItemImage(String imageUrl) {
    final size = 30.0;
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _soundItemTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 10,
        letterSpacing: 0.16,
      ),
    );
  }
}
