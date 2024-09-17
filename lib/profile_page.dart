import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:krishi_setu/profile_widget.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture Section
            Center(
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Constants.primaryColor.withOpacity(.5),
                    width: 5.0,
                  ),
                ),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: ExactAssetImage('asset/images/farmer.jpg'),
                ),
              ),
            ),
            const SizedBox(height: 7),

            // Profile Name and Verified Badge
            Center(
              child: SizedBox(
                width: size.width * 0.8,  // Adjust width to avoid overflow
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ramesh Gosh',
                      style: TextStyle(
                        color: Constants.blackColor,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      height: 24,
                      child: Image.asset("asset/images/verified.png"),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'abcd1234@gmail.com',
              style: TextStyle(
                color: Constants.blackColor.withOpacity(.3),
              ),
            ),
            const SizedBox(height: 30),

            // Profile Widgets Section
            SizedBox(
              width: size.width,
              child: Column(
                children: const [
                  ProfileWidget(icon: Icons.person, title: 'My Profile'),
                  ProfileWidget(icon: Icons.settings, title: 'Settings'),
                  ProfileWidget(icon: Icons.notifications, title: 'Notifications'),
                  ProfileWidget(icon: Icons.chat, title: 'FAQs'),
                  ProfileWidget(icon: Icons.share, title: 'Share'),
                  ProfileWidget(icon: Icons.logout, title: 'Log Out'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
