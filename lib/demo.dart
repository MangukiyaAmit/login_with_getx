import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  int _index = 0;

  List<Map<String, dynamic>> result = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
          data:
              ThemeData(colorScheme: ColorScheme.light(primary: Colors.green)),
          child: Stepper(
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Row(
                children: [
                  TextButton(
                      onPressed: () {
                        if (_index >= 0 && _index <= 3) {
                          result.add({"steps": _index + 1, "answer": "agree"});
                          setState(() {
                            _index += 1;
                          });
                        }
                      },
                      child: Text("Agree")),
                  TextButton(
                      onPressed: () {
                        if (_index >= 0 && _index <= 3) {
                          result.add(
                              {"steps": _index + 1, "answer": "Not Agree"});
                          setState(() {
                            _index += 1;
                          });
                        }
                      },
                      child: Text("Not Agree")),
                ],
              );
            },
            currentStep: _index,
            onStepTapped: (index) {},
            steps: <Step>[
              Step(
                isActive: _index == 0,
                title: const Text('Step 1 title'),
                content: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text('Content for Step 1')),
              ),
              Step(
                isActive: _index == 1,
                title: const Text('Step 2 title'),
                content: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text('Content for Step 1')),
              ),
              Step(
                isActive: _index == 2,
                title: const Text('Step 3 title'),
                content: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text('Content for Step 1')),
              ),
              Step(
                state: StepState.complete,
                isActive: _index == 3,
                title: const Text('Step 4 title'),
                content: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text('Content for Step 1')),
              ),
              Step(
                isActive: _index == 4,
                title: const Text('Step 5 title'),
                content: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text('Content for Step 1')),
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(onPressed: () {
        print(result);
      }),
    );
  }
}
