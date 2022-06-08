import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../network/model/home_model.dart';
import '../network/repository/repository.dart';

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
