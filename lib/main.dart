import 'package:cartgeek_test/network/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

import 'network/model/home_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.alegreyaSans().fontFamily,
        textTheme: GoogleFonts.alegreyaSansTextTheme(),
        primaryTextTheme: GoogleFonts.alegreyaSansTextTheme(),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final ZoomDrawerController zoomDrawerController = ZoomDrawerController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      angle: 0,
      showShadow: false,
      boxShadow: [
        BoxShadow(
          blurRadius: 15,
          color: Colors.black.withOpacity(0.12),
        ),
      ],
      mainScreenScale: 0.2,
      slideWidth: MediaQuery.of(context).size.shortestSide / 1.6,
      menuScreenWidth: MediaQuery.of(context).size.shortestSide / 1.55,
      menuBackgroundColor: Colors.white,
      controller: zoomDrawerController,
      openCurve: Curves.linear,
      closeCurve: Curves.linear,
      menuScreen: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox.square(dimension: 60),
            const CircleAvatar(
              backgroundColor: Color(0xFFE36DA6),
              radius: 36,
              child: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage('https://organicthemes.com/demo/profile/files/2018/05/profile-pic.jpg'),
              ),
            ),
            const SizedBox.square(dimension: 10),
            const Text(
              "Emily Cyrus",
              style: TextStyle(
                color: Color(0xffe36da6),
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox.square(dimension: 36),
            ListView.separated(
              shrinkWrap: true,
              itemCount: 7,
              itemBuilder: (context, index) => DefaultTextStyle(
                style: const TextStyle(
                  color: Color(0xff262f71),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                child: MaterialButton(
                  onPressed: () {
                    zoomDrawerController.close?.call();
                  },
                  minWidth: 0,
                  height: 0,
                  elevation: 0,
                  hoverElevation: 0,
                  focusElevation: 0,
                  highlightElevation: 0,
                  disabledElevation: 0,
                  padding: const EdgeInsets.only(left: 36, right: 36, top: 10, bottom: 14),
                  color: Colors.transparent,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      ['Home', 'Book A Nanny', 'How It Works', 'Why Nanny Vanny', 'My Bookings', 'My Profile', 'Support'][index],
                      style: const TextStyle(
                        color: Color(0xff262f71),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const Divider(
                height: 0,
                thickness: 0.2,
                color: Color(0xffe36da6),
                indent: 36,
                endIndent: 36,
              ),
            ),
          ],
        ),
      ),
      mainScreen: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (i) => setState(() => _currentIndex = i),
          selectedIconTheme: const IconThemeData(color: Color(0xffe36da6), size: 24),
          unselectedIconTheme: const IconThemeData(color: Color(0xFF707070), size: 24),
          selectedItemColor: const Color(0xffe36da6),
          selectedLabelStyle: const TextStyle(fontSize: 0),
          unselectedLabelStyle: const TextStyle(fontSize: 0),
          items: [
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  SvgPicture.asset('assets/home.svg', color: const Color(0xff5c5c5c), fit: BoxFit.contain),
                  const SizedBox.square(dimension: 2),
                  const Text(
                    'Home',
                    style: TextStyle(color: Color(0xff5c5c5c), fontSize: 10, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              activeIcon: Column(
                children: [
                  SvgPicture.asset('assets/home.svg', color: const Color(0xffe36da6), fit: BoxFit.contain),
                  const Text(
                    'Home',
                    style: TextStyle(color: Color(0xffe36da6), fontSize: 10, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox.square(dimension: 1),
                  const CircleAvatar(radius: 3, backgroundColor: Color(0xffe36da6))
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  SvgPicture.asset('assets/packages.svg', color: const Color(0xff5c5c5c), fit: BoxFit.contain),
                  const SizedBox.square(dimension: 2),
                  const Text(
                    'Packages',
                    style: TextStyle(color: Color(0xff5c5c5c), fontSize: 10, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              activeIcon: Column(
                children: [
                  SvgPicture.asset('assets/packages.svg', color: const Color(0xffe36da6), fit: BoxFit.contain),
                  const Text(
                    'Packages',
                    style: TextStyle(color: Color(0xffe36da6), fontSize: 10, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox.square(dimension: 1),
                  const CircleAvatar(radius: 3, backgroundColor: Color(0xffe36da6))
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  SvgPicture.asset('assets/bookings.svg', color: const Color(0xff5c5c5c), fit: BoxFit.contain),
                  const SizedBox.square(dimension: 2),
                  const Text(
                    'Bookings',
                    style: TextStyle(color: Color(0xff5c5c5c), fontSize: 10, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              activeIcon: Column(
                children: [
                  SvgPicture.asset('assets/bookings.svg', color: const Color(0xffe36da6), fit: BoxFit.contain),
                  const Text(
                    'Bookings',
                    style: TextStyle(color: Color(0xffe36da6), fontSize: 10, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox.square(dimension: 1),
                  const CircleAvatar(radius: 3, backgroundColor: Color(0xffe36da6))
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  SvgPicture.asset('assets/profile.svg', color: const Color(0xff5c5c5c), fit: BoxFit.contain),
                  const SizedBox.square(dimension: 2),
                  const Text(
                    'Profile',
                    style: TextStyle(color: Color(0xff5c5c5c), fontSize: 10, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              activeIcon: Column(
                children: [
                  SvgPicture.asset('assets/profile.svg', color: const Color(0xffe36da6), fit: BoxFit.contain),
                  const Text(
                    'Profile',
                    style: TextStyle(color: Color(0xffe36da6), fontSize: 10, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox.square(dimension: 1),
                  const CircleAvatar(radius: 3, backgroundColor: Color(0xffe36da6))
                ],
              ),
              label: '',
            ),
          ],
        ),
        body: [
          MyHomePage(callback: togglePanel),
          buildEmptyTab(svg: 'assets/packages.svg', title: 'Packages'),
          buildEmptyTab(svg: 'assets/bookings.svg', title: 'Bookings'),
          buildEmptyTab(svg: 'assets/profile.svg', title: 'Profile'),
        ][_currentIndex],
      ),
    );
  }

  Column buildEmptyTab({required String title, required String svg}) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox.square(dimension: 100, child: SvgPicture.asset(svg)),
          SizedBox.square(dimension: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ],
      );

  void togglePanel() => zoomDrawerController.toggle?.call();
}

class MyHomePage extends StatefulWidget {
  final VoidCallback callback;

  const MyHomePage({Key? key, required this.callback}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox.square(dimension: 12),
              Row(
                children: [
                  const Spacer(),
                  CupertinoButton(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    minSize: 0,
                    child: SvgPicture.asset('assets/menu.svg'),
                    onPressed: () {
                      widget.callback.call();
                    },
                  ),
                ],
              ),
              const ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 36),
                  leading: CircleAvatar(
                    backgroundColor: Color(0xFFE36DA6),
                    radius: 27,
                    child: CircleAvatar(
                      radius: 26,
                      backgroundImage: NetworkImage('https://organicthemes.com/demo/profile/files/2018/05/profile-pic.jpg'),
                    ),
                  ),
                  title: Text(
                    "Welcome ",
                    style: TextStyle(
                      color: Color(0xff5c5c5c),
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  subtitle: Text(
                    "Emily Cyrus",
                    style: TextStyle(
                      color: Color(0xffe36da6),
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  )),
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  Container(
                    width: double.maxFinite,
                    height: 160,
                    margin: const EdgeInsets.symmetric(horizontal: 36),
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFFf5b5cf),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Nanny And\nBabysitting Services",
                          style: TextStyle(
                            color: Color(0xff262f71),
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox.square(dimension: 8),
                        MaterialButton(
                          onPressed: () {},
                          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
                          minWidth: 0,
                          height: 0,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                          color: const Color(0xFF262f71),
                          child: const Text(
                            'Book Now',
                            style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IgnorePointer(
                    ignoring: true,
                    child: Image.asset(
                      'assets/babysitting.png',
                      height: 220,
                      fit: BoxFit.fitHeight,
                    ),
                  )
                ],
              ),
              FutureBuilder<HomeResModel>(
                future: Repository.homeRepo(),
                builder: (context, snapshot) {
                  final currentBookings = snapshot.data?.currentBookings;

                  // For loader
                  // !snapshot.hasData
                  //   ? const Center(child: CircularProgressIndicator())
                  //   :
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "Your Current Booking",
                          style: TextStyle(
                            color: Color(0xff262f71),
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox.square(dimension: 16),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white, boxShadow: [
                            BoxShadow(color: Colors.black.withOpacity(0.07), blurRadius: 7),
                          ]),
                          child: Column(
                            children: [
                              const SizedBox.square(dimension: 15),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          currentBookings?.packageLabel ?? 'NA',
                                          style: const TextStyle(
                                            color: Color(0xffe36da6),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const Spacer(),
                                        MaterialButton(
                                          onPressed: () {},
                                          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                                          minWidth: 90,
                                          height: 0,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                                          color: const Color(0xFFe36da6),
                                          child: const Text(
                                            'Start',
                                            style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              const Text(
                                                "From",
                                                style: TextStyle(
                                                  color: Color(0xff5c5c5c),
                                                  fontSize: 12,
                                                ),
                                              ),
                                              const SizedBox.square(dimension: 8),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.calendar_month,
                                                    color: Color(0xFFE36DA6),
                                                    size: 16,
                                                  ),
                                                  const SizedBox.square(dimension: 6),
                                                  Text(
                                                    currentBookings?.fromDate ?? 'N/A',
                                                    style: const TextStyle(
                                                      color: Color(0xff5c5c5c),
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox.square(dimension: 6),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.access_time_outlined,
                                                    color: Color(0xFFE36DA6),
                                                    size: 16,
                                                  ),
                                                  const SizedBox.square(dimension: 6),
                                                  Text(
                                                    currentBookings?.fromTime ?? 'N/A',
                                                    style: const TextStyle(
                                                      color: Color(0xff5c5c5c),
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              const Text(
                                                "To",
                                                style: TextStyle(
                                                  color: Color(0xff5c5c5c),
                                                  fontSize: 12,
                                                ),
                                              ),
                                              const SizedBox.square(dimension: 8),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.calendar_month,
                                                    color: Color(0xFFE36DA6),
                                                    size: 16,
                                                  ),
                                                  const SizedBox.square(dimension: 6),
                                                  Text(
                                                    currentBookings?.toDate ?? 'N/A',
                                                    style: const TextStyle(
                                                      color: Color(0xff5c5c5c),
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox.square(dimension: 6),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.access_time_outlined,
                                                    color: Color(0xFFE36DA6),
                                                    size: 16,
                                                  ),
                                                  const SizedBox.square(dimension: 6),
                                                  Text(
                                                    currentBookings?.toTime ?? 'N/A',
                                                    style: const TextStyle(
                                                      color: Color(0xff5c5c5c),
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    MaterialButton(
                                      onPressed: () {},
                                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                                      minWidth: 0,
                                      height: 0,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                                      color: const Color(0xFF262f71),
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.star_rate_outlined,
                                            color: Colors.white,
                                            size: 12,
                                          ),
                                          SizedBox.square(dimension: 4),
                                          Text(
                                            'Rate Us',
                                            style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox.square(dimension: 12),
                                    MaterialButton(
                                      onPressed: () {},
                                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                                      minWidth: 0,
                                      height: 0,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                                      color: const Color(0xFF262f71),
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.pin_drop_outlined,
                                            color: Colors.white,
                                            size: 12,
                                          ),
                                          SizedBox.square(dimension: 4),
                                          Text(
                                            'Geolocation',
                                            style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox.square(dimension: 12),
                                    MaterialButton(
                                      onPressed: () {},
                                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                                      minWidth: 0,
                                      height: 0,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                                      color: const Color(0xFF262f71),
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.security,
                                            color: Colors.white,
                                            size: 12,
                                          ),
                                          SizedBox.square(dimension: 4),
                                          Text(
                                            'Surveillance',
                                            style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox.square(dimension: 16),
                        const Text(
                          "Your Current Booking",
                          style: TextStyle(
                            color: Color(0xff262f71),
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox.square(dimension: 16),
                        ListView.separated(
                          itemCount: snapshot.data?.packages?.length ?? 0,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) => const SizedBox.square(dimension: 15),
                          itemBuilder: (context, index) {
                            final packages = snapshot.data?.packages?[index];
                            return Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(index.isEven ? 0xfff0b3cd : 0xff80abdb),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox.square(
                                        dimension: 25,
                                        child: SvgPicture.asset(
                                          'assets/calender.svg',
                                          color: Color(index.isEven ? 0xffd84d90 : 0xffffffff),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      const Spacer(),
                                      MaterialButton(
                                        onPressed: () {},
                                        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                                        minWidth: 90,
                                        height: 0,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                                        color: Color(index.isEven ? 0xffe36da6 : 0xff0098d0),
                                        child: const Text(
                                          'Book Now',
                                          style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox.square(dimension: 16),
                                  Row(
                                    children: [
                                      Text(
                                        packages?.packageName ?? 'N/A',
                                        style: const TextStyle(
                                          color: Color(0xff262f71),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        '₹${packages?.price ?? 'N/A'}',
                                        style: const TextStyle(
                                          color: Color(0xff262f71),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox.square(dimension: 8),
                                  Text(
                                    packages?.description ?? 'N/A',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Color(0xff494949),
                                      fontSize: 10,
                                    ),
                                  ),
                                  const SizedBox.square(dimension: 8),
                                ],
                              ),
                            );
                          },
                        ),
                        const SizedBox.square(dimension: 15),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
