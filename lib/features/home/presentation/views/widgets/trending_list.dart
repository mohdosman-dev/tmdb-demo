import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_demo/core/common/widgets/loading_widget.dart';
import 'package:tmdb_demo/core/common/widgets/movie_widget.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/trending/trending_bloc.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/trending/trending_state.dart';

class TrendingList extends StatelessWidget {
  const TrendingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 250,
      ),
      child: BlocBuilder<TrendingBloc, ITrendingState>(
        builder: (context, state) {
          if (state is LoadingTrendingState) {
            return ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                4,
                (index) => const LoadingWidget(
                  height: 300,
                ),
              ),
            );
          } else if (state is LoadedTrendingState) {
            // TODO: Implement horisential list list
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                final movie = state.movies.elementAt(index);
                return MovieWidget(movie: movie);
              },
              separatorBuilder: (context, index) => const SizedBox(width: 8),
            );
          } else if (state is ErrorTrendingState) {
            // TODO: Implement error widget
          }
          return Container();
        },
      ),
    );
  }
}
