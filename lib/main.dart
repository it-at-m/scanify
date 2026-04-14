import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/features/export/bloc/export_cubit.dart';
import 'package:flutter_application/features/history/bloc/history_cubit.dart';
import 'package:flutter_application/core/navigation/navigation_widget.dart';
import 'package:flutter_application/core/navigation/navigation_cubit.dart';
import 'package:flutter_application/features/home/bloc/home_cubit.dart';
import 'package:flutter_application/features/scan/bloc/scan_cubit.dart';
import 'package:flutter_application/core/theme/theme.dart';
import 'package:flutter_application/core/theme/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final appDirectory = await getApplicationSupportDirectory();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(appDirectory.path),
  );

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HistoryCubit()),
        BlocProvider(
          create: (ctx) => ScanCubit(history: ctx.read<HistoryCubit>()),
        ),
        BlocProvider(create: (ctx) => ExportCubit(ctx.read<HistoryCubit>())),
        BlocProvider(create: (_) => NavigationCubit()),
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => HomeCubit()..loadPermissions()),
      ],
      child: Builder(
        builder: (context) {
          final themeMode = context
              .watch<ThemeCubit>()
              .state
              .mode
              .toThemeMode();

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Scanify',
            theme: buildLightTheme(Colors.blue),
            darkTheme: buildDarkTheme(Colors.blue),
            themeMode: themeMode,
            home: const NavigationWidget(),
          );
        },
      ),
    );
  }
}
