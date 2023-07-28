part of '../pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel? user = authProvider.user;

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
                  90.widthBox,
                  Text(
                    'ADDRESS',
                    style: boldDisplay.copyWith(
                      fontSize: 20.w,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            47.heightBox,
            Column(
              children: [
                Container(
                  width: 128.w,
                  height: 128.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage('${user?.profilePhotoUrl}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                30.heightBox,
                Text(
                  '${user?.name}',
                  style: boldDisplay.copyWith(
                      fontSize: 24, color: Theme.of(context).primaryColor),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                10.heightBox,
                Text(
                  'Change Photo',
                  style: regularDisplay.copyWith(
                    color: const Color(0xFF8A91A9),
                  ),
                ),
              ],
            ),
            38.heightBox,
            Container(
              margin: EdgeInsetsDirectional.symmetric(horizontal: 32.w),
              child: Column(
                children: [
                  CustomTextField(
                    label: 'Name',
                    text: '${user?.name}',
                  ),
                  30.heightBox,
                  CustomTextField(
                    label: 'Email',
                    text: '${user?.email}',
                  ),
                  30.heightBox,
                  CustomTextField(
                    label: 'Phone Number',
                  ),
                ],
              ),
            ),
            37.heightBox,
            CustomButton(
              onPressed: () {},
              text: 'Save Changes',
            ),
            100.heightBox,
          ],
        ),
      ),
    );
  }
}
