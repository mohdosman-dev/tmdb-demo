import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_demo/core/theme/app_themes.dart';
import 'package:tmdb_demo/features/details/presentation/bloc/actors/actors_bloc.dart';
import 'package:tmdb_demo/features/details/presentation/bloc/actors/actors_event.dart';
import 'package:tmdb_demo/features/details/presentation/bloc/details/details_bloc.dart';
import 'package:tmdb_demo/features/details/presentation/bloc/details/details_event.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/genre/genre_bloc.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/genre/genre_event.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/trending/trending_bloc.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/trending/trending_event.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/upcoming/upcoming_bloc.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/upcoming/upcoming_event.dart';
import 'package:tmdb_demo/features/main_view.dart';
import 'package:tmdb_demo/features/search/presentation/bloc/search/search_bloc.dart';
import 'package:tmdb_demo/features/search/presentation/bloc/search/search_event.dart';
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
        //! --- Home ---
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

        //! --- Details ---
        BlocProvider<DetailsBloc>(
          create: (context) =>
              di.instance<DetailsBloc>()..add(const GetDetailsEvent(-1)),
        ),
        BlocProvider<ActorsBloc>(
          create: (context) =>
              di.instance<ActorsBloc>()..add(const GetActorsEvent(-1)),
        ),

        //! --- Search ---
        BlocProvider<SearchBloc>(
          create: (context) =>
              di.instance<SearchBloc>()..add(const GetSearchResultEvent("")),
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
