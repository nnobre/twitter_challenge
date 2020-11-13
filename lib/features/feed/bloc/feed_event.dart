part of 'feed_bloc.dart';

@immutable
abstract class FeedEvent {}

class GetFeed extends FeedEvent {}
