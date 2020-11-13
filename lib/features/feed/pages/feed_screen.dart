import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_app/features/feed/bloc/feed_bloc.dart';
import 'package:twitter_app/model/Tweet.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FeedBloc>(context).add(GetFeed());
  }

  @override
  Widget build(BuildContext context) {
    return _buildFeedList();
  }

  _buildFeedList() {
    return BlocBuilder<FeedBloc, FeedState>(builder: (context, state) {
      if (state is FeedLoading) {
        return _buildLoadingScreen();
      } else if (state is FeedLoaded) {
        return _buildSuccessScreen(state.tweets);
      } else if (state is FeedError) {
        return _buildErrosScreen();
      } else {
        return _buildErrosScreen();
      }
    });
  }

  _buildLoadingScreen() {
    return Center(child: CircularProgressIndicator());
  }

  _buildSuccessScreen(List<Tweet> tweets) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: tweets.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildSuccessScreenItem(tweets[index]);
      },
    );
  }

  _buildSuccessScreenItem(Tweet tweet) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Card(
          child: Container(
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 20),
              child: Text(tweet.title, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 5),
              child: Text(tweet.subtitle),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 5),
              child: Text(tweet.content),
            ),
            Row(
              children: [
                Spacer(),
                Image.network(tweet.image, height: 40),
                SizedBox(width: 20)
              ],
            )
          ],
        ),
      )),
    );
  }

  _buildErrosScreen() {
    return Text("Error");
  }
}
