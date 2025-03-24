class VerifyOtpRequest {
  final Datas data;

  VerifyOtpRequest({required this.data});

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class Datas {
  final String type;
  final Attribute attributes;

  Datas({required this.type, required this.attributes});

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'attributes': attributes.toJson(),
    };
  }
}

class Attribute {
  final String phone;
  final int otp;
  final DeviceMeta deviceMeta;

  Attribute({
    required this.phone,
    required this.otp,
    required this.deviceMeta,
  });

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'otp': otp,
      'device_meta': deviceMeta.toJson(),
    };
  }
}

class DeviceMeta {
  final String type;
  final String name;
  final String os;
  final String browser;
  final String browserVersion;
  final String userAgent;
  final String screenResolution;
  final String language;

  DeviceMeta({
    required this.type,
    required this.name,
    required this.os,
    required this.browser,
    required this.browserVersion,
    required this.userAgent,
    required this.screenResolution,
    required this.language,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'name': name,
      'os': os,
      'browser': browser,
      'browser_version': browserVersion,
      'user_agent': userAgent,
      'screen_resolution': screenResolution,
      'language': language,
    };
  }
}
