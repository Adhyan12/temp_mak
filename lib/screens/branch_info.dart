import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class BranchInfo extends StatefulWidget {
  static const String id = 'BranchInfo';
  const BranchInfo({Key? key}) : super(key: key);

  @override
  State<BranchInfo> createState() => _BranchInfoState();
}

class _BranchInfoState extends State<BranchInfo> {

  String dropdownValue = 'select';
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        title: const Text(
          'Branch info',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 130.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    border: Border.all(color: Colors.grey),
                  //TODO: file image error
                  // image: FileImage(File(_imageFile!.path))
                ),
                child: InkWell(
                  onTap: (){
                    showModalBottomSheet(context: context, builder: ((builder)=>bottomSheet()),);
                  },
                  child:_imageFile==null? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Image.asset(
                        'images/placeholder_image.png',
                        height: 50,
                      ),
                      const Text(
                        'Add Image',
                        style:
                            TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ):Container(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Branch Name',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                ),
              ),
              BranchCustomTextField(
                hintText: 'Enter Branch Name',
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Image.asset(
                    'images/menu.png',
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Category',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                  ),
                  // MediaQuery.of(context).size.width*0.5
                  const SizedBox(width: 90),
                  Container(
                    width: 160,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color:  Colors.grey[200],
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(
                          style: BorderStyle.solid, width: 0.80),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: DropdownButton(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down_sharp,color: Colors.blue,),
                        items: <String>['select', 'Restaurant', 'Bar', 'Club']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        style:const  TextStyle(color: Colors.blue,fontSize: 18),
                        underline: DropdownButtonHideUnderline(child: Container()),
                        onChanged: (String?
                        newValue) {
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
                  FaIcon(
                    FontAwesomeIcons.phone,
                    color: Colors.blue,
                    size: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Store Number',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                ],
              ),
              BranchCustomTextField(
                hintText: 'Enter Store Number',
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: const [
                  FaIcon(
                    FontAwesomeIcons.locationDot,
                    color: Colors.blue,
                    size: 15,
                  ),
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
              BranchCustomTextField(
                hintText: 'Select Location',
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    // backgroundColor: Colors.deepPurple,
                    // TODO: Ask about adding color to the button
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: const BorderSide(color: Colors.deepPurpleAccent),
                      ),
                    ),
                    elevation: MaterialStateProperty.all(10.0)),
                child: const SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: Center(
                        child: Text(
                      'Update',
                      style: TextStyle(fontSize: 18),
                    ))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void takeePhoto(ImageSource source)async{
    final pickedFile = await _picker.pickImage(source: source);
    setState((){
      _imageFile = pickedFile;
    });
  }

  Widget bottomSheet(){
    return Container(
      // width: MediaQuery.of(context).size.width,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const Text('Add Image',style: TextStyle(fontSize: 20),),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(onPressed: (){
                takeePhoto(ImageSource.camera);
              }, icon:const  Icon(Icons.camera_alt), label: const Text('Camera'),),
              const SizedBox(width: 50,),
              TextButton.icon(onPressed: (){
                takeePhoto(ImageSource.gallery);
              }, icon: const Icon(Icons.image), label: const Text('Gallery'),),
            ],

          )
        ],
      ),
    );
  }
}

class BranchCustomTextField extends StatelessWidget {
  BranchCustomTextField({Key? key, required this.hintText}) : super(key: key);
  String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: Colors.grey, width: 0)),
        // enabledBorder: const OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.grey),
        // ),
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}




