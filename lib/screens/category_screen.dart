import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/model/blog.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/helper/news.dart';

class CategoryBlog extends StatefulWidget {
  static const routeName = '/category';
  const CategoryBlog({super.key});

  @override
  State<CategoryBlog> createState() => _CategoryBlogState();
}

class _CategoryBlogState extends State<CategoryBlog> {
  // ignore: deprecated_member_use, prefer_collection_literals
  List<CategoryModel> categories = <CategoryModel>[];
  List<BlogModel> blogs = <BlogModel>[];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  getNewsUs() async {
    NewsUs newsClass = NewsUs();
    await newsClass.getNewsUs();
    blogs = newsClass.newsBlog;
    // ignore: avoid_print
    print(blogs[0].author);
    // ignore: avoid_print
    print(blogs[0].author);
    setState(() {
      _loading = false;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getNewsUs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              'AFRIOPIA ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Text('NEWS',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.red,
                    fontWeight: FontWeight.bold))
          ],
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[200],
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    // ignore: avoid_unnecessary_containers
                    SizedBox(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Category(
                              imageUrl: categories[index].imageUrl,
                              categoryName: categories[index].categoryName,
                            );
                          }),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(top: 16),
                      child: ListView.builder(
                        itemCount: blogs.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: ((context, index) {
                          return Card(
                            elevation: 8,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: BlogTile(
                                imageUrl: blogs[index].urlToImage,
                                title: blogs[index].title,
                                desc: blogs[index].description,
                                url: blogs[index].url,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              // body:_loading?const Center(child: CircularProgressIndicator(),): Center(
              //   child: Text("selam kiya "),
              // ),
            ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({Key? key, required this.categoryName, required this.imageUrl})
      : super(key: key);

  final String categoryName, imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  imageUrl,
                  width: 120,
                  height: 60,
                  fit: BoxFit.cover,
                )),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.black26),
              child: Text(
                categoryName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
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
            style: const TextStyle(color: Colors.black),
          ),
          Text(url),
        ],
      ),
    );
  }
}
