part of 'widget.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed as Function()?,
      style: ElevatedButton.styleFrom(
        backgroundColor: mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultMargin),
        ),
        padding: EdgeInsets.all(defaultMargin),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      child: Text(text, style: bold),
    );
  }
}
