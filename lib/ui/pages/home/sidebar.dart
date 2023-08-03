part of '../pages.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Check for login status changes and trigger a rebuild
    Provider.of<AuthProvider>(context, listen: false).loadUserIdAndTokenId();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel? user = authProvider.user;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 32.w),
          color: Theme.of(context).scaffoldBackgroundColor,
          width: 358.w,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              32.heightBox,
              SizedBox(
                child: Row(
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
                    96.widthBox,
                    Text(
                      'Home',
                      style: boldDisplay.copyWith(
                        fontSize: 20.w,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              40.heightBox,
              SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 72.w,
                      height: 72.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            '${user?.profilePhotoUrl}',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    18.widthBox,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${user?.name}',
                            style: boldDisplay.copyWith(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          10.heightBox,
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/profile');
                            },
                            child: Text(
                              'Edit Profile',
                              style: regularDisplay.copyWith(
                                color: const Color(0xFF8A91A9),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              55.heightBox,
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextButton(
                      onTap: () {
                        Navigator.pushNamed(context, '/category');
                      },
                      text: 'All Categories',
                    ),
                    34.heightBox,
                    CustomTextButton(
                      onTap: () {
                        Navigator.pushNamed(context, '/track-location');
                      },
                      text: 'Track Order',
                    ),
                    34.heightBox,
                    CustomTextButton(
                      text: 'Location',
                      onTap: () {},
                    ),
                    34.heightBox,
                    CustomTextButton(
                      onTap: () {
                        Navigator.pushNamed(context, '/wishlist');
                      },
                      text: 'Whishlist',
                    ),
                    34.heightBox,
                    CustomTextButton(
                      onTap: () {},
                      text: 'Orders',
                    ),
                    34.heightBox,
                    CustomTextButton(
                      onTap: () {},
                      text: 'Settings',
                    ),
                    76.heightBox,
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                        authProvider.logout();
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/share.png',
                            width: 20.w,
                            height: 20.h,
                          ),
                          10.widthBox,
                          Text(
                            'Sign Out',
                            style: semiBoldDisplay.copyWith(fontSize: 18),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
