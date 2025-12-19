class Portfolio {
  final int id;
  final String title;
  final String description;
  final String duration;

  Portfolio({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
  });

  factory Portfolio.fromJson(Map<String, dynamic> json) {
    return Portfolio(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      duration: json['duration'],
    );
  }
}
