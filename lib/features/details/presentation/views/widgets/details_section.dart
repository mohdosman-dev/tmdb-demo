import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_demo/core/common/widgets/custom_outlined_button.dart';
import 'package:tmdb_demo/core/common/widgets/movie_widget.dart';
import 'package:tmdb_demo/features/details/data/models/movie_details.dart';
import 'package:tmdb_demo/features/details/presentation/bloc/details/details_bloc.dart';
import 'package:tmdb_demo/features/details/presentation/bloc/details/details_state.dart';
import 'package:tmdb_demo/features/home/data/models/movie.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<DetailsBloc, IDetailsState>(
      builder: (context, state) {
        if (state is LoadingDetailsState) {
          return const SizedBox(
            height: 300,
            width: double.infinity,
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is LoadedDetailsState) {
          final MovieDetails details = state.movieDetails;
          String genres = "";
          for (var genre in details.genres!) {
            genres += "${genre.name}\n";
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _buildTopView(height, context, genres, details),
              const SizedBox(height: 24),
              Text(
                details.originalTitle ?? 'N/A',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  CustomOutlinedButton(
                    icon: const Icon(Icons.play_circle),
                    title: "Watch Trailer",
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  CustomOutlinedButton(
                    icon: const Icon(Icons.list_alt),
                    title: "Add To My Watchlist",
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                'Plot summary',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                details.overview ?? 'N/A',
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          );
        } else if (state is ErrorDetailsState) {
          // TODO: Implement error widget
        }
        return Container();
      },
    );
  }

  Widget _buildTopView(double height, BuildContext context, String genres,
      MovieDetails details) {
    return SizedBox(
      height: height * 0.42,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: PosterWidget(movie: movie),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoWidget(
                  context,
                  Icons.movie,
                  'Genres',
                  genres,
                ),
                const SizedBox(height: 16),
                _buildInfoWidget(
                  context,
                  Icons.timer_outlined,
                  'Duration',
                  '${details.runtime} mins',
                ),
                const SizedBox(height: 16),
                _buildInfoWidget(
                  context,
                  Icons.star_outline,
                  'Rating',
                  '${details.voteAverage}',
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInfoWidget(
      BuildContext context, IconData icon, String title, String subtitle) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon),
          const SizedBox(height: 4),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
