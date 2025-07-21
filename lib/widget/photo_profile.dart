part of 'widget.dart';

class PhotoProfile extends StatelessWidget {
  const PhotoProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(defaultMargin / 2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: mainColor, width: 2),
          ),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg",
            ),
            radius: 50,
            backgroundColor: whiteColor,
          ),
        ),
        SizedBox(height: defaultMargin / 2),
        Text("Andrew", style: regular.copyWith(fontSize: description)),
      ],
    );
  }
}
