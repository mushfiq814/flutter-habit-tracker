import 'package:flutter/material.dart';
import 'package:habit_tracker/models/Habit.dart';
import 'package:habit_tracker/models/HabitActivity.dart';
import 'package:habit_tracker/utils/sheets-api/getHabitActivities.dart';
import 'package:habit_tracker/utils/sheets-api/getHabits.dart';
import 'package:habit_tracker/utils/sheets-api/refreshSheetsToken.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Habit Tracker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = false;
  List<Habit> habits;
  List<HabitActivity> tracker;

  Future _fetchData() async {
    setState(() => isLoading = true);
    String sheetsAccessToken = await refreshSheetsToken();
    habits = await getHabits(sheetsAccessToken);
    tracker = await getHabitActivities(sheetsAccessToken);
    setState(() => isLoading = false);
  }
  
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: isLoading
        ? CircularProgressIndicator()
        : showTracker(tracker),
      ),
    );
  }
}

Widget showTracker(List<HabitActivity> habitActivities) {
  return ListView.builder(
    padding: const EdgeInsets.all(8),
    itemCount: habitActivities.length,
    itemBuilder: (BuildContext context, int index) {
      HabitActivity hAct = habitActivities[index];
      return ListTile(
        leading: Text(hAct.done.toString()),
        title: Text(hAct.date),
        subtitle: Text('Habit: ${hAct.habitId.toString()}'),
      );
    }
  );
}

Widget showHabitRow() {
  return 
}