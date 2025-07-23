part of 'page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  String name = "";

  void _sharedPreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? '';
    });
  }

  @override
  void initState() {
    _sharedPreference();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<League>> league = ref.watch(leagueProvider);
    final AsyncValue<List<Team>> indonesiaTeams = ref.watch(
      indonesiaTeamsProvider,
    );

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
            Text("Hi, $name", style: regular.copyWith(fontSize: heading2)),
            SizedBox(height: defaultMargin),
            Text("STAY IN TOUCH", style: light.copyWith(fontSize: heading2)),
            SizedBox(height: defaultMargin),
            SizedBox(
              height: 143,
              child: league.when(
                data: (apiData) {
                  return ListView.builder(
                    itemCount: apiData.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: defaultMargin / 2),
                        child: PhotoProfile(
                          name: apiData[index].name,
                          image: apiData[index].logo,
                        ),
                      );
                    },
                  );
                },
                error: (err, _) =>
                    Center(child: Text(err.toString(), style: medium)),
                loading: () =>
                    Center(child: CircularProgressIndicator(color: mainColor)),
              ),
            ),
            SizedBox(height: defaultMargin * 2),
            Text(
              "INDONESIA FOOTBALL",
              style: light.copyWith(fontSize: heading2),
            ),
            SizedBox(height: defaultMargin),
            indonesiaTeams.when(
              data: (apiData) {
                // return Container();
                return GridView.builder(
                  itemCount: apiData.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: defaultMargin,
                    mainAxisSpacing: defaultMargin,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return VenueWidget(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/team',
                          arguments: apiData[index],
                        );
                      },
                      image: apiData[index].venue.image,
                      title: apiData[index].name,
                    );
                  },
                );
              },
              error: (err, _) =>
                  Center(child: Text(err.toString(), style: medium)),
              loading: () =>
                  Center(child: CircularProgressIndicator(color: mainColor)),
            ),
          ],
        ),
      ),
    );
  }
}
