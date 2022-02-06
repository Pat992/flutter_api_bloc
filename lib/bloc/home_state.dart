part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState {
  final String activityName;
  final String activityType;
  final int participants;

  const HomeLoadedState(
      this.activityName, this.activityType, this.participants);

  @override
  List<Object?> get props => [activityName, activityType, participants];
}

class HomeConnectionErrorState extends HomeState {
  @override
  List<Object?> get props => [];
}
