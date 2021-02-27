class MessageModel {
  String id;
  String sender;
  String message;
  String date;

  MessageModel({this.id, this.sender, this.message, this.date});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      sender: json['sender'],
      message: json['message'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sender'] = this.sender;
    data['message'] = this.message;
    data['date'] = this.date;
    return data;
  }
}
