import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_mak/constants.dart';

class OutletDetails extends StatelessWidget {
  const OutletDetails({Key? key}) : super(key: key);
  static const String id = 'OutletDetails';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.arrow_back_ios, color: Colors.white,),
        title: const Text('Outlet Details', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Stack(
          children: [
            Container(
              padding:const EdgeInsets.only(left: 40,right: 30),
              decoration: const BoxDecoration(
                border:Border(
                  left: BorderSide(width: 0.5,color: Colors.grey),
                  right: BorderSide(width: 0.5,color: Colors.grey),
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 350,),
                  CustomRow(Rowkey: 'Business hours',value: '8:00-18:00',),
                  const CustomDivider(),
                  CustomRow(Rowkey: 'Category', value: 'Outlet'),
                  const CustomDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                    const Text('Address',style: kTextStyle,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:const [
                        FaIcon(FontAwesomeIcons.locationDot,size: 18,color: Colors.blue,),
                        SizedBox(width: 8,),
                        Text('402, Baegu Building, 116,\n Blah Blah Blah',style: kTextStyle,)
                      ],
                    )

                  ],),
                  const CustomDivider(),
                  CustomRow(Rowkey: 'Phone Number', value: '1234567890'),
                  const CustomDivider(),
                  CustomRow(Rowkey: 'Rent/Return', value: '1/2'),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.5,
              // width: double.infinity,
              decoration:const  BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(60.0),bottomLeft: Radius.circular(60.0)),
                image: DecorationImage(image: AssetImage('images/hotel_pic.webp',),
                fit: BoxFit.fill
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 40,
                width: 200,
                child: ElevatedButton(
                  onPressed: (){},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                          )
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:const  [
                      FaIcon(FontAwesomeIcons.share,size: 20,),
                      Text('Get Direction',style: TextStyle(fontSize: 18),)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 0.3,
      color: Colors.grey,
    );
  }
}

class CustomRow extends StatelessWidget {
   CustomRow({
     required this.Rowkey,
     required this.value,
    Key? key,
  }) : super(key: key);

  String Rowkey, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:[
         Text(Rowkey, style: kTextStyle),
        Text(value,style: kValueTextStyle,)
      ],
    );
  }
}
