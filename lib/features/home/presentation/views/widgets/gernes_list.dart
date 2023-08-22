import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_demo/core/common/widgets/loading_widget.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/genre/genre_bloc.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/genre/genre_state.dart';

class GenreList extends StatelessWidget {
  const GenreList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 140,
      ),
      child: BlocBuilder<GenreBloc, IGenreState>(
        builder: (context, state) {
          if (state is LoadingGenreState) {
            return ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                4,
                (index) => const LoadingWidget(),
              ),
            );
          } else if (state is LoadedGenreState) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.genres.length,
              itemBuilder: (context, index) {
                final genre = state.genres.elementAt(index);
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(24.0),
                          child: const Text(
                            '😂',
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        genre.name ?? 'N/A',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
            );
          } else if (state is ErrorGenreState) {
            // TODO: Implement error widget
          }
          return Container();
        },
      ),
    );
  }
}
