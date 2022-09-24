import 'dart:math';

import 'package:flutter/material.dart';

class GuessNum extends StatefulWidget {
  const GuessNum({Key? key}) : super(key: key);

  @override
  State<GuessNum> createState() => _GuessNumState();
}

class _GuessNumState extends State<GuessNum> {
  var _input = '';
  var _message = 'ทายเลข 1 ถึง 100';
  var r = Random();
  int answer = 0;
  void _handleClickButton(int num) {
    //const password = '123';

    setState(() {
      if (num == -1) {
        _input = _input.substring(0, _input.length - 1);
      } else if(num == -2){
        _input = '';
      }
      else {
        _input = _input + num.toString();
      }
    });

  }

  Widget _buildNumberButton(int num) {
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // function expression ทำหน้าที่เป็น callback function
          _handleClickButton(num);
        },
        customBorder: Border(),
        child: Container(
          width: 70.0,
          height: 40.0,
          alignment: Alignment.center,

          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(
              color: Color(0xFFCCCCCC),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: num == -1
              ? Icon(Icons.backspace_outlined , color: Colors.purple):
              num == -2
              ? Icon(Icons.close , color: Colors.purple)
              : Text(
            num.toString(),
            style: TextStyle(
              color: Colors.purple,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),

        ),
      ),
    );
  }
  void ClickCheck() {
    if (_input.length <= 3) {
      answer = r.nextInt(100);
      var N = int.tryParse(_input);
      if(_input == answer){
        setState(() {
          _message = 'ถูกต้อง';
        });
      }
      // else if(N > answer){
      //   setState(() {
      //     _message = '$N : มากเกินไป';
      //   });
      // }
      // else if(N < answer){
      //   setState(() {
      //     _message = '$N : น้อยเกินไป';
      //   });
      // }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GUESSS THE NUMBER'),
      ),
      body: Center(
        child: Container(
          width: 400.0,
          height: 600.0,
          color: Colors.purpleAccent.withOpacity(0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/guess_logo.png', width: 80.0),
                  Text(' GUESS \n THE NUMBER'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(_input),
              ),
              SizedBox(height: 30.0),
              Text(_message),//ทายหมายเลข 1 ถึง 100
              /////
              Column(
                children: [
                  for (var row in [
                    [1, 2, 3],
                    [4, 5, 6],
                    [7, 8, 9],
                  ])
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [for (var i in row) _buildNumberButton(i)],
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildNumberButton(-2),
                      _buildNumberButton(0),
                      _buildNumberButton(-1),
                    ],
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        //ชื่อเมธอดที่จะส่งค่าไป
                        onPressed: ClickCheck,
                        child: const Text('GUESS'),
                      ),
                    ],
                  )
                ],
              ),
              /////
            ],
          ),
        ),
      ),
    );
  }
}
