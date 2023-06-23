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
    Widget _appBar() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0XFFF6F6F6),
                  width: 2,
                ),
              ),
              child: Image.asset(
                'assets/drawer-icon.png',
                color: Theme.of(context).primaryColor,
              ),
            ),
            Text(
              'Home',
              style: boldDisplay.copyWith(
                fontSize: 20,
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
        margin: const EdgeInsets.only(left: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Enjoy New Like \n',
                    style: regularDisplay.copyWith(
                      fontSize: 36,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  TextSpan(
                    text: 'Product',
                    style: boldDisplay.copyWith(
                      fontSize: 36,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Image.asset(
                'assets/filtter.png',
                width: 74,
                height: 72,
                fit: BoxFit.cover,
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
              padding: EdgeInsets.only(right: 20, left: 32),
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
                    padding: EdgeInsets.only(right: 20),
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
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            const SizedBox(
              height: 34,
            ),
            _appBar(),
            const SizedBox(
              height: 54,
            ),
            _header(),
            const SizedBox(
              height: 40,
            ),
            _tabbar(),
            const SizedBox(
              height: 32,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ((mockProduct.length + 1) ~/ 2),
              itemBuilder: (context, index) {
                int startIndex = index * 2;
                int endIndex = startIndex + 1;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 32),
                          child: CustomBigCard(
                            product: mockProduct[startIndex],
                          ),
                        ),
                      ),
                      if (endIndex < mockProduct.length)
                        const SizedBox(width: 22),
                      if (endIndex < mockProduct.length)
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 32),
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
