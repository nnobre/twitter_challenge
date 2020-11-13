import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_app/features/feed/bloc/feed_bloc.dart';
import 'package:twitter_app/features/feed/data/feed_repository.dart';

import 'features/feed/data/feed_data_source.dart';

class BlocDependency {
  static setBlocs() {
    return [
      BlocProvider<FeedBloc>(
        create: (context) => FeedBloc(
          FeedRepository(FeedMockedDataSource()),
        ),
      ),
    ];
  }
}
