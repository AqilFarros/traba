part of 'page.dart';

class GeneralPage extends StatelessWidget {
  const GeneralPage({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(defaultMargin),
          child: widget,
        ),
      ),
    );
  }
}
