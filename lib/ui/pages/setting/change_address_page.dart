part of '../pages.dart';

class ChangeAddressPage extends StatelessWidget {
  const ChangeAddressPage({super.key});

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
                  'ADDRESS',
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
          Padding(
            padding: EdgeInsets.only(left: 32.w),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Change your Current \n',
                    style: regularDisplay.copyWith(
                      fontSize: 36.w,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  TextSpan(
                    text: 'Address',
                    style: boldDisplay.copyWith(
                      fontSize: 36.w,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          34.heightBox,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              children: [
                CustomTextField(
                  label: 'Old Address',
                  text: 'Your Old Address',
                  radiusCircular: 24,
                  height: 98,
                ),
                28.heightBox,
                CustomTextField(
                  label: 'New Address',
                  text: 'Your New Address',
                  radiusCircular: 24,
                  height: 98,
                ),
              ],
            ),
          ),
          203.heightBox,
          CustomButton(
            text: 'Change Now',
            onPressed: () {},
          ),
          60.heightBox,
        ],
      )),
    );
  }
}
