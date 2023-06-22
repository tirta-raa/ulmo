// ignore_for_file: must_be_immutable

part of 'widgets.dart';

class CustomTextField extends StatelessWidget {
  String label;
  double width;
  TextEditingController? controller;
  String text;
  bool obscureText;

  CustomTextField({
    super.key,
    required this.label,
    this.width = double.infinity,
    this.controller,
    this.obscureText = false,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: regularDisplay.copyWith(
            fontSize: 20,
            color: const Color(0xFF8A91A9),
          ),
        ),
        const SizedBox(
          height: 22,
        ),
        Container(
          width: double.infinity,
          height: 66,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(109),
          ),
          child: TextFormField(
            obscureText: obscureText,
            controller: controller,
            style: regularDisplay.copyWith(fontSize: 18),
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
              contentPadding: const EdgeInsets.all(24),
              hintText: text,
              hintStyle: lightDisplay.copyWith(
                fontSize: 18,
                color: const Color(0xFF8A91A9),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
