import 'package:flutter/material.dart';

import '../../venue_profile/widgets/text_styles.dart';

class CustomRow extends StatelessWidget {
  CustomRow({
    required this.Rowkey,
    required this.value,
    Key? key,
  }) : super(key: key);

  String Rowkey, value;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(Rowkey, style: kTextStyle),
          Text(
            value,
            style: kValueTextStyle,
          )
        ],
      ),
    );
  }
}
