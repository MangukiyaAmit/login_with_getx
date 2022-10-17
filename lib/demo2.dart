import 'package:flutter/material.dart';

class Demo2 extends StatefulWidget {
  const Demo2({Key? key}) : super(key: key);

  @override
  State<Demo2> createState() => _Demo2State();
}

class _Demo2State extends State<Demo2> {
  List<bool> panelState = List.generate(30, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              print(index);
              setState(() {
                panelState[index] = !panelState[index];
              });
              ;
            },
            children: List.generate(
              30,
              (index) => ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text('Item ${index + 1}'),
                  );
                },
                body: ListTile(
                  title: Text('Item ${index + 1} child'),
                  subtitle: Text('Details goes here'),
                ),
                isExpanded: panelState[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
