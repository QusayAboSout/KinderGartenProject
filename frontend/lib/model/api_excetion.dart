class ApiExcetion {
  List<Messages>? messages;

  ApiExcetion({this.messages});

  ApiExcetion.fromJson(Map<String, dynamic> json) {
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages!.add(new Messages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Messages {
  String? messageCode;
  Null variables;

  Messages({this.messageCode, this.variables});

  Messages.fromJson(Map<String, dynamic> json) {
    messageCode = json['messageCode'];
    variables = json['variables'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['messageCode'] = this.messageCode;
    data['variables'] = this.variables;
    return data;
  }
}
