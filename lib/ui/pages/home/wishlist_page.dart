part of '../pages.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            24.heightBox,
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32).w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                  80.widthBox,
                  Text(
                    'WISHLIST',
                    style: boldDisplay.copyWith(
                      fontSize: 20.w,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            70.heightBox,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Favorite',
                    style: semiBoldDisplay.copyWith(
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  32.heightBox,
                  Column(
                    children: wishlistProvider.wishlist
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: WishListCard(e),
                            ))
                        .toList(),
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
