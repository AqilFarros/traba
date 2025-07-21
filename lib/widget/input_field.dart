part of 'widget.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      showCursor: false,
      style: regular.copyWith(color: whiteColor),
      textInputAction: TextInputAction.next,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: regular.copyWith(color: grayColor),
        label: Text(hintText, style: regular),
        fillColor: whiteColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultMargin / 2),
          borderSide: BorderSide(color: whiteColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultMargin / 2),
          borderSide: BorderSide(color: mainColor),
        ),
      ),
    );
  }
}
