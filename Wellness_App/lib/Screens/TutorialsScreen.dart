import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Alerts.dart';
import 'package:flutter_auth/Screens/Faq.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/TutorsScreen.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:flutter_auth/utils/dash/T14Colors.dart';
import 'package:flutter_auth/utils/dash/T14DataGenerator.dart';
import 'package:flutter_auth/utils/dash/T14Model.dart';
import 'package:flutter_auth/utils/dash/T14Strings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TutorialsScreen extends StatefulWidget {
  @override
  _TutorialsScreenState createState() => _TutorialsScreenState();
}

class _TutorialsScreenState extends State<TutorialsScreen> {
  List<SubscriptionModel> topTravelList = getTopTravelList();
  List<SubscriptionModel> recommendList = getRecommendList();

  var _controller;
  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;
  @override
  void initState() {
    super.initState();
    init();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Health & Wellness')),
            // ListTile(
            //   title: const Text('Tutorials'),
            //   onTap: () {
            //     // Update the state of the app
            //     // ...
            //     // Then close the drawer
            //     Navigator.pop(context);
            //   },
            // ),
            // ListTile(
            //   title: const Text('Experts'),
            //   onTap: () {
            //     // Update the state of the app
            //     // ...
            //     // Then close the drawer
            //     Navigator.pop(context);
            //   },
            // ),

            ListTile(
              title: const Text('Experts'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TutorsScreen();
                }));
              },
            ),

            SizedBox(
              height: 10,
            ),

            ListTile(
              title: const Text('Tutorials'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TutorialsScreen();
                }));
              },
            ),

            SizedBox(
              height: 10,
            ),
            ListTile(
              title: const Text('Alerts'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Alerts();
                }));
              },
            ),

            SizedBox(
              height: 10,
            ),

            
            ListTile(
            title: const Text('FAQs'),
            onTap: () {
              // Update the state of the app
              // ...
                  // Then close the drawer
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Faq();
                  }));
                },
              ),

            SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                color: Colors.red[400],
                child: ListTile(
                  title: const Text('Logout'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.amber[100],
        // leading: Icon(
        //   Icons.menu,
        //   size: 20,
        //   color: Colors.black,
        // ).onTap(() {
        //   // finish(context);

        // }),
        elevation: 0.0,
        actions: [
          IconButton(
              icon: Icon(Icons.logout, color: Colors.red[400], size: 22),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Text('Tutorials',
                    style: boldTextStyle(size: 18, color: t14_colorBlue))
                .paddingOnly(left: 16, right: 16, bottom: 8),
            Text('Watch tutorials from our trained experts',
                    style: secondaryTextStyle(size: 14))
                .paddingOnly(left: 16),
            8.height,
            Container(
              height: 270,
              child: ListView.builder(
                  itemCount: topTravelList.length,
                  padding: EdgeInsets.only(right: 8, left: 8),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    SubscriptionModel data = topTravelList[index];
                    return Container(
                      margin: EdgeInsets.all(8),
                      child: Container(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                child: Image.asset(data.img,
                                    width: 210, height: 220, fit: BoxFit.cover),
                              ),
                              8.height,
                              Text(data.name,
                                  style: primaryTextStyle(
                                      size: 14, color: t14_colorBlue)),
                              Container(
                                width: 150,
                                child: RoundedButton(
                                  text: 'View',
                                  press: () {
                                    // _launchURL(data.url);
                                    playVideo(data.url
                                        .substring(data.url.length - 11));
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              height: 270,
              child: ListView.builder(
                  itemCount: topTravelList.length,
                  padding: EdgeInsets.only(right: 8, left: 8),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    SubscriptionModel data = topTravelList[index];
                    return Container(
                      margin: EdgeInsets.all(8),
                      child: Container(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                child: Image.asset(data.img,
                                    width: 210, height: 220, fit: BoxFit.cover),
                              ),
                              8.height,
                              Text(data.name,
                                  style: primaryTextStyle(
                                      size: 14, color: t14_colorBlue)),
                              Container(
                                width: 150,
                                child: RoundedButton(
                                  text: 'View',
                                  press: () {
                                    playVideo(data.url
                                        .substring(data.url.length - 11));
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

 

  void listener(_controller) {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  playVideo(id) {

     YoutubePlayerController controller = YoutubePlayerController(
        initialVideoId: id,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      );
    setState(() {
      _controller = controller;
    });
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              YoutubePlayer(
                onReady: () {
                  _controller.addListener(listener);
                },
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.amber,
                progressColors: ProgressBarColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
              ),
            ],
          );
        });
  }
}
