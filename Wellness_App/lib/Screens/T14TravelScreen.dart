import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:flutter_auth/utils/dash/T14Colors.dart';
import 'package:flutter_auth/utils/dash/T14DataGenerator.dart';
import 'package:flutter_auth/utils/dash/T14Model.dart';
import 'package:flutter_auth/utils/dash/T14Strings.dart';
import 'package:url_launcher/url_launcher.dart';

class T14TravelScreen extends StatefulWidget {
  @override
  _T14TravelScreenState createState() => _T14TravelScreenState();
}

class _T14TravelScreenState extends State<T14TravelScreen> {
  List<SubscriptionModel> topTravelList = getTopTravelList();
  List<SubscriptionModel> recommendList = getRecommendList();

  @override
  void initState() {
    super.initState();
    init();
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
              title: const Text('Logout'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
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
                                borderRadius: BorderRadius.all(Radius.circular(15)),
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
                                    _launchURL(data.url);
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
            
            Text('Experts',
                    style: boldTextStyle(size: 16, color: t14_colorBlue))
                .paddingOnly(left: 16),
                 Container(
              height: 200,
              child: ListView.builder(
                  itemCount: recommendList.length,
                  padding: EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    SubscriptionModel data = recommendList[index];
                    return Container(
                      margin: EdgeInsets.all(8),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: Image.asset(data.img,
                                width: 150, height: 200, fit: BoxFit.cover),
                          ),
                          8.height,
                          //  Container(
                          //       width: 150,
                          //       child: RoundedButton(
                          //         text: 'View',
                                  
                          //         press: () {
                          //           _launchURL(data.url);
                          //         },
                          //       ),
                          //     ),
                          Positioned(
                            top: 8,
                            left: 30,
                            child: Text(data.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: primaryTextStyle(size: 14)),
                          ),

                           Positioned(
                            top: 126,
                            left: 0,
                            child: Container(
                                width: 150,
                                child: ElevatedButton(
                                  child: Text('Contact'),
                                  
                                  onPressed: () {
                                    _launchURL(data.url);
                                  },
                                ),
                              )
                          ),
                          
                         
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                  itemCount: recommendList.length,
                  padding: EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    SubscriptionModel data = recommendList[index];
                    return Container(
                      margin: EdgeInsets.all(8),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: Image.asset(data.img,
                                width: 150, height: 200, fit: BoxFit.cover),
                          ),
                          8.height,
                          //  Container(
                          //       width: 150,
                          //       child: RoundedButton(
                          //         text: 'View',
                                  
                          //         press: () {
                          //           _launchURL(data.url);
                          //         },
                          //       ),
                          //     ),
                          Positioned(
                            top: 8,
                            left: 30,
                            child: Text(data.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: primaryTextStyle(size: 14)),
                          ),

                           Positioned(
                            top: 126,
                            left: 0,
                            child: Container(
                                width: 150,
                                child: ElevatedButton(
                                  child: Text('Contact'),
                                  
                                  onPressed: () {
                                    _launchURL(data.url);
                                  },
                                ),
                              )
                          ),
                          
                         
                        ],
                      ),
                    );
                  }),
            ),
            // Text(t14_txt_plan,
            //         style: boldTextStyle(size: 16, color: t14_colorBlue))
            //     .paddingOnly(left: 16),
            // Container(
            //   height: 200,
            //   padding: EdgeInsets.all(0),
            //   child: ListView.builder(
            //       itemCount: recommendList.length,
            //       padding: EdgeInsets.all(8),
            //       scrollDirection: Axis.horizontal,
            //       shrinkWrap: true,
            //       itemBuilder: (BuildContext context, int index) {
            //         SubscriptionModel data = recommendList[index];
            //         return Container(
            //           margin: EdgeInsets.all(8),
            //           child: Stack(
            //             children: [
            //               ClipRRect(
            //                 borderRadius: BorderRadius.all(Radius.circular(15)),
            //                 child: Image.asset(data.img,
            //                     width: 150, height: 200, fit: BoxFit.cover),
            //               ),
            //               8.height,
            //               Positioned(
            //                 top: 8,
            //                 left: 50,
            //                 child: Text(data.name,
            //                     maxLines: 1,
            //                     overflow: TextOverflow.ellipsis,
            //                     style: primaryTextStyle(size: 14)),
            //               ),
            //             ],
            //           ),
            //         );
            //       }),
            // ),
            // Text(t14_txt_Travel,
            //         style: boldTextStyle(size: 16, color: t14_colorBlue))
            //     .paddingOnly(left: 16),
            // Container(
            //   height: 200,
            //   padding: EdgeInsets.all(0),
            //   child: ListView.builder(
            //       itemCount: recommendList.length,
            //       padding: EdgeInsets.all(8),
            //       scrollDirection: Axis.horizontal,
            //       shrinkWrap: true,
            //       itemBuilder: (BuildContext context, int index) {
            //         SubscriptionModel data = recommendList[index];
            //         return Container(
            //           margin: EdgeInsets.all(8),
            //           child: Stack(
            //             children: [
            //               ClipRRect(
            //                 borderRadius: BorderRadius.all(Radius.circular(15)),
            //                 child: Image.asset(data.img,
            //                     width: 150, height: 200, fit: BoxFit.cover),
            //               ),
            //               8.height,
            //               Positioned(
            //                 top: 8,
            //                 left: 50,
            //                 child: Text(data.name,
            //                     maxLines: 1,
            //                     overflow: TextOverflow.ellipsis,
            //                     style: primaryTextStyle(size: 14)),
            //               ),
            //             ],
            //           ),
            //         );
            //       }),
            // ),
          ],
        ),
      ),
    );
  }
}
