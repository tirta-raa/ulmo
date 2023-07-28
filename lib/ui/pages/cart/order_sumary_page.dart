part of '../pages.dart';

class OrderSumaryPage extends StatefulWidget {
  const OrderSumaryPage({super.key});

  @override
  State<OrderSumaryPage> createState() => _OrderSumaryPageState();
}

class _OrderSumaryPageState extends State<OrderSumaryPage> {
  @override
  Widget build(BuildContext context) {
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
                50.widthBox,
                Text(
                  'ORDER SUMMARY',
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
                  'Recent Order',
                  style: boldDisplay.copyWith(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                26.heightBox,
                OrderCard(),
                26.heightBox,
                OrderCard(),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
