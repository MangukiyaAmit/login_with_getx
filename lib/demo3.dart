import 'package:flutter/material.dart';

class Demo3 extends StatefulWidget {
  final List<BottomNavigationBarItem> bottomNavigationBarItem;
  final int selectedIndex;
  final void Function(int) onTap;
  final Color selectedItemColor;
  final Widget body;

  const Demo3(
      {super.key,
      required this.bottomNavigationBarItem,
      required this.selectedIndex,
      required this.onTap,
      required this.selectedItemColor,
      required this.body});

  @override
  State<Demo3> createState() => _Demo3State();
}

class _Demo3State extends State<Demo3> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height,
            child: RotatedBox(
              quarterTurns: 3,
              child: BottomNavigationBar(
                items: widget.bottomNavigationBarItem,
                currentIndex: widget.selectedIndex,
                selectedItemColor: widget.selectedItemColor,
                onTap: widget.onTap,
              ),
            )),
        Expanded(
          child: Center(
            child: widget.body,
          ),
        )
      ],
    );
  }
}
