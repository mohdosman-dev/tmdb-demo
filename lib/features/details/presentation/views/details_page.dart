import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_demo/features/details/presentation/bloc/actors/actors_bloc.dart';
import 'package:tmdb_demo/features/details/presentation/bloc/actors/actors_event.dart';
import 'package:tmdb_demo/features/details/presentation/bloc/details/details_bloc.dart';
import 'package:tmdb_demo/features/details/presentation/bloc/details/details_event.dart';
import 'package:tmdb_demo/features/details/presentation/views/widgets/details_section.dart';
import 'package:tmdb_demo/features/home/data/models/movie.dart';

class DetailsPage extends StatefulWidget {
  final Movie movie;
  const DetailsPage({super.key, required this.movie});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DetailsBloc>(context)
        .add(GetDetailsEvent(widget.movie.id ?? -1));
    BlocProvider.of<ActorsBloc>(context)
        .add(GetActorsEvent(widget.movie.id ?? -1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DetailsSection(movie: widget.movie),
          ],
        ),
      ),
    );
  }
}
