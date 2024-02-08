part of 'friend_bloc.dart';

abstract class FriendState extends Equatable {
  const FriendState();
}

class FriendInitial extends FriendState {
  @override
  List<Object> get props => [];
}

class FriendDisplay extends FriendState {
  @override
  List<Object> get props => [];
}

class FriendLoading extends FriendState{
  @override
  List<Object?> get props => throw UnimplementedError();
}

class FriendHide extends FriendState {
  @override
  List<Object> get props => [];
}
