import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/data/model/task.dart';
import 'package:task/data/repository/sound_repository.dart';
import 'package:task/data/repository/task_repository.dart';
import 'package:task/localizations.dart';
import 'package:task/service/player_service.dart';
import 'package:task/service/preferences_service.dart';
import 'package:task/ui/page/main_page.dart';
import 'package:task/ui/page/task_page.dart';
import 'package:task/utils/log.dart';

const _tag = "main";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  PreferencesService.prefs = await SharedPreferences.getInstance();

  if (kReleaseMode) {
    Log.d(_tag, "App in release mode");
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Log.e(_tag, "Error widget!\n$details");
      return Container();
    };
  } else {
    Log.d(_tag, "App in debug mode");
  }

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SoundRepository _soundRepository;
  TaskRepository _taskRepository;
  PlayerService _playerService;
  PreferencesService _prefs;

  @override
  void initState() {
    super.initState();

    _soundRepository = SoundRepository();
    _taskRepository = TaskRepository();
    _playerService = PlayerService();
    _prefs = PreferencesService();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SoundRepository>(
          create: (_) => _soundRepository,
          dispose: (_, it) => it.dispose(),
        ),
        Provider<TaskRepository>(
          create: (_) => _taskRepository,
          dispose: (_, it) => it.dispose(),
        ),
        Provider<PlayerService>(
          create: (_) => _playerService,
          dispose: (_, it) => it.dispose(),
        ),
        Provider.value(value: _prefs),
      ],
      child: MaterialApp(
        localizationsDelegates: [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [Locale("en"), Locale("ru")],
        theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.white,
        ),
        home: MainPage(),
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    Widget page;
    final List arguments = settings.arguments as List;
    switch (settings.name) {
      case TaskPage.routeName:
        final Task task = arguments[0];
        page = TaskPage(task);
        break;
      default:
        return null;
    }

    return MaterialPageRoute(
      settings: settings,
      builder: (_) => page,
    );
  }
}
