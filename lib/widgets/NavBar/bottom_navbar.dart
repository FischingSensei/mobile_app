import 'package:fishing_sensei/home/screens/service/geolocator/map_service.dart';
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
  List<(bool, double)> selected = [(true, 20), (false, 0), (false, 0)];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.075,
        child: Center(
          child: Container(
              width: MediaQuery.sizeOf(context).width * 0.7,
              height: MediaQuery.sizeOf(context).height * 0.075,
              decoration: navbarDecoration,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 3; i++) ...[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          width: selected[i].$2,
                          child: SizedBox(
                            height: 0,
                            child: Divider(
                              color: Colors.white,
                              thickness: 2,
                            ),
                          ),
                        ),
                        NavBarButton(
                          onPressed: () {
                            setState(() {
                              selected = [(false, 0), (false, 0), (false, 0)];
                              selected[i] = (true, 20);
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
              )),
        ));
  }
}
