import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'home_page.dart';

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
          const SizedBox.square(dimension: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ],
      );

  void togglePanel() => zoomDrawerController.toggle?.call();
}
