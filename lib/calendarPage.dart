import 'main.dart';
import 'articlesPagecopy.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:numberpicker/numberpicker.dart';
//import 'package:intl/intl.dart';
//import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _dateTime = DateTime.now();
  int? tempdate;
  //NumberPicker? integerNumberPicker;

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  void _showDatePicker() {
    var appState = context.read<MyAppState>();

    showDatePicker(
      helpText: "Select your first day of last period",
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022, 1, 1),
      lastDate: DateTime.now(),
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
      tempdate = (daysBetween(_dateTime, DateTime.now()));
      appState.pregnancy_week = (tempdate! ~/ 7) + 1;
    }, onError: (e) {
      _dateTime = DateTime.now();
    });
  }

  // _handleValueChanged(int value) {
  //   var appState = context.read<MyAppState>();
  //   appState.pregnancy_week = value;
  // }

  // _handleValueChangedExternally(int value) {
  //   var appState = context.read<MyAppState>();
  //   appState.pregnancy_week = value;
  //   //integerNumberPicker.animateInt(value);
  // }

  // void _showIntegerDialog() {
  //   var appState = context.read<MyAppState>();

  //   showDialog<int>(
  //       context: context,
  //       builder: (
  //         BuildContext context,
  //       ) {
  //         return AlertDialog(
  //           title: Text("pick number"),
  //           content: StatefulBuilder(builder: (context, setState) {
  //             return NumberPicker(
  //               value: appState.pregnancy_week,
  //               minValue: 0,
  //               maxValue: 60,
  //               step: 1,
  //               onChanged: _handleValueChangedExternally,
  //               haptics: true,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(16),
  //                 border: Border.all(color: Colors.black26),
  //               ),
  //             );

  //             //title: new Text("Pick a int value"),
  //           }),
  //           actions: [
  //             TextButton(
  //               child: Text(
  //                 "OK",
  //               ),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //             // TextButton(
  //             //   child: Text("Cancel",),
  //             //   onPressed: () {
  //             //     Navigator.of(context).pop();
  //             //   },
  //             // )
  //           ],
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var appState = context.read<MyAppState>();
    bool _pregWeekNullcheck() => (appState.pregnancy_week == -1 ? true : false);
    Widget Cpage;

    // if (_pregWeekNullcheck()){
    //   Cpage = NeedPregWeekPage();
    // }
    // else {
    //   Cpage = resultPage();
    // }

    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        //child: Cpage,
      ),
    );

    // integerNumberPicker = NumberPicker(
    //   value: (_pregWeekNullcheck() ? 12 : appState.pregnancy_week),
    //   minValue: 0,
    //   maxValue: 100,
    //   step: 10,
    //   onChanged: _handleValueChanged,
    // );

    return Scaffold(
      backgroundColor: colorScheme.surfaceVariant,
      appBar:
          AppBar(title: Text("Calendar"), leading: Icon(Icons.calendar_month)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // display chosen date
              if (appState.pregnancy_week == -1) ...[
                Text('Please Select Pregnancy Week',
                    style: TextStyle(fontSize: 30)),
                Text(
                  "When was your first day of last period?",
                  style: TextStyle(fontSize: 18,), )
                ,
                MaterialButton(
                  onPressed: _showDatePicker,
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text('Preganacy Calculator',
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        )),
                  ),
                  color: colorScheme.secondary,
                ),
              ] else ...[
                Text(
                    'You are ' +
                        appState.pregnancy_week.toString() +
                        ' Week(s) Pregnant',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                if (0 <= appState.pregnancy_week &&
                    14 > appState.pregnancy_week) ...[
                  Text(
                    'First Trimester',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ] else if (13 <= appState.pregnancy_week &&
                    29 > appState.pregnancy_week) ...[
                  Text('Second Trimester',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ] else ...[
                  Text('Third Trimester',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ],
                Align(
                  alignment: Alignment(0.8, 0.4),
                  child: ElevatedButton(
                    child: Icon(Icons.arrow_forward_rounded),
                    //label: Text(''),
                    //icon: Icon(Icons.arrow_forward_rounded),
                    onPressed: () {
                      // Navigate to second route when tapped.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RouteOptions()),
                      );
                    },
                  ),
                ),
                MaterialButton(
                  onPressed: _showDatePicker,
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Recalculate Date',
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        )),
                  ),
                  color: colorScheme.secondary,
                ),
              ],
      
              // Text(
              //     'If you already know your pregnancy week, click this for manual setting',
              //     style: TextStyle(fontSize: 15)),
      
              // MaterialButton(
              //   onPressed: _showIntegerDialog,
              //   child: const Padding(
              //     padding: EdgeInsets.all(15.0),
              //     child: Text('Set pregnancy week',
              //         softWrap: true,
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 18,
              //         )),
              //   ),
              //   color: colorScheme.secondary,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class RouteOptions extends StatelessWidget {
  const RouteOptions({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var appState = context.read<MyAppState>();

    return Scaffold(
      backgroundColor: colorScheme.surfaceVariant,
      appBar: AppBar(
        title: Text("Calendar"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Text(
                  'You are ' +
                      appState.pregnancy_week.toString() +
                      ' Week(s) Pregnant',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              Padding(padding: EdgeInsets.all(8.0)),
              if (0 <= appState.pregnancy_week &&
                  14 > appState.pregnancy_week) ...[
                Text(
                  'First Trimester',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ] else if (13 <= appState.pregnancy_week &&
                  29 > appState.pregnancy_week) ...[
                Text('Second Trimester',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ] else ...[
                Text('Third Trimester',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ],
              Padding(padding: EdgeInsets.all(8.0)),
              ElevatedButton(
                onPressed: () {
                  // Navigate back to first route when tapped.
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FirstRoute()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.all(20.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                child: Text(
                  'Pregnancy Symptoms',
                  style: TextStyle(fontSize: 20, color: Colors.brown),
                ),
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.all(20.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                child: Text(
                  'Find Related Articles',
                  style: TextStyle(fontSize: 20, color: Colors.brown),
                ),
                onPressed: () {
                  // Navigate to second route when tapped.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RelatedArticlesPage()),
                  );
                },
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.all(20.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                child: Text(
                  'Find Nearby Resources',
                  style: TextStyle(fontSize: 20, color: Colors.brown),
                ),
                onPressed: () {
                  // Navigate to second route when tapped.
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Placeholder()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var appState = context.read<MyAppState>();

    var trimester1msg = [
      'During the first trimester your body undergoes many changes. Hormonal changes affect almost every organ system in your body. These changes can trigger symptoms even in the very first weeks of pregnancy. Your period stopping is a clear sign that you are pregnant.',
      'Most women find the second trimester of pregnancy easier than the first. But it is just as important to stay informed about your pregnancy during these months.',
      'You\'re in the home stretch! Some of the same discomforts you had in your second trimester will continue. Plus, many women find breathing difficult and notice they have to go to the bathroom even more often. This is because the baby is getting bigger and it is putting more pressure on your organs. Don\'t worry, your baby is fine and these problems will lessen once you give birth.'
    ];

    return Scaffold(
      backgroundColor: colorScheme.surfaceVariant,
      appBar: AppBar(
        title: Text("Calendar"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            if (0 <= appState.pregnancy_week &&
                14 > appState.pregnancy_week) ...[
              Text(
                trimester1msg[0],
                style: TextStyle(fontSize: 15),
              ),
            ] else if (13 <= appState.pregnancy_week &&
                29 > appState.pregnancy_week) ...[
              Text(trimester1msg[1], style: TextStyle(fontSize: 15)),
            ] else ...[
              Text(trimester1msg[2], style: TextStyle(fontSize: 15)),
            ],
            Padding(padding: EdgeInsets.all(8.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate back to first route when tapped.
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_rounded),
                ),
                ElevatedButton(
                  child: Icon(Icons.arrow_forward_rounded),
                  onPressed: () {
                    // Navigate to second route when tapped.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondRoute()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var appState = context.read<MyAppState>();

    var trimester2msg = [
      'Other changes may include:\n\n* Extreme tiredness \n*Tender, swollen breasts. Your nipples might also stick out.\n*Upset stomach with or without throwing up (morning sickness)\n*Cravings or distaste for certain foods\n*Mood swings\n*Constipation (trouble having bowel movements)\n*Need to pass urine more often\n*Headache\n*Heartburn\n*Weight gain or loss',
      'You might notice that symptoms like nausea and fatigue are going away. But other new, more noticeable changes to your body are now happening. Your abdomen will expand as the baby continues to grow. And before this trimester is over, you will feel your baby beginning to move!',
      'Some new body changes you might notice in the third trimester include:\n\n*Shortness of breath\n*Heartburn\n*Swelling of the ankles, fingers, and face. (If you notice any sudden or extreme swelling or if you gain a lot of weight really quickly, call your doctor right away. This could be a sign of preeclampsia.)\n*Hemorrhoids\n*Tender breasts, which may leak a watery pre-milk called colostrum (kuh-LOSS-struhm)\n*Your belly button may stick out\n*Trouble sleeping\n*\n*he baby "dropping", or moving lower in your abdomen\n*Contractions, which can be a sign of real or false labor',
    ];

    return Scaffold(
      backgroundColor: colorScheme.surfaceVariant,
      appBar: AppBar(
        title: Text("Calendar"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            if (0 <= appState.pregnancy_week &&
                14 > appState.pregnancy_week) ...[
              Text(
                trimester2msg[0],
                style: TextStyle(fontSize: 15),
              ),
            ] else if (13 <= appState.pregnancy_week &&
                29 > appState.pregnancy_week) ...[
              Text(trimester2msg[1], style: TextStyle(fontSize: 15)),
            ] else ...[
              Text(trimester2msg[2], style: TextStyle(fontSize: 15)),
            ],
            Padding(padding: EdgeInsets.all(8.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate back to first route when tapped.
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_rounded),
                ),
                ElevatedButton(
                  child: Icon(Icons.arrow_forward_rounded),
                  onPressed: () {
                    // Navigate to second route when tapped.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ThirdRoute()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var appState = context.read<MyAppState>();
    var trimester3msg = [
      'As your body changes, you might need to make changes to your daily routine, such as going to bed earlier or eating frequent, small meals. Fortunately, most of these discomforts will go away as your pregnancy progresses. And some women might not feel any discomfort at all! If you have been pregnant before, you might feel differently this time around. Just as each woman is different, so is each pregnancy.',
      'As your body changes to make room for your growing baby, you may have:\n\n*Body aches, such as back, abdomen, groin, or thigh pain\n*Stretch marks on your abdomen, breasts, thighs, or buttocks\n*Darkening of the skin around your nipples\n*A line on the skin running from belly button to pubic hairline\n*Patches of darker skin, usually over the cheeks, forehead, nose, or upper lip. Patches often match on both sides of the face. This is sometimes called the mask of pregnancy.\n*Numb or tingling hands, called carpal tunnel syndrome\n*Itching on the abdomen, palms, and soles of the feet. (Call your doctor if you have nausea, loss of appetite, vomiting, jaundice or fatigue combined with itching. These can be signs of a serious liver problem.)\n*Swelling of the ankles, fingers, and face. (If you notice any sudden or extreme swelling or if you gain a lot of weight really quickly, call your doctor right away. This could be a sign of preeclampsia.',
      'As you near your due date, your cervix becomes thinner and softer (called effacing). This is a normal, natural process that helps the birth canal (vagina) to open during the birthing process. Your doctor will check your progress with a vaginal exam as you near your due date. Get excited — the final countdown has begun!'
    ];

    return Scaffold(
      backgroundColor: colorScheme.surfaceVariant,
      appBar: AppBar(
        title: Text("Calendar"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            if (0 <= appState.pregnancy_week &&
                14 > appState.pregnancy_week) ...[
              Text(
                trimester3msg[0],
                style: TextStyle(fontSize: 15),
              ),
            ] else if (13 <= appState.pregnancy_week &&
                29 > appState.pregnancy_week) ...[
              Text(trimester3msg[1], style: TextStyle(fontSize: 15)),
            ] else ...[
              Text(trimester3msg[2], style: TextStyle(fontSize: 15)),
            ],
            Padding(padding: EdgeInsets.all(8.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate back to first route when tapped.
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_rounded),
                ),

                // ElevatedButton(
                //   child: const Text('⇛'),
                //   onPressed: () {
                //     // Navigate to second route when tapped.
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => const ThirdRoute()),
                //     );
                //   },
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
