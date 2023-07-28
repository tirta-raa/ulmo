part of '../pages.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

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
                  'Change Password',
                  style: boldDisplay.copyWith(
                    fontSize: 20.w,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
          70.heightBox,
          Padding(
            padding: EdgeInsets.only(left: 32.w),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Change Your Recent  \n',
                    style: regularDisplay.copyWith(
                      fontSize: 36.w,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  TextSpan(
                    text: 'Password',
                    style: boldDisplay.copyWith(
                      fontSize: 36.w,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          32.heightBox,
          Container(
            margin: EdgeInsetsDirectional.symmetric(horizontal: 32.w),
            child: Column(
              children: [
                CustomTextField(
                  label: 'Recent Password',
                ),
                30.heightBox,
                CustomTextField(
                  label: 'Enter New Password',
                ),
              ],
            ),
          ),
          200.heightBox,
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomButton(
              onPressed: () {},
              text: 'Save Changes',
            ),
          ),
        ],
      )),
    );
  }
}
