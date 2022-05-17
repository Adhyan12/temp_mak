import 'package:project_mak/router/routes.dart';
import 'package:project_mak/screens/feed/widgets/feed_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Feed',
            style: GoogleFonts.notoSans(
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: "All",
              ),
              Tab(
                text: "Restaurants",
              ),
              Tab(
                text: "Bars",
              ),
              Tab(
                text: "Clubs",
              ),
            ],
          ),
        ),
        body: Column(
          children: const [
            Expanded(
              child: TabBarView(
                children: [
                  FeedView(),
                  FeedView(),
                  FeedView(),
                  FeedView(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FeedView extends StatelessWidget {
  const FeedView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
          children: const [
            FeedListTile(),
            SizedBox(height: 15),
          ],
        );
      },
    );
  }
}
