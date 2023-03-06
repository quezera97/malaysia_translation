import 'package:flutter/material.dart';
import 'package:translator_app/enum/cardEnum.dart';
import 'package:translator_app/ui/choiceCard/restaurant.dart';
import 'package:translator_app/ui/translation.dart';

class Choice {
  const Choice({required this.title, required this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Restaurant', icon: Icons.restaurant),
  const Choice(title: 'Hotel', icon: Icons.hotel),
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.headlineSmall;
    return Card(
        // color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        //     .withOpacity(1.0),
        color: Colors.red,
        child: InkWell(
            onTap: () {
              if (choice.title == CardEnum.restaurant) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Restaurant()));
              } else if (choice.title == CardEnum.hotel) {
                print(CardEnum.hotel);
              }
            },
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: Icon(choice.icon,
                            size: 50.0, color: textStyle?.color)),
                    Text(choice.title,
                        style: TextStyle(
                            fontSize: 25,
                            color: Color(0xFF121212),
                            fontFamily: 'PoppinsBold')),
                  ]),
            )));
  }
}