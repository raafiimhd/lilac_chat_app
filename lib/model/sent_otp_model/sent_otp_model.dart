class SendOtpRequest {
  final Datasss data;

  SendOtpRequest({required this.data});

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class Datasss {
  final String? type;
  final Attributes attributes;

  Datasss({ this.type, required this.attributes});

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'attributes': attributes.toJson(),
    };
  }
}

class Attributes {
  final String phone;

  Attributes({required this.phone});

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
    };
  }
}
