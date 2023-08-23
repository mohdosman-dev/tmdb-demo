import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_demo/core/common/widgets/loading_widget.dart';
import 'package:tmdb_demo/core/common/widgets/skeleton_widget.dart';
import 'package:tmdb_demo/core/string/constants.dart';
import 'package:tmdb_demo/features/details/presentation/bloc/actors/actors_bloc.dart';
import 'package:tmdb_demo/features/details/presentation/bloc/actors/actors_state.dart';

class ActorsGrid extends StatelessWidget {
  const ActorsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActorsBloc, IActorsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cast',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
            ),
            const SizedBox(height: 16),
            BlocBuilder<ActorsBloc, IActorsState>(
              builder: (context, state) {
                if (state is LoadingActorsState) {
                  return GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    primary: false,
                    children: List.generate(
                      4,
                      (index) => const LoadingWidget(
                          child: CircleSkeleton(
                        size: 100,
                      )),
                    ),
                  );
                } else if (state is LoadedActorsState) {
                  // TODO: Implement cast grid
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemCount: state.actors.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) {
                      final actor = state.actors.elementAt(index);
                      return Container(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: CachedNetworkImage(
                                imageUrl:
                                    BASE_IMAGE_URL + (actor.profilePath ?? ''),
                                placeholder: (context, url) => Image.asset(
                                  'assets/images/placeholder.jpg',
                                  fit: BoxFit.cover,
                                ),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  'assets/images/profile-placeholder.jpg',
                                  fit: BoxFit.cover,
                                ),
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              actor.name ?? 'N/A',
                              style: Theme.of(context).textTheme.titleSmall,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      );
                    },
                  );
                } else if (state is ErrorActorsState) {
                  // TODO: Implement error widget
                }
                return Container();
              },
            ),
          ],
        );
      },
    );
  }
}
