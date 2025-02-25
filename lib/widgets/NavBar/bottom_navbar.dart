import 'package:fishing_sensei/theme.dart';
import 'package:fishing_sensei/widgets/NavBar/navbar_button.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  late Function(int n) onClick;

  BottomNavBar({super.key, required this.onClick});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<bool> selected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.06,
      child: Center(
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.6,
          height: MediaQuery.sizeOf(context).height * 0.06,
          decoration: navbarDecoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 3; i++) ...[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Force the divider to have a specific width
                    if (selected[i]) ...[
                      SizedBox(
                        width: 20, // Adjust as needed
                        height: 5,
                        child: Divider(
                          color: Colors.white,
                          thickness: 2,
                          // Remove or adjust 'height' if you want space above the icon
                        ),
                      ),
                    ],
                    NavBarButton(
                      onPressed: () {
                        setState(() {
                          selected = [false, false, false];
                          selected[i] = true;
                          widget.onClick(i);
                        });
                      },
                      icon: const Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                if (i < 2) ...[
                  const VerticalDivider(
                    color: Colors.white,
                    endIndent: 10,
                    indent: 10,
                    thickness: 1,
                  )
                ]
              ],
            ],
          ),
        ),
      ),
    );
  }
}
