// ignore_for_file: no_leading_underscores_for_local_identifiers

part of '../pages.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    //
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
              child: Icon(
                Icons.arrow_back,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Text(
              'Detail',
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

    Widget _product() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 56, right: 36),
            child: Center(
              child: Image.asset(
                'assets/shoes2.png',
                width: 333,
                height: 193,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Air Max 270 \n',
                    style: regularDisplay.copyWith(
                      fontSize: 40,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  TextSpan(
                    text: 'Sneakers',
                    style: boldDisplay.copyWith(
                      fontSize: 40,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget _materialStructure() {
      return Container(
        margin: const EdgeInsets.only(left: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Structure',
              style: semiBoldDisplay.copyWith(
                fontSize: 22,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Outer Material: ',
                    style: regularDisplay.copyWith(
                      fontSize: 16,
                      color: const Color(0xFF8C94A0),
                    ),
                  ),
                  TextSpan(
                    text: 'Rubber 100%',
                    style: regularDisplay.copyWith(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Lining: ',
                    style: regularDisplay.copyWith(
                      fontSize: 16,
                      color: const Color(0xFF8C94A0),
                    ),
                  ),
                  TextSpan(
                    text: 'Rubber 100%',
                    style: regularDisplay.copyWith(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Sole: ',
                    style: regularDisplay.copyWith(
                      fontSize: 16,
                      color: const Color(0xFF8C94A0),
                    ),
                  ),
                  TextSpan(
                    text: 'Rubber 100%',
                    style: regularDisplay.copyWith(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                '...   Detail',
                style: regularDisplay.copyWith(
                  fontSize: 20,
                  color: blueColor,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget _purchasingButton() {
      return Container(
        margin:
            EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05),
        width: 99,
        height: 157,
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
                width: 30,
                height: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                '\$ 350',
                style: semiBoldDisplay.copyWith(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
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
            const SizedBox(
              height: 34,
            ),
            _appBar(),
            const SizedBox(
              height: 85,
            ),
            _product(),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _materialStructure(),
                _purchasingButton(),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            CustomBottomNavbar(),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
