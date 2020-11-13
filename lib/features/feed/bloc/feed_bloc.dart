import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:twitter_app/features/feed/data/feed_repository.dart';
import 'package:twitter_app/model/Tweet.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final FeedRepository repository;

  FeedBloc(this.repository) : super(FeedInitial());

  @override
  Stream<FeedState> mapEventToState(
    FeedEvent event,
  ) async* {
    try {
      if (event is GetFeed) {
        yield FeedLoading();
        var result = await repository.fetchTweets();
        yield FeedLoaded(tweets: result);
      }
    } catch (e) {
      yield FeedError(message: e.toString());
    }
  }
}
