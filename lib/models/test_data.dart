import 'dart:convert';

class TestData {
  final String id;
  final String title;
  final String description;

  TestData({
    required this.id,
    required this.title,
    required this.description,
  });

  TestData copyWith({
    String? id,
    String? title,
    String? description,
  }) {
    return TestData(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
    };
  }

  Map<String, dynamic> toQueryParamsMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
    };
  }

  factory TestData.fromQuerParamsMap(Map<String, dynamic> map) {
    return TestData(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

  factory TestData.fromMap(Map<String, dynamic> map) {
    return TestData(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TestData.fromJson(String source) =>
      TestData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TestData(id: $id, title: $title, description: $description)';
  }

  @override
  bool operator ==(covariant TestData other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ description.hashCode;
  }
}
