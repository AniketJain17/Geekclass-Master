import 'package:flutter/material.dart';
import 'package:geeclass/Screens/base_screen.dart';
import 'package:geeclass/Screens/home_screen.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:geeclass/ui/views/home_view.dart';

import '../Login/login_screen.dart';

// ignore: camel_case_types
class secondpage extends StatelessWidget {
  const secondpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MobileWelcom();
  }
}

class MobileWelcom extends StatelessWidget {
  const MobileWelcom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6F35A5),
        title: const Text("LANDING PAGE"),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                "assets/images/user.png",
                // width: 40,
                // height: 40,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF6F35A5),
                  // backgroundColor: kPrimaryLightColor, elevation: 0),
                ),
                // ignore: unnecessary_const
                child: const Text(
                  'Menu',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30, color: Color.fromARGB(255, 255, 255, 255)),
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
                        title: const Text('Marks System'),
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
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.8995,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/abcd.jpg"),
                  fit: BoxFit.fill),
            ),
          ),
        ],
      ),
    );
  }
}
