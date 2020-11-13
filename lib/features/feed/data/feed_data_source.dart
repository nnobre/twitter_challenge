import 'package:twitter_app/model/Tweet.dart';

abstract class FeedDataSource {
  Future<List<Tweet>> fetchTweets();
}

class FeedRemoteDataSource implements FeedDataSource {
  @override
  Future<List<Tweet>> fetchTweets() {
    throw UnimplementedError();
  }
}

class FeedMockedDataSource implements FeedDataSource {
  @override
  Future<List<Tweet>> fetchTweets() {
    List<Tweet> tweets = [
      Tweet(
          title: "title1",
          subtitle: "subtitle",
          image:
              "https://icons-for-free.com/iconfiles/png/512/social+tweet+twitter+icon-1320192248146512175.png",
          content: "eifjeoijfoiessdxcxcsdsdsd"),
      Tweet(
          title: "title1",
          subtitle: "subtitle",
          image:
              "https://icons-for-free.com/iconfiles/png/512/social+tweet+twitter+icon-1320192248146512175.png",
          content: "eifjeoijfoiedsddsdsdsdsdsdsd"),
      Tweet(
          title: "title1",
          subtitle: "subtitle",
          image:
              "https://icons-for-free.com/iconfiles/png/512/social+tweet+twitter+icon-1320192248146512175.png",
          content: "eifjeoijfoie"),
      Tweet(
          title: "title1",
          subtitle: "subtitle",
          image:
              "https://icons-for-free.com/iconfiles/png/512/social+tweet+twitter+icon-1320192248146512175.png",
          content: "eifjeoijfoie"),
      Tweet(
          title: "title1",
          subtitle: "subtitle",
          image:
              "https://icons-for-free.com/iconfiles/png/512/social+tweet+twitter+icon-1320192248146512175.png",
          content: "eifjeoijfoie"),
      Tweet(
          title: "title1",
          subtitle: "subtitle",
          image:
              "https://icons-for-free.com/iconfiles/png/512/social+tweet+twitter+icon-1320192248146512175.png",
          content: "eifjeoijfoie"),
      Tweet(
          title: "title1",
          subtitle: "subtitle",
          image:
              "https://icons-for-free.com/iconfiles/png/512/social+tweet+twitter+icon-1320192248146512175.png",
          content: "eifjeoijfoie")
    ];

    return Future.delayed(
      Duration(seconds: 2),
      () {
        return tweets;
      },
    );
  }
}
