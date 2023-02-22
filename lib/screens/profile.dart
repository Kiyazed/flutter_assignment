import 'package:flutter/material.dart';

import '../views/bottom_bar.dart';

class Profile extends StatefulWidget {
  static const routename = '/profile';

  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isfavorite = false;
  bool isbookmark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(index: 2),
      appBar: AppBar(
        backgroundColor: Colors.white70,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.refresh_outlined,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person_add,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              )),
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          height: MediaQuery.of(context).size.height - 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.only(left: 0),
                child: const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black87,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              const Text(
                'Your Profile',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: 80,
                width: MediaQuery.of(context).size.width / 2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.favorite,
                              color: isfavorite ? Colors.red : Colors.black),
                          onPressed: () {
                            setState(() {
                              isfavorite = !isfavorite;
                            });
                          },
                        ),
                        const Text('Like'),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.newspaper),
                          onPressed: () {},
                        ),
                        const Text('Magazine'),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.bookmark,
                            color: isbookmark ? Colors.red : Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              isbookmark = !isbookmark;
                            });
                          },
                        ),
                        const Text('favorite'),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.pinkAccent[100],
                width: double.infinity,
                height: 500,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add,
                        size: 80,
                      ),
                      const Text(
                        'SAVE STORIES INTO YOUR OWN MAGAZINES',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.thumb_up,
                            size: 80,
                          ))
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//
// leading: CircleAvatar(
// child: Icon(Icons.person),
// ),
// actions: [
// IconButton(onPressed: () {}, icon: Icon(Icons.refresh_outlined)),
// IconButton(onPressed: () {}, icon: Icon(Icons.person_add)),
// IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
// ],
// backgroundColor: Colors.grey[200],
