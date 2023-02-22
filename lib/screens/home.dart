import 'package:flutter/material.dart';
import 'package:news_app/images/images.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/screens/article.dart';
import 'package:news_app/views/drawer.dart';
import 'package:news_app/views/tags.dart';

import '../views/bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    ArticleData articles = ArticleData.articles[0];
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        title: Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              'AFRIOPIA ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const Text('NEWS',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.red,
                    fontWeight: FontWeight.bold))
          ],
        ),
        backgroundColor: Colors.grey[200],
        elevation: 0,
      ),
      bottomNavigationBar: const BottomNavBar(index: 0),
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          LatestNews(articles: articles),
          BreakingNews(articles: ArticleData.articles),
        ],
      ),
    );
  }
}

class BreakingNews extends StatelessWidget {
  const BreakingNews({
    Key? key,
    required this.articles,
  }) : super(key: key);
  final List<ArticleData> articles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50, left: 50),
                ),
                Text('LATEST NEWS',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 100,
                ),
                Text('MORE', style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
          SizedBox(
            height: 450,
            child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: (() {
                      Navigator.pushNamed(context, Article.routeName,
                          arguments: articles[index]);
                    }),
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Images(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: double.infinity,
                            imageUrl: articles[index].imageUrl,
                            padding: null,
                          ),
                          const SizedBox(height: 10),
                          Text(articles[index].title,
                              maxLines: 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.bold, height: 2)),
                          const SizedBox(height: 5),
                          Text(
                            '${DateTime.now().difference(articles[index].createdAt).inHours}hours ago',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'by ${articles[index].author}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  );
                })),
          )
        ],
      ),
    );
  }
}

class LatestNews extends StatelessWidget {
  const LatestNews({
    Key? key,
    required this.articles,
  }) : super(key: key);

  final ArticleData articles;

  @override
  Widget build(BuildContext context) {
    return Images(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      imageUrl: articles.imageUrl,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Tags(
            backgroundColor: Colors.black12,
            children: [
              Text('FOR YOU',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            articles.title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                  color: Colors.white,
                ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: Row(
              children: [
                Text(
                  'Learn More',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                      ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
