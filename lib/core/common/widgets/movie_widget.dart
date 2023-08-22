import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_demo/core/common/widgets/skeleton_widget.dart';
import 'package:tmdb_demo/core/string/constants.dart';
import 'package:tmdb_demo/features/home/data/models/movie.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({
    super.key,
    required this.movie,
    this.onTap,
  });

  final Movie movie;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 120,
        child: Column(
          children: [
            Expanded(
              child: PosterWidget(movie: movie),
            ),
            const SizedBox(height: 8),
            Text(
              movie.title ?? 'N/A',
              style: Theme.of(context).textTheme.labelLarge,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  (movie.voteAverage ?? 0.0).toStringAsFixed(3),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(width: 4),
                Text(
                  '•',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 14),
                ),
                const SizedBox(width: 4),
                Text(
                  movie.mediaType ?? 'N/A',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PosterWidget extends StatelessWidget {
  const PosterWidget({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: BASE_IMAGE_URL + (movie.posterPath ?? ''),
              fit: BoxFit.cover,
              placeholder: (context, url) => const Skeleton(),
            ),
          ),
          PositionedDirectional(
            top: 8,
            end: 8,
            child: InkWell(
              child: Icon(
                movie.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border_outlined,
                color: Colors.red,
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
