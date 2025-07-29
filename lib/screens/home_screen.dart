import 'package:flutter/material.dart';
import 'package:islami/screens/hadeeth.dart';
import 'package:islami/screens/quran.dart';
import 'package:islami/screens/radio.dart';
import 'package:islami/screens/sebha.dart';
import 'package:islami/screens/time.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/widgets/nav_bar_selected_item.dart';
import 'package:islami/widgets/nav_bar_unselected_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTab = 0;

  List<String> backgroundTabs = [
    AppAssets.quranBackground,
    AppAssets.hadeethBackground,
    AppAssets.sebhaBackground,
    AppAssets.radioBackground,
    AppAssets.timeBackground
  ];

  List<Widget> tabs = [
    const QuranTab(),
    const HadeethTab(),
    const SebhaTab(),
    const RadioTab(),
    const TimeTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (index) {
          if (currentTab == index) return;
          currentTab = index;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
              icon: NavBarUnselectedItem(
                imageName: AppAssets.quranIcon,
              ),
              activeIcon: NavBarSelectedItem(imageName: AppAssets.quranIcon),
              label: 'Quran'),
          BottomNavigationBarItem(
              icon: NavBarUnselectedItem(
                imageName: AppAssets.hadeethIcon,
              ),
              activeIcon: NavBarSelectedItem(imageName: AppAssets.hadeethIcon),
              label: 'Hadeeth'),
          BottomNavigationBarItem(
              icon: NavBarUnselectedItem(
                imageName: AppAssets.sebhaIcon,
              ),
              activeIcon: NavBarSelectedItem(imageName: AppAssets.sebhaIcon),
              label: 'Sebha'),
          BottomNavigationBarItem(
              icon: NavBarUnselectedItem(
                imageName: AppAssets.radioIcon,
              ),
              activeIcon: NavBarSelectedItem(imageName: AppAssets.radioIcon),
              label: 'Radio'),
          BottomNavigationBarItem(
              icon: NavBarUnselectedItem(
                imageName: AppAssets.timeIcon,
              ),
              activeIcon: NavBarSelectedItem(imageName: AppAssets.timeIcon),
              label: 'Time'),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(backgroundTabs[currentTab])),
        ),
        child: Column(
          children: [
            Image.asset(
              AppAssets.header,
              height: MediaQuery.sizeOf(context).height * .15,
              fit: BoxFit.fitWidth,
            ),
            Expanded(child: tabs[currentTab])
          ],
        ),
      ),
    );
  }
}
