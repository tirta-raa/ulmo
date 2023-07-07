part of '../widgets.dart';

// class CustomTabBar extends StatelessWidget {
//   final CategoryModel category;
//   final int selectedIndex;
//   final Function(int) onTap;

//   CustomTabBar({
//     Key? key,
//     required this.category,
//     required this.selectedIndex,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool isSelected = selectedIndex == mockCategory.indexOf(category);

//     return GestureDetector(
//       onTap: () {
//         onTap(mockCategory.indexOf(category));
//       },
//       child: Container(
//         width: isSelected ? 128 : 75,
//         height: 68,
//         decoration: BoxDecoration(
//           shape: isSelected ? BoxShape.rectangle : BoxShape.circle,
//           borderRadius: isSelected ? BorderRadius.circular(60) : null,
//           color: isSelected ? blueColor : Theme.of(context).cardColor,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               width: 40,
//               height: 40,
//               child: Image.asset(
//                 category.image,
//                 color:
//                     isSelected ? Colors.white : Theme.of(context).primaryColor,
//               ),
//             ),
//             isSelected ? const SizedBox(width: 6) : const SizedBox(),
//             isSelected
//                 ? Text(
//                     category.text,
//                     style: regularDisplay.copyWith(color: Colors.white),
//                   )
//                 : const SizedBox(),
//           ],
//         ),
//       ),
//     );
//   }
// }

class CustomTabBar extends StatelessWidget {
  final CategoryModel category;
  final int selectedIndex;
  final Function(int) onTap;
  final int firstCategoryIndex;

  CustomTabBar({
    Key? key,
    required this.category,
    required this.selectedIndex,
    required this.onTap,
    required this.firstCategoryIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedIndex == mockCategory.indexOf(category);
    bool isFirstCategory = mockCategory.indexOf(category) == firstCategoryIndex;
    bool isAllSelected = selectedIndex == -1;

    return Row(
      children: [
        if (isFirstCategory)
          GestureDetector(
            onTap: () {
              onTap(-1); // Trigger onTap with index -1 for "All"
            },
            child: Container(
              width: 75.w,
              height: 68.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isAllSelected ? blueColor : Theme.of(context).cardColor,
              ),
              child: Center(
                child: Text(
                  'All',
                  style: regularDisplay.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
        isFirstCategory ? SizedBox(width: 20.w) : const SizedBox(),
        GestureDetector(
          onTap: () {
            onTap(mockCategory.indexOf(category));
          },
          child: Container(
            width: isSelected ? 128.w : 75.w,
            height: 68.h,
            decoration: BoxDecoration(
              shape: isSelected ? BoxShape.rectangle : BoxShape.circle,
              borderRadius: isSelected ? BorderRadius.circular(60) : null,
              color: isSelected ? blueColor : Theme.of(context).cardColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 40.w,
                  height: 40.h,
                  child: Image.asset(
                    category.image,
                    color: isSelected
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                  ),
                ),
                isSelected ? SizedBox(width: 6.w) : const SizedBox(),
                isSelected
                    ? Text(
                        category.text,
                        style: regularDisplay.copyWith(color: Colors.white),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
