import 'package:flutter/material.dart';

// 展示一些列用户需要完成的步骤
class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {

  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepperDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Colors.black,
              ),
              child: Stepper(
                currentStep: _currentStep,
                onStepTapped: (int value) {
                  setState(() {
                    _currentStep = value;
                  });
                },

                onStepContinue: (){
                  setState(() {
                    if(_currentStep < 2) {
                      _currentStep += 1;
                    }else{
                      _currentStep = 0;
                    }
                  });
                },

                onStepCancel: () {
                  setState(() {
                    if(_currentStep > 0) {
                      _currentStep -= 1;
                    }else{
                      _currentStep = 0;
                    }
                  });
                },
                steps: [
                  Step(
                    title: Text('Login'),
                    subtitle: Text('Login first'),
                    content: Text('Duis do enim nulla aliquip minim voluptate incididunt culpa aute magna est.'),
                    isActive: _currentStep == 0,
                  ), 
                  Step(
                    title: Text('Login 1'),
                    subtitle: Text('Login 1'),
                    content: Text('Duis do enim nulla aliquip minim voluptate incididunt culpa aute magna est.'),
                    isActive: _currentStep == 1,
                  ), 
                  Step(
                    title: Text('Login 2'),
                    subtitle: Text('Login 2'),
                    content: Text('Duis do enim nulla aliquip minim voluptate incididunt culpa aute magna est.'),
                    isActive: _currentStep == 2,
                  ), 
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
