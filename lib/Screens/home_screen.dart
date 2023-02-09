// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:geeclass/models/data_store.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../services/join_service.dart';
import '../services/sdk_initializer.dart';
import '../ui/views/home_view.dart';
import 'Login/login_screen.dart';
import 'base_screen.dart';
import 'front page/sp.dart';
import 'meeting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserDataStore _dataStore;
  // ignore: unused_field
  bool _isLoading = false;

  @override
  void initState() {
    SdkInitializer.hmssdk.build();
    getPermissions();
    super.initState();
  }

  void getPermissions() async {
    await Permission.camera.request();
    await Permission.microphone.request();

    while ((await Permission.camera.isDenied)) {
      await Permission.camera.request();
    }
    while ((await Permission.microphone.isDenied)) {
      await Permission.microphone.request();
    }
  }

  //Handles room joining functionality
  Future<bool> joinRoom() async {
    setState(() {
      _isLoading = true;
    });
    //The join method initialize sdk,gets auth token,creates HMSConfig and helps in joining the room
    bool isJoinSuccessful = await JoinService.join(SdkInitializer.hmssdk);
    if (!isJoinSuccessful) {
      return false;
    }
    _dataStore = UserDataStore();
    //Here we are attaching a listener to our DataStoreClass
    _dataStore.startListen();
    setState(() {
      _isLoading = false;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: Color(0xFF6F35A5),
          elevation: 0,
          title: const Text("GMeet"),
          centerTitle: true,
          actions: [
            IconButton(
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(360),
                child: Image.asset(
                  "assets/images/user.png",
                  // width: 40,
                  // height: 40,
                ),
              ),
              onPressed: () {},
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
                        fontSize: 30,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
                Expanded(
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () async {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 200,
                            child: ListView(
                              padding: EdgeInsets.zero,
                              children: <Widget>[
                                ListTile(
                                  title: Row(
                                    children: const [
                                      Icon(Icons.video_call),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('Start an instant meeting'),
                                    ],
                                  ),
                                  onTap: () async {
                                    bool isJoined = await joinRoom();
                                    if (isJoined) {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (_) =>
                                              ListenableProvider.value(
                                                  value: _dataStore,
                                                  child:
                                                      const MeetingScreen())));
                                    } else {
                                      const SnackBar(content: Text("Error"));
                                    }
                                  },
                                ),
                                ListTile(
                                  title: Row(
                                    children: const [
                                      Icon(Icons.close),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('Close'),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: const Text('New meeting'),
                  ),
                  OutlinedButton(
                      onPressed: () {}, child: const Text('Join with a code'))
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              child: Image.network(
                  "https://fonts.gstatic.com/s/i/productlogos/meet_2020q4/v1/web-96dp/logo_meet_2020q4_color_2x_web_96dp.png"),
            )
          ],
        ),
      ),
    );
  }
}
