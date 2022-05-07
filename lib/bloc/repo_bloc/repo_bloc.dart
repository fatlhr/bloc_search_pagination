import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'repo_event.dart';
part 'repo_state.dart';

class RepoBloc extends Bloc<RepoEvent, RepoState> {
  RepoBloc() : super(RepoInitial()) {
    on<RepoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
