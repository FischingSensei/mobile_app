import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {

  final List<Function> ButtonArray = [
    (index) {
      print("Pressed button $index");
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.06,
          width: MediaQuery.sizeOf(context).width * 0.6,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.green,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
              )
          ),
          child: Row(
            children: [
              Padding(padding: EdgeInsets.only(
                left: MediaQuery.sizeOf(context).width * 0.07,
              )),

              for (int i = 0; i < 3; i++) ...[
                IconButton(
                  iconSize: 30,
                  onPressed: () {
                    ButtonArray[0](i);
                  },
                  style: IconButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))
                  ),
                  icon: const Icon(
                      color: Colors.white,
                      Icons.home
                  )
                ),
                if (i < 2) ...[
                  VerticalDivider(
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
      )
    );
  }
}
