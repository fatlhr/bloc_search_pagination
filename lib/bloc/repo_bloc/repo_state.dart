part of 'repo_bloc.dart';

abstract class RepoState extends Equatable {
  const RepoState();
  
  @override
  List<Object> get props => [];
}

class RepoInitial extends RepoState {}
