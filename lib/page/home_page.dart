part of 'page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      widget: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: extraBold.copyWith(
                      fontSize: heading1,
                      color: mainColor,
                    ),
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
                Container(
                  padding: EdgeInsets.all(defaultMargin),
                  decoration: BoxDecoration(
                    color: secondBlackColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.person, size: heading1, color: whiteColor),
                ),
              ],
            ),
            SizedBox(height: defaultMargin * 2),
            Text("STAY IN TOUCH", style: light.copyWith(fontSize: heading2)),
            SizedBox(height: defaultMargin),
            SizedBox(
              height: 143,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: defaultMargin / 2),
                    child: PhotoProfile(),
                  );
                },
              ),
            ),
            SizedBox(height: defaultMargin * 2),
            Text("SEASON OFFERS", style: light.copyWith(fontSize: heading2)),
            SizedBox(height: defaultMargin),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: defaultMargin,
              children: [
                DestinationGrid(
                  onTap: () {
                    Navigator.pushNamed(context, '/destination', arguments: "beach");
                  },
                  image:
                      "https://www.azwisata.com/wp-content/uploads/2018/12/Pantai-Nongsa.jpg",
                  title: "BEACH",
                ),
                DestinationGrid(
                  onTap: () {
                    Navigator.pushNamed(context, '/destination', arguments: "mall");
                  },
                  image: "https://cms.grandbatam.com/images/slider1.png",
                  title: "MALL",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
