import 'package:fishing_sensei/theme.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {

  late Function(int n) onClick;

  BottomNavBar({ super.key, required this.onClick });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.06,
      child: Center(
        child: Container(
          width: MediaQuery
              .sizeOf(context)
              .width * 0.6,
          height: MediaQuery
              .sizeOf(context)
              .height * 0.06,
          decoration: BoxDecoration(
            gradient: backgroundGradient,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 3; i++) ...[
                IconButton(
                  iconSize: 30,
                  onPressed: () {
                    widget.onClick(i);
                  },
                  style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                ),
                if (i < 2)
                  const VerticalDivider(
                    color: Colors.white,
                    endIndent: 10,
                    indent: 10,
                    thickness: 1,
                  )
              ],
            ],
          ),
        ),
      ),
    );
  }
}
