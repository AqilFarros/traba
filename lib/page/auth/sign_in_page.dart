part of '../page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
              "Sign in to continue!",
              style: medium.copyWith(fontSize: heading2),
            ),
            const SizedBox(height: defaultMargin * 2),
            InputField(
              controller: emailController,
              hintText: "Email",
              validator: validateEmail,
            ),
            const SizedBox(height: defaultMargin),
            InputField(
              controller: passwordController,
              hintText: "Password",
              validator: validatePassword,
              obscureText: true,
            ),
            const SizedBox(height: defaultMargin),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/sign-up');
                  },
                  child: Text(
                    "Haven't has an account",
                    style: bold.copyWith(
                      color: mainColor,
                      fontSize: description,
                    ),
                  ),
                ),
                const SizedBox(width: defaultMargin),
                PrimaryButton(
                  text: "Sign in",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
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
