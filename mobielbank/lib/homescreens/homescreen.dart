import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:mobielbank/homescreens/transactionhistorytab.dart';
import 'package:badges/badges.dart' as badges;
import 'dart:math';

import 'package:mobielbank/homescreens/viewall.dart';
import 'package:mobielbank/autoscale_tabbarview/src/autoscale_tabbar_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({final Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> accountHolderName = [
    "Add",
    "Madan Bhandari",
    "Phulmaya",
    "James",
    "Asma",
    "Jalan"
  ];
  List<String> accountHolderInitials = ["+", "MB", "PM", "JA", "AA", "JL"];
  List<String> recentPayments = [
    "eSewa",
    "Ncell Topup",
    "Worldlink",
    "Recharge"
  ];
  List<String> merchants = [
    "Big Marts",
    "Gokarna Forest",
    "Bakery Cake",
    "Miniso"
  ];
  List<String> features = ["Accounts", "Statement", "Topup", "Load Wallet"];
  List<IconData> featuresIcon = [
    Icons.account_circle,
    Icons.article,
    Icons.mobile_screen_share,
    Icons.wallet
  ];
  List<String> merchantsImage = [
    'assets/esewa.jpg',
    'assets/ncell.png',
    'assets/worldlink.png',
    'assets/dish-home.png'
  ];

  Color getRandomColor() {
    final random = Random();
    Color color;

    do {
      int r = random.nextInt(256);
      int g = random.nextInt(256);
      int b = random.nextInt(256);
      color = Color.fromARGB(255, r, g, b);
    } while (color == Colors.white);

    return color;
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        backgroundColor: const Color.fromARGB(77, 206, 204, 204),
        body: Container(
          constraints: const BoxConstraints.expand(),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              const toolbarContainer(),
              const searchWidget(),
              Positioned(
                top: 165,
                height: 585,
                width: 370,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      accountInfo(),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8.0, right: 10, top: 4),
                        child: SizedBox(
                          height: 90,
                          width: 370,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: features.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  height: 88,
                                  width: 88,
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                    surfaceTintColor: Colors.white,
                                    color: Colors.white,
                                    child: Center(
                                      child: Column(
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                featuresIcon[index],
                                                color: Colors.blueAccent,
                                              )),
                                          Text(
                                            features[index],
                                            style:
                                                const TextStyle(fontSize: 12),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Recent Transactions",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                const Text(
                                  "View All",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                    onPressed: () {
                                        PersistentNavBarNavigator.pushNewScreen(
                                        context,
                                        screen: const ExpansionPanelListExample(),
                                        withNavBar: false, 
                                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                    );
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16,
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                      DefaultTabController(
                        length: 3,
                        initialIndex: 0,
                        child: Column(
                          children: [
                            ButtonsTabBar(
                              borderColor: Colors.blue,
                              borderWidth: 2,
                              unselectedBorderColor: Colors.white,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.blue, width: 2)),
                              unselectedBackgroundColor: Colors.white,
                              labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              tabs: const [
                                Tab(
                                    child: SizedBox(
                                  width: 85,
                                  height: 80,
                                  child: Center(
                                    child: Text(
                                      "All",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                )),
                                Tab(
                                  icon: Icon(
                                    Icons.arrow_circle_up,
                                    color: Colors.green,
                                    size: 20,
                                  ),
                                  child: SizedBox(
                                    width: 85,
                                    height: 80,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 10.0),
                                      child: Text(
                                        "Income",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                                Tab(
                                  icon: Icon(
                                    Icons.arrow_circle_down,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                  child: SizedBox(
                                    width: 85,
                                    height: 80,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 10.0),
                                      child: Text(
                                        "Expenses",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const AutoScaleTabBarView(
                              children: [
                                TransactionHistoryTab(),
                                TransactionHistoryTab(),
                                TransactionHistoryTab(),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Send Money",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                const Text(
                                  "View All",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16,
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: SizedBox(
                          height: 95,
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            color: Colors.white,
                            surfaceTintColor: Colors.white,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 4.0, top: 12),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: accountHolderName.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      CircularProfileAvatar(
                                        '',
                                        radius: 25, // sets radius, default 50.0
                                        backgroundColor:
                                            getRandomColor(), // sets background color, default Colors.white
                                        borderWidth:
                                            1, // sets border, default 0.0
                                        borderColor: Colors
                                            .white, // sets border color, default Colors.white
                                        // elevation: 5.0, // sets elevation (shadow of the profile picture), default value is 0.0
                                        foregroundColor: Colors.brown.withOpacity(
                                            0.5), //sets foreground colour, it works if showInitialTextAbovePicture = true , default Colors.transparent
                                        cacheImage:
                                            true, // allow widget to cache image against provided url
                                        imageFit: BoxFit.cover,
                                        initialsText: Text(
                                          accountHolderInitials[index],
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        onTap: () {},
                                        showInitialTextAbovePicture: true,
                                      ),
                                      FittedBox(
                                          child: SizedBox(
                                              width: 70,
                                              child: Center(
                                                  child: Text(
                                                accountHolderName[index],
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 102, 100, 100),
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ))))
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Recent Payments",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                const Text(
                                  "View All",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16,
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                        child: SizedBox(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: recentPayments.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 100,
                                width: 90,
                                child: badges.Badge(
                                  badgeStyle: const badges.BadgeStyle(
                                    badgeColor: Colors.green,
                                    shape: badges.BadgeShape.square,
                                  ),
                                  position:
                                      badges.BadgePosition.topStart(start: 2),
                                  badgeContent: const SizedBox(
                                    height: 6,
                                    width: 50,
                                    child: Text(
                                      '2% Discound',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 6),
                                    ),
                                  ),
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                    surfaceTintColor: Colors.white,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Image.asset(
                                            merchantsImage[index],
                                            height: 50,
                                            width: 70,
                                          ),
                                        ),
                                        SizedBox(
                                            width: 100,
                                            child: Center(
                                                child: Text(
                                                    recentPayments[index],
                                                    style: const TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontSize: 12))))
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Mechants",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                const Text(
                                  "View All",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16,
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                        child: SizedBox(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: recentPayments.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 100,
                                width: 90,
                                child: badges.Badge(
                                  badgeStyle: const badges.BadgeStyle(
                                    badgeColor: Colors.green,
                                    shape: badges.BadgeShape.square,
                                  ),
                                  position:
                                      badges.BadgePosition.topStart(start: 2),
                                  badgeContent: const SizedBox(
                                    height: 6,
                                    width: 50,
                                    child: Text(
                                      '2% Discound',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 6),
                                    ),
                                  ),
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                    surfaceTintColor: Colors.white,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Image.asset(
                                            merchantsImage[index],
                                            height: 50,
                                            width: 70,
                                          ),
                                        ),
                                        SizedBox(
                                            width: 100,
                                            child: Center(
                                                child: Text(
                                                    recentPayments[index],
                                                    style: const TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontSize: 12))))
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Padding accountInfo() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 4),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        surfaceTintColor: Colors.white,
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: SizedBox(
                height: 55,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.savings,
                            color: Color.fromARGB(255, 131, 129, 129),
                          ),
                        ),
                        const Text(
                          "Saving Account",
                          style: TextStyle(
                              color: Color.fromARGB(255, 131, 129, 129),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Positioned(
                      top: 35,
                      left: 12,
                      child: Row(
                        children: [
                          Text(
                            "1204577823771238",
                            style: TextStyle(
                                color: Color.fromARGB(255, 131, 129, 129)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  const Text(
                    "NPR.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 83, 82, 82)),
                  ),
                  const Text(
                    "1,09,124.54",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove_red_eye_rounded,
                      size: 20,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class searchWidget extends StatelessWidget {
  const searchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 90,
      height: 75,
      width: 370,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
        child: Center(
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            surfaceTintColor: Colors.white,
            color: const Color.fromARGB(255, 255, 255, 255),
            shadowColor: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 280,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.mic),
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class toolbarContainer extends StatelessWidget {
  const toolbarContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 35,
      child: Container(
        width: 394,
        height: 90,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 18.0, right: 8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.sunny_snowing),
                    color: Colors.white,
                    iconSize: 30,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, right: 80),
                    child: Column(
                      children: [
                        Text(
                          "Good Morning,",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text("Hari Bahadur",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                overflow: TextOverflow.fade)),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: badges.Badge(
                        badgeStyle: badges.BadgeStyle(
                          borderRadius: BorderRadius.circular(2),
                          badgeColor: const Color.fromARGB(255, 240, 216, 3),
                        ),
                        position: badges.BadgePosition.custom(end: 1),
                        child: const Icon(Icons.redeem)),
                    color: Colors.white,
                    iconSize: 28,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: badges.Badge(
                        badgeStyle: badges.BadgeStyle(
                          borderRadius: BorderRadius.circular(2),
                          badgeColor: Colors.yellow,
                        ),
                        position: badges.BadgePosition.custom(end: 1, top: 1),
                        child: const Icon(Icons.notifications_none)),
                    color: Colors.white,
                    iconSize: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: CircularProfileAvatar(
                      'https://avatars0.githubusercontent.com/u/8264639?s=460&v=4',
                      radius: 18, // sets radius, default 50.0
                      backgroundColor: Colors
                          .transparent, // sets background color, default Colors.white
                      borderWidth: 1, // sets border, default 0.0
                      borderColor: Colors
                          .white, // sets border color, default Colors.white
                      elevation:
                          5.0, // sets elevation (shadow of the profile picture), default value is 0.0
                      foregroundColor: Colors.brown.withOpacity(
                          0.5), //sets foreground colour, it works if showInitialTextAbovePicture = true , default Colors.transparent
                      cacheImage:
                          true, // allow widget to cache image against provided url
                      imageFit: BoxFit.cover,
                      initialsText: const Text("HB"),
                      onTap: () {},
                      showInitialTextAbovePicture: false,
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
