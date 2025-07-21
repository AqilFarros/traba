part of '../page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
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
              "Sign up to continue!",
              style: medium.copyWith(fontSize: heading2),
            ),
            const SizedBox(height: defaultMargin * 2),
            Row(
              children: [
                Expanded(
                  child: InputField(
                    controller: firstNameController,
                    hintText: "First name",
                    validator: requiredField,
                  ),
                ),
                const SizedBox(width: defaultMargin),
                Expanded(
                  child: InputField(
                    controller: lastNameController,
                    hintText: "Last name",
                    validator: requiredField,
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultMargin),
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
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Already have an account?",
                    style: bold.copyWith(
                      color: mainColor,
                      fontSize: description,
                    ),
                  ),
                ),
                const SizedBox(width: defaultMargin),
                PrimaryButton(
                  text: "Sign up",
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
