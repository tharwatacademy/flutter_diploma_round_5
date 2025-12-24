class MessageModel {
  final String role;
  final List<MessagePart> parts;

  String get text => parts.first.text;

  MessageModel({required this.role, required this.parts});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      role: json["role"],
      parts: (json["parts"] as List)
          .map((part) => MessagePart.fromJson(part))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {"role": role, "parts": parts.map((part) => part.toJson()).toList()};
  }
}

class MessagePart {
  final String text;

  MessagePart({required this.text});

  factory MessagePart.fromJson(Map<String, dynamic> json) {
    return MessagePart(text: json["text"]);
  }

  Map<String, dynamic> toJson() {
    return {"text": text};
  }
}
