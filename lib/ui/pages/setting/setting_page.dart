part of '../pages.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

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
                80.widthBox,
                Text(
                  'SETTINGS',
                  style: boldDisplay.copyWith(
                    fontSize: 20.w,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
          41.heightBox,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomListTile(
                  text: 'General Settings',
                  onTap: () {},
                ),
                9.heightBox,
                CustomListTile(
                  text: 'Account Settings',
                  onTap: () {},
                ),
                9.heightBox,
                CustomListTile(
                  text: 'Change Password',
                  onTap: () {},
                ),
                9.heightBox,
                CustomListTile(
                  text: 'Notification',
                  onTap: () {},
                ),
                9.heightBox,
                CustomListTile(
                  text: 'About Us',
                  onTap: () {},
                ),
                9.heightBox,
                CustomListTile(
                  text: 'Privacy &  Policy',
                  onTap: () {},
                ),
                22.heightBox,
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: Text(
                            'Are your sure you wanna Delete this Account?',
                            style: regularDisplay.copyWith(
                              fontSize: 22,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          actions: [
                            CupertinoDialogAction(
                              child: Text(
                                'Delete',
                                style: semiBoldDisplay.copyWith(
                                  fontSize: 16,
                                  color: const Color(0xFFFF5757),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            CupertinoDialogAction(
                              child: Text(
                                'Cancel',
                                style: regularDisplay.copyWith(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    'Delete Account',
                    style: regularDisplay.copyWith(
                      fontSize: 18,
                      color: const Color(0xFFFF6464),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
