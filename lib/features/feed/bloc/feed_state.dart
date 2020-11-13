part of 'feed_bloc.dart';

@immutable
abstract class FeedState {}

class FeedInitial extends FeedState {}

class FeedLoading extends FeedState {}

class FeedLoaded extends FeedState {
  final List<Tweet> tweets;

  FeedLoaded({this.tweets});
}

class FeedError extends FeedState {
  String message;

  FeedError({this.message});
}
