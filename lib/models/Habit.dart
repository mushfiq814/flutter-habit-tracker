class Habit {
  final int id;
  final String name;

  Habit({
    this.id,
    this.name,
  });

  factory Habit.fromList(List<dynamic> list) {
    return new Habit(
      id: int.parse(list[0]),
      name: list[1],
    );
  }

  void printHabit() => print('id: $id, name: $name');
} 