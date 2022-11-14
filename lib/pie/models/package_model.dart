class PackageModel {
  String title;
  String likes;
  String description;
  String version;
  List<String> tags;

  PackageModel({
    required this.title,
    required this.likes,
    required this.description,
    required this.version,
    required this.tags,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'likes': title,
      'version': title,
      'tags': title,
    };
  }

  factory PackageModel.fromMap(Map<String, dynamic> map) {
    return PackageModel(
        title: map['title'] ?? '',
        likes: map['likes'] ?? '',
        description: map['description'] ?? '',
        version: map['version'] ?? '',
        tags: List<String>.from(map['tags']));
  }
}
