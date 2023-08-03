part of '../pages.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int _selectedIndex = 0;

  String _getSelectedGenderText() {
    switch (_selectedIndex) {
      case 0:
        return 'All';
      case 1:
        return "Men's";
      case 2:
        return "Women's";
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
          child: ListView(
        children: [
          34.heightBox,
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 32).w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.r),
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
                    child: Icon(
                      Icons.arrow_back,
                      color: Theme.of(context).primaryColor,
                      size: 24.w,
                    ),
                  ),
                ),
                Text(
                  'Category',
                  style: boldDisplay.copyWith(
                    fontSize: 20.w,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(10.r),
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
                    child: Image.asset(
                      'assets/notif.png',
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          54.heightBox,
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 32).w,
            child: GenderCard(
              selectedIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
          32.heightBox,
          Padding(
            padding: EdgeInsets.only(left: 32.w),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Shoes Available for \n',
                    style: regularDisplay.copyWith(
                      fontSize: 36.w,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  TextSpan(
                    text: _getSelectedGenderText(),
                    style: boldDisplay.copyWith(
                      fontSize: 36.w,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          25.heightBox,
          Column(
            children: productProvider.products
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: CategoryCard(e),
                  ),
                )
                .toList(),
          ),
        ],
      )),
    );
  }
}
