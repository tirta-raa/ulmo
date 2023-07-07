// ignore_for_file: no_leading_underscores_for_local_identifiers

part of '../pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  void handleCategoryTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    const Sidebar _sidebar = Sidebar();

    Widget _appBar() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 32.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(10).r,
              width: 56.w,
              height: 56.h,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0XFFF6F6F6),
                  width: 2,
                ),
              ),
              child: InkWell(
                onTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                child: Image.asset(
                  'assets/drawer-icon.png',
                  color: Theme.of(context).primaryColor,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ),
            Text(
              'Home',
              style: boldDisplay.copyWith(
                fontSize: 20.w,
                color: Theme.of(context).primaryColor,
              ),
            ),
            ToggleTheme()
          ],
        ),
      );
    }

    Widget _header() {
      return Container(
        margin: EdgeInsets.only(left: 24.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Enjoy New Like \n',
                    style: regularDisplay.copyWith(
                      fontSize: 36.w,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  TextSpan(
                    text: 'Product',
                    style: boldDisplay.copyWith(
                      fontSize: 36.w,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25.w, 18.h, 15.w, 18.h),
              width: 74.w,
              height: 74.h,
              decoration: BoxDecoration(
                color: const Color(0xFFFF5545),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFF5545).withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 50,
                    offset: const Offset(10, 10),
                  )
                ],
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(30).r,
                  bottomLeft: const Radius.circular(30).r,
                ),
              ),
              child: FilterButton(
                onTap: () {},
              ),
            ),
          ],
        ),
      );
    }

    Widget _tabbar() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 24).w,
              child: CustomTabBar(
                category: mockCategory.first,
                selectedIndex: selectedIndex,
                onTap: handleCategoryTap,
                firstCategoryIndex: 0, // Index of the first category
              ),
            ),
            ...mockCategory
                .sublist(1)
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: CustomTabBar(
                      category: e,
                      selectedIndex: selectedIndex,
                      onTap: handleCategoryTap,
                      firstCategoryIndex: 0, // Index of the first category
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      key: _scaffoldKey,
      drawer: Drawer(
        child: _sidebar,
      ),
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            34.heightBox,
            _appBar(),
            54.heightBox,
            _header(),
            40.heightBox,
            _tabbar(),
            32.heightBox,
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ((mockProduct.length + 1) ~/ 2),
              itemBuilder: (context, index) {
                int startIndex = index * 2;
                int endIndex = startIndex + 1;

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 32.h),
                          child: CustomBigCard(
                            product: mockProduct[startIndex],
                          ),
                        ),
                      ),
                      if (endIndex < mockProduct.length) SizedBox(width: 22.w),
                      if (endIndex < mockProduct.length)
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 32.w),
                            child: CustomBigCard(
                              product: mockProduct[endIndex],
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
