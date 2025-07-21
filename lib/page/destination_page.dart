part of 'page.dart';

class DestinationPage extends StatefulWidget {
  const DestinationPage({super.key, required this.destination});

  final String destination;

  @override
  State<DestinationPage> createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  ScrollController scrollController = ScrollController();
  late String destination;

  @override
  void initState() {
    destination = widget.destination;
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      widget: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                SizedBox(height: 120),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: defaultMargin,
                    mainAxisSpacing: defaultMargin,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 17,
                  itemBuilder: (context, index) {
                    return DestinationGrid(
                      image: destination == "beach"
                          ? "https://www.azwisata.com/wp-content/uploads/2018/12/Pantai-Nongsa.jpg"
                          : "https://cms.grandbatam.com/images/slider1.png",
                      title: destination == "beach" ? "Beach" : "Mall",
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 108,
            decoration: BoxDecoration(
              color: blackColor,
              boxShadow: [
                BoxShadow(
                  color: secondBlackColor.withOpacity(0.7),
                  offset: Offset(0, 6),
                  blurRadius: 1,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: whiteColor,
                        size: heading1,
                      ),
                    ),
                    Text(
                      "DESTINATION FOR ${destination.toUpperCase()}",
                      style: regular.copyWith(fontSize: heading2),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: secondBlackColor,
                    borderRadius: BorderRadius.circular(defaultMargin),
                  ),
                  child: DropdownButton(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    onChanged: (value) {
                      setState(() {
                        destination = value.toString();
                        scrollController.animateTo(
                          0.0,
                          duration: Duration(milliseconds: 0),
                          curve: Curves.easeInOut,
                        );
                      });
                    },
                    style: medium,
                    value: destination,
                    underline: Container(),
                    dropdownColor: secondBlackColor,
                    isExpanded: true,
                    items: [
                      DropdownMenuItem(
                        value: "beach",
                        child: Text("Beach", style: medium),
                      ),
                      DropdownMenuItem(
                        value: "mall",
                        child: Text("Mall", style: medium),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: defaultMargin),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
