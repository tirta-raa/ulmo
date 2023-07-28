part of '../pages.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/box.png',
                width: 201.w,
                height: 258.h,
              ),
              36.heightBox,
              Text(
                'Congratulations!',
                style: boldDisplay.copyWith(
                  fontSize: 30,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              16.heightBox,
              Text(
                '  Order Done Successfully and Payment is \nsent for the product!',
                style: regularDisplay.copyWith(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              30.heightBox,
              CustomButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/order-sumary', (route) => false);
                },
                text: 'Order Other Shoes',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
