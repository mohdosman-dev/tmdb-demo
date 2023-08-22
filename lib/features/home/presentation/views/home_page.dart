import 'package:flutter/material.dart';
import 'package:tmdb_demo/core/theme/app_colors.dart';
import 'package:tmdb_demo/features/home/presentation/views/widgets/gernes_list.dart';
import 'package:tmdb_demo/features/home/presentation/views/widgets/trending_list.dart';
import 'package:tmdb_demo/features/home/presentation/views/widgets/upcoming_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Osman 👋',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 14),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Bring popcorn, it\'s a movie time',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/images/avatar.png',
                    width: 60,
                    height: 60,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              _buildSectionTitle(
                context,
                'Categories',
                () {},
              ),
              const SizedBox(height: 16),
              const GenreList(),
              const SizedBox(height: 16),
              _buildSectionTitle(
                context,
                'Trending Movie',
                () {},
              ),
              const SizedBox(height: 16),
              const TrendingList(),
              const SizedBox(height: 16),
              _buildSectionTitle(
                context,
                'Upcoming movie',
                () {},
              ),
              const SizedBox(height: 16),
              const UpcomingList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(
      BuildContext context, String title, VoidCallback onSeeMore) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        InkWell(
          onTap: onSeeMore,
          child: Row(
            children: [
              Text(
                'See more',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: kMainColor),
              ),
              const Icon(
                Icons.chevron_right,
                color: kMainColor,
              ),
            ],
          ),
        )
      ],
    );
  }
}
