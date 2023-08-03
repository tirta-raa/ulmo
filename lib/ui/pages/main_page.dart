part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  final List<Widget> _widgetOptions = const [
    HomePage(),
    WishListPage(),
    CategoryPage(),
    SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // make color backround transparant
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF152354),
              borderRadius: BorderRadius.circular(30),
            ),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                  iconColor: Colors.white,
                ),
                GButton(
                  icon: LineIcons.heart,
                  text: 'Likes',
                  iconColor: Colors.white,
                ),
                GButton(
                  icon: LineIcons.search,
                  text: 'Search',
                  iconColor: Colors.white,
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                  iconColor: Colors.white,
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
