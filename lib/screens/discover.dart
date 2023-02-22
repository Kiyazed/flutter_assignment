import 'package:flutter/material.dart';
import 'package:news_app/images/images.dart';
import 'package:news_app/model/article_model.dart';

import '../views/bottom_bar.dart';

class Discover extends StatelessWidget {
  const Discover({super.key});
  static const routeName = '/discover';
  @override
  Widget build(BuildContext context) {
    List<String> tabs = ['FEATURED', 'TECH & SCIENCE', 'SPORT', 'POLITICS'];
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'AFRIOPIA',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.grey[200],
            elevation: 0,
            leading: IconButton(
              onPressed: (() {}),
              icon: const Icon(Icons.menu, color: Colors.grey),
            ),
          ),
          bottomNavigationBar: const BottomNavBar(index: 1),
          body: ListView(
            padding: const EdgeInsets.all(12),
            children: [
              const DiscoverNews(),
              Category(
                tabs: tabs,
              )
            ],
          )),
    );
  }
}

class Category extends StatelessWidget {
  const Category({
    Key? key,
    required this.tabs,
  }) : super(key: key);
  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    final articles = ArticleData.articles;

    return Column(
      children: [
        TabBar(
          isScrollable: true,
          indicatorColor: Colors.black,
          tabs: tabs
              .map(
                (tab) => Tab(
                  icon: Text(
                    tab,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              )
              .toList(),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(
              children: tabs
                  .map(
                    (tab) => ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // Navigator.of(context).pushNamed();
                          },
                          child: Row(
                            children: [
                              Images(
                                width: 77,
                                height: 77,
                                margin: const EdgeInsets.all(10),
                                borderRadius: 5,
                                imageUrl: articles[index].imageUrl,
                                padding: null,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(articles[index].title,
                                        maxLines: 2,
                                        overflow: TextOverflow.clip,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            )),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        const Icon(Icons.schedule, size: 17),
                                        const SizedBox(width: 4),
                                        Text(
                                            '${DateTime.now().difference(articles[index].createdAt).inHours}hours ago',
                                            style:
                                                const TextStyle(fontSize: 10)),
                                        const SizedBox(width: 19),
                                        const Icon(Icons.visibility, size: 17),
                                        Text(
                                          '${articles[index].views}views',
                                          style: const TextStyle(fontSize: 12),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                  .toList()),
        ),
      ],
    );
  }
}

class DiscoverNews extends StatefulWidget {
  const DiscoverNews({
    Key? key,
  }) : super(key: key);

  // ignore: non_constant_identifier_names

  @override
  State<DiscoverNews> createState() => _DiscoverNewsState();
}

class _DiscoverNewsState extends State<DiscoverNews> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'DISCOVER',
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'search Afriopia News',
              hintStyle: const TextStyle(color: Colors.grey),
              fillColor: Colors.grey[300],
              filled: true,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              suffixIcon: const RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  Icons.tune,
                  color: Colors.grey,
                ),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(19.0),
                  borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(height: 20.0),
          // ignore: prefer_is_empty
          /*  Expanded(
              // ignore: prefer_is_empty
              child: display.length == 0
                  ? const Center(
                      child: Text(
                        "No result found",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 23.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : ListView.builder(
                      itemCount: display.length,
                      itemBuilder: ((context, index) => ListTile(
                            contentPadding: const EdgeInsets.all(8.0),
                            title: Text(
                              display[index].news_title!,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              '${display[index].news_release_year!}',
                              style: const TextStyle(color: Colors.black),
                            ),
                            leading: Image.network(display[index].news_url!),
                          )),
                    )),*/
        ],
      ),
    );
  }
}
