import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_demo/core/theme/app_themes.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/genre/genre_bloc.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/genre/genre_event.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/trending/trending_bloc.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/trending/trending_event.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/upcoming/upcoming_bloc.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/upcoming/upcoming_event.dart';
import 'package:tmdb_demo/features/main_view.dart';
import 'dependancy_container.dart' as di;

void main() async {
  await di.init();
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GenreBloc>(
          create: (context) => di.instance<GenreBloc>()..add(GetGenresEvent()),
        ),
        BlocProvider<TrendingBloc>(
          create: (context) =>
              di.instance<TrendingBloc>()..add(GetTrendingEvent()),
        ),
        BlocProvider<UpcomingBloc>(
          create: (context) =>
              di.instance<UpcomingBloc>()..add(GetUpcomingEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: appLightTheme,
        darkTheme: appDarkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: const MainView(),
      ),
    );
  }
}
