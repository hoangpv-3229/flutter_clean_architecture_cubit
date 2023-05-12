import 'package:equatable/equatable.dart';

class Source {
  String? id;
  String? name;

  Source({
      this.id, 
      this.name,});

  factory Source.fromJson(dynamic json) {
    return Source(
        id: json['id'],
        name: json['name']
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}