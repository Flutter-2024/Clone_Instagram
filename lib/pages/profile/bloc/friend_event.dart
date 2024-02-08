part of 'friend_bloc.dart';

abstract class FriendEvent extends Equatable {
  const FriendEvent();
}

class FriendEventDisplay extends FriendEvent {
  @override
  List<Object> get props => [];
}
class FriendEventHide extends FriendEvent {
  @override
  List<Object> get props => [];
}
class FriendEventLoad extends FriendEvent{
  @override
  List<Object> get props => [];
}