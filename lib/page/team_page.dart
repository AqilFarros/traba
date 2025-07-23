part of 'page.dart';

class TeamPage extends ConsumerWidget {
  const TeamPage({super.key, required this.team});

  final Team team;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Player>> players = ref.watch(playerProvider(team.id));

    return GeneralPage(
      widget: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(width: defaultMargin / 2),
                Text(team.name, style: bold.copyWith(fontSize: heading1)),
              ],
            ),
            SizedBox(height: defaultMargin),
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(team.venue.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(defaultMargin),
              ),
            ),
            SizedBox(height: defaultMargin),
            Text(team.venue.name, style: bold.copyWith(fontSize: heading2)),
            Text(
              "${team.venue.address}, ${team.venue.city}",
              style: medium.copyWith(fontSize: heading3),
            ),
            SizedBox(height: defaultMargin),
            Text("Player", style: bold.copyWith(fontSize: heading2)),
            players.when(
              data: (apiData) {
                return SizedBox(
                  height: 143,
                  child: ListView.builder(
                    itemCount: apiData.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: defaultMargin / 2),
                        child: PhotoProfile(
                          image: apiData[index].image,
                          name: apiData[index].name,
                        ),
                      );
                    },
                  ),
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
