import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/screens/newsblog.dart';
import 'package:news_app/views/tags.dart';

import '../images/images.dart';

class Article extends StatelessWidget {
  const Article({
    Key? key,
  }) : super(key: key);
  static const routeName = '/article';

  @override
  Widget build(BuildContext context) {
    final articles = ModalRoute.of(context)!.settings.arguments as ArticleData;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, NewsBlog.routeName);
      },
      child: Images(
        width: double.infinity,
        imageUrl: articles.imageUrl,
        padding: const EdgeInsets.all(10),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(color: Colors.white),
            elevation: 0,
          ),
          extendBodyBehindAppBar: true,
          body: ListView(
            children: [
              NewsHeadline(
                articles: articles,
              ),
              NewsBody(articles: articles),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsBody extends StatelessWidget {
  const NewsBody({
    Key? key,
    required this.articles,
  }) : super(key: key);

  final ArticleData articles;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Tags(backgroundColor: Colors.white, children: [
              CircleAvatar(
                radius: 10,
                backgroundImage: NetworkImage(articles.authorImageUrl),
              ),
              Text(
                articles.author,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.black),
              ),
            ]),
            Tags(
              backgroundColor: Colors.white,
              children: [
                const Icon(
                  Icons.timer,
                  color: Colors.black,
                ),
                Text(
                    '${DateTime.now().difference(articles.createdAt).inHours}hours ago',
                    style: Theme.of(context).textTheme.bodyMedium!),
                const Icon(
                  Icons.remove_red_eye,
                  color: Colors.black,
                ),
                Text('${articles.views}',
                    style: Theme.of(context).textTheme.bodyMedium!),
              ],
            ),
          ]),
          const SizedBox(height: 10),
          Text(
            articles.title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            articles.body,
            style:
                Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.5),
          ),
          const SizedBox(
            height: 10,
          ),
          GridView.builder(
              shrinkWrap: true,
              itemCount: 2,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1.25),
              itemBuilder: (context, index) {
                return Images(
                  width: MediaQuery.of(context).size.width * 0.42,
                  imageUrl: articles.imageUrl,
                  margin: const EdgeInsets.only(
                    right: 5.0,
                    bottom: 9.0,
                  ),
                  padding: EdgeInsets.zero,
                );
              })
        ],
      ),
    );
  }
}

class NewsHeadline extends StatelessWidget {
  const NewsHeadline({
    Key? key,
    required this.articles,
  }) : super(key: key);
  final ArticleData articles;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
          ),
          Tags(backgroundColor: Colors.grey, children: [
            Text(
              articles.category,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                  ),
            )
          ]),
          const SizedBox(
            height: 10,
          ),
          Text(
            articles.title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  height: 1.23,
                  color: Colors.white,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            articles.subtitle,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
          )
        ],
      ),
    );
  }
}
