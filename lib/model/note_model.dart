class NoteModel {
  String title;
  String content;
  DateTime date;

  NoteModel({required this.title, required this.content, required this.date});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'date': date.toIso8601String(),
    };
  }

  void update(
      {required String? title,
      required String? content,
      required DateTime? date}) {
    if (title != null) this.title = title;
    if (content != null) this.content = content;
    if (date != null) this.date = date;
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      title: map['title'],
      content: map['content'],
      date: DateTime.parse(map['date']),
    );
  }
}

List<NoteModel> notes = [
  NoteModel(
      title: "Meeting Notes",
      content: "Discuss project milestones and deadlines.",
      date: DateTime(2023, 10, 1, 14, 30)),
  NoteModel(
    title: "Grocery List",
    content: "Milk, Eggs, Bread, Butter, Fruits, Vegetables.",
    date: DateTime.now().subtract(Duration(days: 2)),
  ),
  NoteModel(
    title: "Workout Plan",
    content: "Monday: Cardio, Wednesday: Strength Training, Friday: Yoga.",
    date: DateTime.now().subtract(Duration(days: 3)),
  ),
  NoteModel(
    title: "Travel Itinerary",
    content: "Visit Paris, Rome, and Barcelona over two weeks.",
    date: DateTime.now().subtract(Duration(days: 4)),
  ),
  NoteModel(
    title: "Book Recommendations",
    content: "Read 'The Alchemist', '1984', and 'To Kill a Mockingbird'.",
    date: DateTime.now().subtract(Duration(days: 5)),
  ),
  NoteModel(
    title: "Recipe Ideas",
    content: "Try making homemade pizza and pasta this weekend.",
    date: DateTime.now().subtract(Duration(days: 6)),
  ),
  NoteModel(
    title: "Meeting Notes",
    content: "Discuss project milestones and deadlines.",
    date: DateTime.now().subtract(Duration(days: 1)),
  ),
  NoteModel(
    title: "Grocery List",
    content: "Milk, Eggs, Bread, Butter, Fruits, Vegetables.",
    date: DateTime.now().subtract(Duration(days: 2)),
  ),
];
