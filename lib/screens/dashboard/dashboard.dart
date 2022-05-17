import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_mak/screens/dashboard/widgets/dashboard_icon_card.dart';
import 'package:project_mak/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../router/routes.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    final adUrlList = [
      "https://images.pexels.com/photos/67468/pexels-photo-67468.jpeg?cs=srgb&dl=pexels-life-of-pix-67468.jpg&fm=jpg",
      "https://images.pexels.com/photos/1058277/pexels-photo-1058277.jpeg?cs=srgb&dl=pexels-marcus-herzberg-1058277.jpg&fm=jpg",
      "https://images.pexels.com/photos/704982/pexels-photo-704982.jpeg?cs=srgb&dl=pexels-daria-shevtsova-704982.jpg&fm=jpg",
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'CoverMe',
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 8),
                items: [0, 1, 2].map((i) {
                  return CachedNetworkImage(
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    imageUrl: adUrlList[i],
                    imageBuilder: (context, imageProvider) => Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    fit: BoxFit.contain,
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Welcome to Coverme',
                style: GoogleFonts.nunitoSans(
                    fontSize: 16, fontWeight: FontWeight.w700),
              ),
              Text(
                'Lörem ipsum lyskapet polyheten antesesade och fovis geoving, skynka. Rirat anangar i täledes även om fysat i berad. Ojypp semilingar olig. Neling sara. Dedat dekadade. Antement niligt megatregisk och hypodade, potektigt plar ngar i täledes även om fysat i ber ledes ä. ',
                style: GoogleFonts.nunitoSans(
                    fontSize: 12, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.feedPage);
                    },
                    child: const DashboardIconCard(
                      icon: Icons.feed,
                      text: 'Feed',
                      color: primaryColor,
                    ),
                  ),
                  const DashboardIconCard(
                      icon: Icons.fastfood_rounded,
                      text: 'Restaurants',
                      color: Colors.green),
                  const DashboardIconCard(
                      icon: Icons.supervised_user_circle,
                      text: 'Clubs',
                      color: Colors.redAccent),
                ],
              ),
              const SizedBox(height: 20),
              const DashboardIconCard(
                  icon: Icons.wine_bar_outlined,
                  text: 'Bars',
                  color: Colors.yellow),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(FontAwesomeIcons.facebook, size: 35),
                  SizedBox(width: 25),
                  Icon(FontAwesomeIcons.instagram, size: 35),
                  SizedBox(width: 25),
                  Icon(FontAwesomeIcons.twitter, size: 35)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
