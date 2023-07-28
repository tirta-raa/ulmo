// ignore_for_file: no_leading_underscores_for_local_identifiers

part of '../pages.dart';

class DetailPage extends StatefulWidget {
  final ProductModel? product;
  DetailPage(this.product);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    final controller = PageController(viewportFraction: 0.8, keepPage: true);

    Widget _appBar() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
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
                ),
              ),
            ),
            Text(
              'Detail',
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

    Widget _productImage() {
      final image = widget.product?.galleries
          ?.map((e) => Image.network(
                e.url ?? '',
                width: MediaQuery.of(context).size.width,
                height: 300,
                fit: BoxFit.cover,
              ))
          .toList();

      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 240,
              child: PageView.builder(
                controller: controller,
                // itemCount: image.length,
                itemBuilder: (_, index) {
                  return image?[index % image.length];
                },
              ),
            ),
            50.heightBox,
            SmoothPageIndicator(
              controller: controller,
              count: image!.length,
              effect: WormEffect(
                dotColor: Theme.of(context).primaryColor,
                activeDotColor: blueColor,
                dotHeight: 16,
                dotWidth: 16,
              ),
            ),
          ],
        ),
      );

      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.only(left: 56, right: 36).w,
      //       child: Center(
      //         child: widget.product?.galleries?.isNotEmpty == true
      //             ? Image.network(
      //                 widget.product?.galleries![0].url ?? '',
      //                 width: 333,
      //                 height: 193,
      //                 fit: BoxFit.cover,
      //               )
      //             : const SizedBox(),
      //       ),
      //     ),
      //   ],
      // );
    }

    Widget _productName() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.product?.name ?? '',
            style: regularDisplay.copyWith(
              fontSize: 40.w,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Text(
            '\n${widget.product?.category?.name}',
            style: boldDisplay.copyWith(
              fontSize: 40.w,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      );
    }

    Widget _materialStructure() {
      return Container(
        margin: EdgeInsets.only(left: 32.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Structure',
              style: semiBoldDisplay.copyWith(
                fontSize: 22.w,
                color: Theme.of(context).primaryColor,
              ),
            ),
            32.heightBox,
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Outer Material: ',
                    style: regularDisplay.copyWith(
                      fontSize: 16.w,
                      color: const Color(0xFF8C94A0),
                    ),
                  ),
                  TextSpan(
                    text: 'Rubber 100%',
                    style: regularDisplay.copyWith(
                      fontSize: 16.w,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            20.heightBox,
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Lining: ',
                    style: regularDisplay.copyWith(
                      fontSize: 16.w,
                      color: const Color(0xFF8C94A0),
                    ),
                  ),
                  TextSpan(
                    text: 'Rubber 100%',
                    style: regularDisplay.copyWith(
                      fontSize: 16.w,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            20.heightBox,
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Sole: ',
                    style: regularDisplay.copyWith(
                      fontSize: 16.w,
                      color: const Color(0xFF8C94A0),
                    ),
                  ),
                  TextSpan(
                    text: 'Rubber 100%',
                    style: regularDisplay.copyWith(
                      fontSize: 16.w,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            24.heightBox,
            TextButton(
              onPressed: () {},
              child: Text(
                '...   Detail',
                style: regularDisplay.copyWith(
                  fontSize: 20.w,
                  color: blueColor,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget _purchasingButton() {
      return GestureDetector(
        onTap: () {
          cartProvider.addCart(widget.product!);

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                title: Text(
                  'Product has been add to you cart',
                  style: regularDisplay.copyWith(
                    fontSize: 22,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                actions: [
                  CupertinoDialogAction(
                    child: Text(
                      'See my Cart',
                      style: semiBoldDisplay.copyWith(
                        fontSize: 16,
                        color: blueColor,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Container(
          margin:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05),
          width: 100.w,
          height: 200.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: blueColor,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/bag-icon.png',
                  width: 30.w,
                  height: 30.h,
                ),
                30.heightBox,
                Text(
                  '\$ ${widget.product!.price}',
                  style: semiBoldDisplay.copyWith(
                    fontSize: 16.w,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            34.heightBox,
            _appBar(),
            20.heightBox,
            _productImage(),
            80.heightBox,
            Padding(
              padding: EdgeInsets.only(left: 34.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _productName(),
                  ),
                  LikeButton(
                    onTap: () {
                      wishlistProvider.setProduct(widget.product!);
                    },
                  ),
                ],
              ),
            ),
            32.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _materialStructure(),
                62.heightBox,
                _purchasingButton(),
              ],
            ),
            50.heightBox,
          ],
        ),
      ),
    );
  }
}
