part of 'widget.dart';

class PhotoProfile extends StatelessWidget {
  const PhotoProfile({super.key, required this.image, required this.name});

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(defaultMargin / 2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: mainColor, width: 2),
            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(image, scale: 1),
              radius: 50,
              backgroundColor: whiteColor,
            ),
          ),
          SizedBox(height: defaultMargin / 2),
          Text(
            name,
            style: regular.copyWith(fontSize: description),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
