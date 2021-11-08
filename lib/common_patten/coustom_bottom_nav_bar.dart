import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

enum MenuState { home, favourite, message, profile }

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(FeatherIcons.home),
                onPressed: () => Navigator.pushNamed(context, '/homePage'),
              ),
              IconButton(
                icon: const Icon(FeatherIcons.bell),
                onPressed: () =>
                    Navigator.pushNamed(context, "/notificationService"),
              ),
              IconButton(
                icon: const Icon(FeatherIcons.calendar),
                onPressed: () => {
                  Navigator.pushNamed(context, '/schedulePage'),
                },
              ),
              IconButton(
                icon: const Icon(FeatherIcons.user),
                onPressed: () => Navigator.pushNamed(context, '/profile'),
              ),
            ],
          )),
    );
  }
}
