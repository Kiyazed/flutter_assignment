import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/model/blog.dart';
import 'category_screen.dart';

class NewsBlog extends StatelessWidget {
  static const routeName = '/news';
  const NewsBlog(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.desc,
      required this.url})
      : super(key: key);
  final String imageUrl, title, desc, url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text(
          'FOR YOU',
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
      ),
      body: const ArticleModel(),
    );
  }
}

class ArticleModel extends StatefulWidget {
  const ArticleModel({super.key});

  @override
  State<ArticleModel> createState() => _ArticleModelState();
}

class _ArticleModelState extends State<ArticleModel> {
  List<BlogModel> blogs = <BlogModel>[];

  bool _loading = true;

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    blogs = newsClass.news;
    // ignore: avoid_print
    print(blogs[0].author);
    // ignore: avoid_print
    print(blogs[0].author);
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    // getNews();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        // ignore: prefer_const_constructors
        ? Center(
            child: const CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: blogs.length,
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(CategoryBlog.routeName);
                      },
                      child: Card(
                        elevation: 9,
                        // child: SizedBox(
                        //   width: 270,
                        //   height: 370,
                        //   child: Column(
                        //     children: [
                        //       SizedBox(
                        //         width: double.infinity,
                        //         height: 150,
                        //         child: Image.network(
                        //           blogs[index].urlToImage,
                        //           fit: BoxFit.cover,
                        //         ),
                        //       ),
                        //       Center(
                        //         child: Text(blogs[index].title,
                        //             textAlign: TextAlign.center,
                        //             style: const TextStyle(
                        //                 fontWeight: FontWeight.bold,
                        //                 fontSize: 16)),
                        //       ),
                        //       Text(
                        //         blogs[index].description,
                        //         textAlign: TextAlign.center,
                        //       ),
                        //       Text(
                        //         blogs[index].url,
                        //       )
                        //     ],
                        //   ),
                        // ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: BlogTile(
                            imageUrl: blogs[index].urlToImage,
                            title: blogs[index].title,
                            desc: blogs[index].description,
                            url: blogs[index].url,
                          ),
                        ),
                      ),
                    );
                  })),
            ),
          );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;
  const BlogTile(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.desc,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(imageUrl),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            desc,
            style: const TextStyle(
                color: Colors.black, overflow: TextOverflow.fade),
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
