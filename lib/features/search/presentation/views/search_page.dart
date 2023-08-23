import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_demo/features/search/presentation/bloc/search/search_bloc.dart';
import 'package:tmdb_demo/features/search/presentation/bloc/search/search_event.dart';
import 'package:tmdb_demo/features/search/presentation/bloc/search/search_state.dart';
import 'package:tmdb_demo/features/search/presentation/views/widgets/empty_result.dart';
import 'package:tmdb_demo/features/search/presentation/views/widgets/search_result.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SearchBloc>(context).add(const GetSearchResultEvent(""));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              onFieldSubmitted: (value) {
                BlocProvider.of<SearchBloc>(context)
                    .add(GetSearchResultEvent(value));
              },
              decoration: InputDecoration(
                hintText: 'Enter the movie name',
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 16),
            BlocBuilder<SearchBloc, ISearchState>(
              builder: (context, state) {
                if (state is SearchingState) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is LoadedSearchResultState) {
                  final results = state.results;
                  if (results.isEmpty) {
                    return const EmptyResults();
                  } else {
                    return Expanded(
                      child: SearchResult(results: results),
                    );
                  }
                } else if (state is ErrorSearchState) {
                  // TODO: Display error widget
                }
                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.movie,
                        size: 50,
                      ),
                      const SizedBox(height: 40),
                      Text(
                        'Type anything to start search',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(fontSize: 24),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
