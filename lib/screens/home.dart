import 'package:flutter/material.dart';
import 'package:flutter_api_bloc/bloc/home_bloc.dart';
import 'package:flutter_api_bloc/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        RepositoryProvider.of<ConnectivityService>(context),
        RepositoryProvider.of<BoredService>(context),
      )..add(LoadApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Activities'),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeLoadedState) {
              return Center(
                child: Column(
                  children: <Widget>[
                    Text(state.activityName),
                    Text(state.activityType),
                    Text(state.participants.toString()),
                    ElevatedButton(
                      onPressed: () => BlocProvider.of<HomeBloc>(context)
                          .add(LoadApiEvent()),
                      child: const Text('Get new activity'),
                    ),
                  ],
                ),
              );
            }
            if (state is HomeConnectionErrorState) {
              return const Center(
                child: Text('No internet'),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
