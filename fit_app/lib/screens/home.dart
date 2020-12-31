import 'package:fit_app/domain/workout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaxFit'),
        leading: Icon(Icons.fitness_center),
        elevation: 0.00,
      ),
      body: WorkOutsList(),
    );
  }
}

class WorkOutsList extends StatelessWidget {
  final workouts = <Workout>[
    Workout(
        title: 'Test1',
        author: 'Max1',
        description: 'Test Workout1',
        level: 'Beginner'),
    Workout(
        title: 'Test2',
        author: 'Max2',
        description: 'Test Workout2',
        level: 'Intermediate'),
    Workout(
        title: 'Test3',
        author: 'Max3',
        description: 'Test Workout3',
        level: 'Beginner'),
    Workout(
        title: 'Test4',
        author: 'Max4',
        description: 'Test Workout4',
        level: 'Advanced'),
    Workout(
        title: 'Test5',
        author: 'Max5',
        description: 'Test Workout5',
        level: 'Intermediate'),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
        itemBuilder: (context, i) {
          return Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Container(
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                tileColor: Color.fromRGBO(50, 65, 85, 0.9),
                title: Text(
                  workouts[i].title,
                  style: TextStyle(color: Colors.white),
                ),
                leading: Container(
                  padding: EdgeInsets.only(right: 12),
                  child: Icon(
                    Icons.fitness_center,
                    color: Theme.of(context).textTheme.title.color,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(width: 1, color: Colors.white),
                    ),
                  ),
                ),
                trailing: Container(
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.white,
                  ),
                ),
                subtitle: subtitle(context, workouts[i]),
              ),
            ),
          );
        },
        itemCount: workouts.length,
      ),
    );
  }
}

Widget subtitle(BuildContext context, Workout workout) {
  var color = Colors.grey;
  double indicatorlevel = 0;

  switch (workout.level) {
    case 'Beginner':
      color = Colors.green;
      indicatorlevel = 0.33;
      break;
    case 'Intermediate':
      color = Colors.yellow;
      indicatorlevel = 0.66;
      break;
    case 'Advanced':
      color = Colors.red;
      indicatorlevel = 0.99;
      break;
  }
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: LinearProgressIndicator(
          backgroundColor: Colors.white,
          value: indicatorlevel,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ),
      Expanded(
        flex: 4,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            workout.level,
            style: TextStyle(color: Colors.white),
          ),
        ),
      )
    ],
  );
}
