class HabitActivity {
  final String date;
  final int habitId;
  final bool done;

  HabitActivity({
    this.date,
    this.habitId,
    this.done,
  });

  factory HabitActivity.fromJson(List<String> json) {
    return new HabitActivity(
      date: json[0],
      habitId: int.parse(json[1]),
      done: json[2] == "1"
    );
  }
} 