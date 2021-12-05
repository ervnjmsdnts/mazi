import 'dart:convert';

List<Interest> interestFromJson(String str) =>
    List<Interest>.from(json.decode(str).map((x) => Interest.fromJson(x)));

String interestToJson(List<Interest> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Interest {
  Interest({
    required this.id,
    required this.category,
    required this.interests,
  });

  String id;
  String category;
  List<InterestElement> interests;

  factory Interest.fromJson(Map<String, dynamic> json) => Interest(
        id: json["id"],
        category: json["category"],
        interests: List<InterestElement>.from(
            json["interests"].map((x) => InterestElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "interests": List<dynamic>.from(interests.map((x) => x.toJson())),
      };
}

class InterestElement {
  InterestElement({
    required this.name,
    required this.isSelected,
  });

  String name;
  bool isSelected;

  factory InterestElement.fromJson(Map<String, dynamic> json) =>
      InterestElement(
        name: json["name"],
        isSelected: json["isSelected"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "isSelected": isSelected,
      };
}
