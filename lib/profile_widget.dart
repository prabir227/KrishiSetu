import 'package:flutter/material.dart';
import 'package:krishi_setu/constants.dart';

class ProfileWidget extends StatelessWidget {
  final IconData icon;
  final String title;

  const ProfileWidget({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // Get screen size for responsiveness

    return Container(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.02), // Responsive padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Constants.blackColor.withOpacity(.5),
                size: size.width * 0.06, // Responsive icon size
              ),
              SizedBox(
                width: size.width * 0.04, // Responsive spacing
              ),
              Text(
                title,
                style: TextStyle(
                  color: Constants.blackColor,
                  fontSize: size.width * 0.05, // Responsive font size
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Constants.blackColor.withOpacity(.4),
            size: size.width * 0.04, // Responsive arrow icon size
          ),
        ],
      ),
    );
  }
}