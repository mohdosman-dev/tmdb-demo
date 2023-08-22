import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/genre/genre_bloc.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/genre/genre_state.dart';

class GenreList extends StatelessWidget {
  const GenreList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 300,
      ),
      child: BlocBuilder<GenreBloc, IGenreState>(
        builder: (context, state) {
          if (state is LoadingGenreState) {}
          return Container();
        },
      ),
    );
  }
}
