import 'package:project_mak/router/routes.dart';
import 'package:project_mak/utility/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../auth/venue_login.dart';

class VenueRegistrationScreen extends StatefulWidget {
  const VenueRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<VenueRegistrationScreen> createState() =>
      _VenueRegistrationScreenState();
}

class _VenueRegistrationScreenState extends State<VenueRegistrationScreen> {
  String dropdownValue = 'Select';
  late File pickedImage;
  bool selected = false;
  Future pickImage(var imageSource) async {
    final ImagePicker picker = ImagePicker();
    var image, i;
    i = await picker.pickImage(source: imageSource);
    image = File(i.path);
    if (image == null) {
      return;
    }
    setState(() {
      selected = true;
      pickedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'Venue Registration',
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              DottedBorder(
                borderType: BorderType.RRect,
                dashPattern: const [2, 6],
                radius: const Radius.circular(40),
                child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: ((builder) => bottomSheet()),
                      );
                    },
                    child: !selected
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.image_outlined,
                                size: 35,
                                color: Colors.grey,
                              ),
                              Text(
                                'Add Image',
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          )
                        : Image.file(pickedImage, fit: BoxFit.contain),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 6),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Branch Name',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                ),
              ),
              CustomTextField(
                hintText: 'Enter Branch Name',
                hide: false,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.grid_view,
                          color: primaryColor, size: 18),
                      Container(
                        padding: const EdgeInsets.only(left: 12),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Category',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: textFieldColor,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: DropdownButton(
                        value: dropdownValue,
                        icon: const Icon(
                          Icons.arrow_drop_down_sharp,
                          color: Colors.blue,
                        ),
                        items: <String>['Select', 'Restaurant', 'Bar', 'Club']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(fontSize: 14),
                            ),
                          );
                        }).toList(),
                        style:
                            const TextStyle(color: primaryColor, fontSize: 18),
                        underline:
                            DropdownButtonHideUnderline(child: Container()),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: const [
                  Icon(Icons.phone, color: primaryColor, size: 18),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'Store Number',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: 'Enter Store Number',
                hide: false,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: const [
                  Icon(FontAwesomeIcons.locationDot,
                      color: primaryColor, size: 18),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Location',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                ],
              ),
              CustomTextField(hintText: 'Select Location', hide: false),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.dashboard,
                      arguments: 'venue');
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    elevation: MaterialStateProperty.all(0)),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: const Center(
                    child: Text(
                      'Update',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 150),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return SizedBox(
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                color: primaryColor,
                onPressed: () {
                  pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Open Camera',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                color: primaryColor,
                onPressed: () {
                  pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Pick From Gallery',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          MaterialButton(
            color: Colors.transparent,
            onPressed: () {
              Navigator.pop(context);
            },
            elevation: 0,
            child: const Text(
              'Cancel',
              style: TextStyle(
                  fontSize: 15,
                  color: primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
