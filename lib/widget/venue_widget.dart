part of 'widget.dart';

class VenueWidget extends StatelessWidget {
  const VenueWidget({super.key, required this.image, required this.title, this.onTap});

  final String image;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(defaultMargin),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.all(defaultMargin / 2),
            color: secondBlackColor.withAlpha(200),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: regular.copyWith(fontSize: heading3),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(
                  Icons.arrow_outward_rounded,
                  color: whiteColor,
                  size: heading2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
