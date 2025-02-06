class Exercise {
  final String id;
  final String name;
  final int sets;
  final int reps;
  final String videoPath;

  Exercise({
    required this.id,
    required this.name,
    required this.sets,
    required this.reps,
    required this.videoPath
  });

  factory Exercise.fromMap(Map<String, dynamic> map, String id) {
    return Exercise(
      id: id,
      name: map['name'],
      sets: map['sets'],
      reps: map['reps'],
      videoPath: map['video_path']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'sets': sets,
      'reps': reps,
      'videoPath': videoPath
    };
  }
}
