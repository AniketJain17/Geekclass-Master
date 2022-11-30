import 'package:flutter/material.dart';
import 'package:geeclass/Screens/base_screen.dart';
import 'package:geeclass/Screens/home_screen.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:geeclass/ui/views/home_view.dart';

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
        backgroundColor: const Color.fromARGB(255, 130, 29, 108),
        title: const Text("LANDING PAGE"),
        elevation: 0,
      ),
      drawer: Drawer(
        child: Container(
          color: const Color.fromARGB(168, 200, 24, 162),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 130, 29, 108),
                  // backgroundColor: kPrimaryLightColor, elevation: 0),
                ),
                // ignore: unnecessary_const
                child: const Text(
                  'Menu',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25, color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: [
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
                  image: AssetImage("assets/images/abcd.png"),
                  fit: BoxFit.fill),
            ),
          ),
        ],
      ),
    );
  }
}
