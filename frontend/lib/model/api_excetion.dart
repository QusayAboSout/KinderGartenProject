class ApiExcetion {
  List<Messages>? messages;

  ApiExcetion({this.messages});

  ApiExcetion.fromJson(Map<String, dynamic> json) {
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages!.add(Messages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (messages != null) {
      data['messages'] = messages!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['messageCode'] = messageCode;
    data['variables'] = variables;
    return data;
  }
}
