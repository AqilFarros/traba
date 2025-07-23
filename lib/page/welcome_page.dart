part of 'page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void _checkName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name');

    if (name != null) {
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    }
  }

  @override
  void initState() {
    _checkName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      widget: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                style: extraBold.copyWith(fontSize: heading1, color: mainColor),
                children: [
                  TextSpan(text: '| '),
                  TextSpan(
                    text: 'TRABA',
                    style: extraBold.copyWith(color: whiteColor),
                  ),
                  TextSpan(text: ' |'),
                ],
              ),
            ),
            Text(
              "Input your name to continue!",
              style: medium.copyWith(fontSize: heading2),
            ),
            const SizedBox(height: defaultMargin * 2),
            InputField(
              controller: nameController,
              hintText: "Name",
              validator: requiredField,
            ),
            const SizedBox(height: defaultMargin),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PrimaryButton(
                  text: "Submit",
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setString('name', nameController.text);

                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/home',
                        (route) => false,
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
