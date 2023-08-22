import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_demo/core/common/widgets/loading_widget.dart';
import 'package:tmdb_demo/core/common/widgets/movie_widget.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/upcoming/upcoming_bloc.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/upcoming/upcoming_event.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/upcoming/upcoming_state.dart';

class UpcomingList extends StatelessWidget {
  const UpcomingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 250,
      ),
      child: BlocBuilder<UpcomingBloc, IUpcomingState>(
        builder: (context, state) {
          if (state is LoadingUpcomingState) {
            return ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                4,
                (index) => const LoadingWidget(
                  height: 300,
                ),
              ),
            );
          } else if (state is LoadedUpcomingState) {
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
          } else if (state is ErrorUpcomingState) {
            // TODO: Implement error widget
          }
          return Container();
        },
      ),
    );
  }
}
