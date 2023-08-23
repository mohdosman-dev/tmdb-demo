import 'package:flutter/material.dart';
import 'package:tmdb_demo/core/common/widgets/movie_widget.dart';
import 'package:tmdb_demo/features/home/data/models/movie.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key, required this.results});
  final List<Movie> results;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: results.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.5,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        final movie = results.elementAt(index);
        return MovieWidget(movie: movie);
      },
    );
  }
}
