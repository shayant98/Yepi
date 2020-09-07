class MoodModel {
  final String date;
  final String mood;

  MoodModel({this.date, this.mood});

  MoodModel.fromMap(Map<String, dynamic> data)
      : date = data['date'],
        mood = data['mood'];

  Map<String, dynamic> toJson() => {
        'date': date,
        'mood': mood,
      };
}
