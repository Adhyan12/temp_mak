import 'package:flutter/material.dart';

class DashboardIconCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  const DashboardIconCard(
      {Key? key, required this.icon, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3.5,
      child: Card(
        elevation: 1,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Icon(
                icon,
                size: 30,
                color: color,
              ),
              const SizedBox(height: 10),
              Text(
                text,
              )
            ],
          ),
        ),
      ),
    );
  }
}
