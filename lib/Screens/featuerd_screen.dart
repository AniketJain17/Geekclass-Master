// ignore_for_file: unused_import, library_private_types_in_public_api

import 'package:geeclass/constants/color.dart';
import 'package:geeclass/constants/size.dart';
import 'package:geeclass/models/category.dart';
import 'package:geeclass/screens/course_screen.dart';
import 'package:geeclass/screens/details_screen.dart';
import 'package:geeclass/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../ui/views/home_view.dart';
import '../widgets/search_testfield.dart';
import 'Login/login_screen.dart';
import 'base_screen.dart';
import 'front page/sp.dart';
import 'home_screen.dart';

class FeaturedScreen extends StatefulWidget {
  const FeaturedScreen({Key? key}) : super(key: key);

  @override
  _FeaturedScreenState createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        drawer: Drawer(
          child: Container(
            color: Colors.white,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xFF6F35A5),
                  ),
                  // ignore: unnecessary_const

                  child: Text(
                    'Menu',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
                Expanded(
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text('Home'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const MobileWelcom();
                                },
                              ),
                            );
                          },
                        ),
                        ListTile(
                          title: const Text('Classes'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const HomeView();
                                },
                              ),
                            );
                          },
                        ),
                        ListTile(
                          title: const Text('Video call'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const HomeScreen();
                                },
                              ),
                            );
                          },
                        ),
                        ListTile(
                          title: const Text('Smart Attendance'),
                          onTap: () {},
                        ),
                        ListTile(
                          title: const Text('Mid-Term Marks'),
                          onTap: () {},
                        ),
                        ListTile(
                          title: const Text('E-learning'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const BaseScreen();
                                },
                              ),
                            );
                          },
                        ),
                        ListTile(
                          title: const Text('Log out'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const LoginScreen();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar:
            AppBar(elevation: 0, backgroundColor: Color(0xFF6F35A5), actions: [
          Row(
            children: [
              CircleButton(
                icon: Icons.notifications,
                onPressed: () {},
              ),
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    "assets/images/user.png",
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ],
          ),
        ]),
        body: Column(
          children: const [
            AppBar1(),
            Body(),
          ],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Explore Categories",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See All",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: kPrimaryColor),
                ),
              )
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 8,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 20,
            mainAxisSpacing: 24,
          ),
          itemBuilder: (context, index) {
            return CategoryCard(
              category: categoryList[index],
            );
          },
          itemCount: categoryList.length,
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CourseScreen(),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 4.0,
              spreadRadius: .05,
            ), //BoxShadow
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                category.thumbnail,
                height: kCategoryCardImageSize,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(category.name),
            Text(
              "${category.noOfCourses.toString()} courses",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class AppBar1 extends StatelessWidget {
  const AppBar1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      // height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.5],
          colors: [
            Color(0xFF6F35A5),
            Color(0xFF6F35A5),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello,\nGood Morning",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const SearchTextField(),
          )
        ],
      ),
    );
  }
}
