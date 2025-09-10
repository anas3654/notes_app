class NoteModel {
  String title;
  String content;
  DateTime date;
  bool isNew;

  NoteModel(
      {required this.isNew,
      required this.title,
      required this.content,
      required this.date});

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
    this.title = title ?? this.title;
    this.content = content ?? this.content;
    this.date = date ?? this.date;
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      isNew: true,
      title: map['title'],
      content: map['content'],
      date: DateTime.parse(map['date']),
    );
  }
}

List<NoteModel> notes = [
  NoteModel(
      isNew: false,
      title: "Meeting Notes",
      content: "Discuss project milestones and deadlines.",
      date: DateTime(2023, 10, 1, 14, 30)),
  NoteModel(
    isNew: false,
    title: "Grocery List",
    content: "Milk, Eggs, Bread, Butter, Fruits, Vegetables.",
    date: DateTime.now().subtract(Duration(days: 2)),
  ),
  NoteModel(
    isNew: false,
    title: "Workout Plan",
    content: "Monday: Cardio, Wednesday: Strength Training, Friday: Yoga.",
    date: DateTime.now().subtract(Duration(days: 3)),
  ),
  NoteModel(
    isNew: false,
    title: "Travel Itinerary",
    content: "Visit Paris, Rome, and Barcelona over two weeks.",
    date: DateTime.now().subtract(Duration(days: 4)),
  ),
  NoteModel(
    isNew: false,
    title: "Book Recommendations",
    content: "Read 'The Alchemist', '1984', and 'To Kill a Mockingbird'.",
    date: DateTime.now().subtract(Duration(days: 5)),
  ),
  NoteModel(
    isNew: false,
    title: "Recipe Ideas",
    content: "Try making homemade pizza and pasta this weekend.",
    date: DateTime.now().subtract(Duration(days: 6)),
  ),
  NoteModel(
    isNew: false,
    title: "Meeting Notes",
    content: "Discuss project milestones and deadlines.",
    date: DateTime.now().subtract(Duration(days: 1)),
  ),
  NoteModel(
    isNew: false,
    title: "Grocery List",
    content: "Milk, Eggs, Bread, Butter, Fruits, Vegetables.",
    date: DateTime.now().subtract(Duration(days: 2)),
  ),
];
