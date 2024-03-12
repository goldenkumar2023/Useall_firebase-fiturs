// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Timerscreen extends StatefulWidget {
//   const Timerscreen({Key? key}) : super(key: key);
//
//   @override
//   State<Timerscreen> createState() => _TimerscreenState();
// }
//
// class _TimerscreenState extends State<Timerscreen> {
//   String hoursString = "00", minutestring = "00", secondstring = "0";
//
//   int hours = 0, minutes = 0, seconds = 0;
//   bool isTimerRunning = false, isResetButtonVisible = false;
//   late Timer timer;
//
//   void startTimer() {
//     setState(() {
//       isTimerRunning = true;
//       timer = Timer.periodic(Duration(seconds: 1), (timer) {
//         startSecond();
//       });
//     });
//   }
//
//   void pauseTimer() {
//     setState(() {
//       timer.cancel();
//       isTimerRunning = false;
//     });
//     isResetButtonVisible = checkValues();
//   }
//
//   void startSecond() {
//     setState(() {
//       if (seconds < 59) {
//         seconds++;
//         secondstring = seconds.toString();
//         if (secondstring.length == 1) {
//           secondstring = "0" + secondstring;
//         } else {
//           startMinute();
//         }
//       }
//     });
//   }
//
//   void startMinute() {
//     setState(() {
//       if (minutes < 59) {
//         seconds = 0;
//         secondstring = "00";
//         minutes++;
//         minutestring = minutes.toString();
//         if (minutestring.length == 1) {
//           minutestring = "0" + minutestring;
//         } else {
//           startHour();
//         }
//       }
//     });
//   }
//
//   void startHour() {
//     setState(() {
//       seconds = 0;
//       minutes = 0;
//       secondstring = "00";
//       minutestring = "00";
//       hours++;
//       hoursString = hours.toString();
//       if (hoursString.length == 1) {
//         hoursString = "0" + hoursString;
//       }
//     });
//   }
//
//   void resetTimer() {
//     setState(() {
//       seconds = 0;
//       minutes = 0;
//       hours = 0;
//       secondstring = "00";
//       minutestring = "00";
//       hoursString = "00";
//       isResetButtonVisible = false;
//     });
//   }
//
//   bool checkValues() {
//     if (seconds != 0 || minutes != 0 || hours != 0) {
//       return true;
//     } else {
//       return false;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.cyan,
//         elevation: 0,
//         leading: Icon(
//           Icons.menu,
//           color: Colors.orange,
//         ),
//         title: Text(
//           "StopWatch",
//           style: TextStyle(color: Colors.cyan),
//         ),
//       ),
//       body: SizedBox(
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "$hoursString:$minutestring:$secondstring",
//               style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (isTimerRunning) {
//                   pauseTimer();
//                 } else {
//                   startTimer();
//                 }
//               },
//               child: Text(isTimerRunning ? "Pause" : "Play"),
//             ),
//             isResetButtonVisible
//                 ? ElevatedButton(
//               onPressed: () {
//                 resetTimer();
//               },
//               child: Text("Reset"),
//             )
//                 : SizedBox(),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'dart:async';

import 'package:flutter/material.dart';

class HomePageTimer extends StatefulWidget {
  const HomePageTimer({super.key});

  @override
  State<HomePageTimer> createState() => _HomePageTimerState();
}

class _HomePageTimerState extends State<HomePageTimer> {

  StreamController<int> timerController = StreamController();
  int Counter = 0;

  startTimer(){
    Timer.periodic(Duration(seconds: 1), (timer) {
      timerController.add(Counter++);

    });
  }

  @override
  void initState() {

    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
      Column(
        children: [
          StreamBuilder(stream:timerController.stream , builder: (context, snapshot) {
            if(snapshot.hasData){
              return Text("Timer ${snapshot.data} Secend  ",style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold),);
            }
            else{
              return Text("Loading");
            }
          } ,)

        ],
      )),
    );
  }
}

