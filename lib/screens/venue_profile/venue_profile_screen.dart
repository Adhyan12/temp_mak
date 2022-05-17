import 'package:cached_network_image/cached_network_image.dart';
import 'package:project_mak/services/user_provider.dart';
import 'package:project_mak/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../venue_profile//widgets/text_styles.dart';
import '../venue_profile/widgets/custom_divider.dart';
import '../venue_profile/widgets/field_row.dart';

class VenueProfileScreen extends StatelessWidget {
  const VenueProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        title: Text(
          'Outlet Details',
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(width: 0.5, color: Colors.grey),
              right: BorderSide(width: 0.5, color: Colors.grey),
            ),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    imageUrl:
                        'https://media-cdn.tripadvisor.com/media/photo-s/1a/b8/46/6d/london-stock.jpg',
                    imageBuilder: (context, imageProvider) => Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(40.0),
                            bottomLeft: Radius.circular(40.0)),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    fit: BoxFit.contain,
                  ),
                  Container(
                    height: 60,
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.37,
                      left: MediaQuery.of(context).size.width * 0.25,
                      right: MediaQuery.of(context).size.width * 0.25,
                    ),
                    child: Provider.of<UserProvider>(context, listen: true)
                                .source ==
                            'guest'
                        ? ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(primaryColor),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                            child: Container(
                              padding:
                                  const EdgeInsets.only(top: 12, bottom: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Icon(
                                    FontAwesomeIcons.locationArrow,
                                    size: 20,
                                  ),
                                  Text(
                                    'Get Direction',
                                    style: TextStyle(fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Container(),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomRow(
                      Rowkey: 'Business hours',
                      value: '8:00-18:00',
                    ),
                    const CustomDivider(),
                    CustomRow(Rowkey: 'Category', value: 'Outlet'),
                    const CustomDivider(),
                    Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Address',
                            style: kTextStyle,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 20),
                                child: const Icon(
                                  FontAwesomeIcons.locationDot,
                                  size: 18,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                '402, Baegu Building, \n116,Blah Bl Blah',
                                softWrap: true,
                                maxLines: 10,
                                style: kTextStyle,
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const CustomDivider(),
                    CustomRow(Rowkey: 'Phone Number', value: '1234567890'),
                    const CustomDivider(),
                    CustomRow(Rowkey: 'Rent/Return', value: '1/2'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
