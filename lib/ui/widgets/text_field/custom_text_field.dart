// ignore_for_file: must_be_immutable

part of '../widgets.dart';

class CustomTextField extends StatelessWidget {
  String label;
  double width;
  double height;
  double radiusCircular;
  TextEditingController? controller;
  String text;
  bool obscureText;
  bool scrollView;

  CustomTextField({
    super.key,
    required this.label,
    this.width = double.infinity,
    this.controller,
    this.obscureText = false,
    this.height = 66,
    this.radiusCircular = 66,
    this.text = '',
    this.scrollView = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: regularDisplay.copyWith(
            fontSize: 20.w,
            color: const Color(0xFF8A91A9),
          ),
        ),
        22.heightBox,
        Container(
          width: double.infinity,
          height: height.w,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(radiusCircular),
          ),
          child: (scrollView == true)
              ? SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: height.w,
                    ),
                    child: TextFormField(
                      maxLines: null, // Allow multiline input
                      obscureText: obscureText,
                      controller: controller,
                      style: regularDisplay.copyWith(fontSize: 18.w),
                      decoration: InputDecoration(
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFFF4242),
                          ),
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                          left: 24.w,
                          top: 24.h,
                          bottom: 24.h,
                        ),
                        hintText: text,
                        hintStyle: lightDisplay.copyWith(
                          fontSize: 18.w,
                          color: const Color(0xFF8A91A9),
                        ),
                      ),
                    ),
                  ),
                )
              : TextFormField(
                  obscureText: obscureText,
                  controller: controller,
                  style: regularDisplay.copyWith(fontSize: 18.w),
                  decoration: InputDecoration(
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFFF4242),
                      ),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                      left: 24.w,
                      top: 24.h,
                      bottom: 24.h,
                    ),
                    hintText: text,
                    hintStyle: lightDisplay.copyWith(
                      fontSize: 18.w,
                      color: const Color(0xFF8A91A9),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
