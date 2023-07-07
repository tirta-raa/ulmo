part of '../widgets.dart';

// ignore: must_be_immutable
class GoogleButton extends StatelessWidget {
  Function()? onTap;
  GoogleButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 71.h,
        margin: EdgeInsets.symmetric(horizontal: 32.w),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(46),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 20,
              offset: const Offset(0, 10), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/g.png',
              width: 30.w,
            ),
            12.widthBox,
            Text(
              'Continue with Google',
              style: regularDisplay.copyWith(fontSize: 18.w),
            ),
          ],
        ),
      ),
    );
  }
}
