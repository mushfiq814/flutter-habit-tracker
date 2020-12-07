class HabitActivity {
  final String date;
  final int habitId;
  final bool done;

  HabitActivity({
    this.date,
    this.habitId,
    this.done,
  });

  factory HabitActivity.fromList(List<dynamic> list) {
    return new HabitActivity(
      date: list[0],
      habitId: int.parse(list[1]),
      done: list[2] == "1"
    );
  }
}