import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'friend_event.dart';
part 'friend_state.dart';

class FriendBloc extends Bloc<FriendEvent, FriendState> {
  FriendBloc() : super(FriendInitial()) {
    on<FriendEventDisplay>(_onFriendEventDisplay);
    on<FriendEventHide>(_onFriendEventHide);

  }

  Future<FutureOr<void>> _onFriendEventDisplay(event, Emitter<FriendState> emit) async {
    emit(FriendLoading());
    await Future.delayed(const Duration(seconds: 2), (){});
    emit(FriendDisplay());
  }


  FutureOr<void> _onFriendEventHide(FriendEventHide event, Emitter<FriendState> emit) {
    emit(FriendHide());
  }


}
