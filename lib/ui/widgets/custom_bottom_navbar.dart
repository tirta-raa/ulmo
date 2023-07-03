part of 'widgets.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  RiveAsset selectedBottomNav = bottomNavs.first;
  Color selectedColor = Colors.transparent;

  List<String> routeNames = [
    '/home', // Add your route names here
    '/detail',
    '/history',
    '/chat',
    '/profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      decoration: BoxDecoration(
        color: const Color(0xFF152354),
        borderRadius: BorderRadius.circular(60),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(
            bottomNavs.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.pushNamed(
                      context, routeNames[index]); // change the page
                  for (var i = 0; i < bottomNavs.length; i++) {
                    bottomNavs[i].isSelected = (i == index);
                    if (i == index) {
                      bottomNavs[i].color = const Color(0xFF152354);
                      if (bottomNavs[i].input != null) {
                        bottomNavs[i].input!.change(true);
                        Future.delayed(const Duration(seconds: 1), () {
                          bottomNavs[i].input!.change(false);
                        });
                      }
                    } else {
                      bottomNavs[i].color = Colors.white;
                    }
                  }
                  selectedBottomNav = bottomNavs[index];
                });
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (bottomNavs[index].isSelected)
                    Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  SizedBox(
                    height: 34.h,
                    width: 34.w,
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          bottomNavs[index].color, BlendMode.srcATop),
                      child: RiveAnimation.asset(
                        bottomNavs[index].src,
                        artboard: bottomNavs[index].artboard,
                        onInit: (artboard) {
                          StateMachineController controller =
                              RiveUtils.getRiveController(artboard,
                                  stateMachineName:
                                      bottomNavs[index].stateMachineName);

                          bottomNavs[index].input =
                              controller.findSMI("active") as SMIBool;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;
  Color color;
  bool isSelected;

  RiveAsset(
    this.src, {
    required this.artboard,
    required this.stateMachineName,
    required this.title,
    this.color = Colors.white,
    this.input,
    this.isSelected = false,
  });

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset("assets/rive/icon-set.riv",
      artboard: "HOME", stateMachineName: "HOME_interactivity", title: "Home"),
  RiveAsset("assets/rive/icon-set.riv",
      artboard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity",
      title: "Search"),
  RiveAsset("assets/rive/icon-set.riv",
      artboard: "TIMER",
      stateMachineName: "TIMER_Interactivity",
      title: "Chat"),
  RiveAsset("assets/rive/icon-set.riv",
      artboard: "CHAT", stateMachineName: "CHAT_Interactivity", title: "Chat"),
  RiveAsset("assets/rive/icon-set.riv",
      artboard: "USER",
      stateMachineName: "USER_Interactivity",
      title: "Profile"),
];
