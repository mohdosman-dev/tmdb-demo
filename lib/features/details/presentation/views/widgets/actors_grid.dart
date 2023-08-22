import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_demo/features/details/presentation/bloc/actors/actors_bloc.dart';
import 'package:tmdb_demo/features/details/presentation/bloc/actors/actors_state.dart';

class ActorsGrid extends StatelessWidget {
  const ActorsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActorsBloc, IActorsState>(
      builder: (context, state) {
        return Container();
      },
    );
  }
}
