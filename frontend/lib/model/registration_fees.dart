class RegistrationFeesDto {
  int? id;
  int? feesAmount;
  int? busAmount;
  int? level;
  int? year;

  RegistrationFeesDto({
    this.id,
    this.feesAmount,
    this.busAmount,
    this.level,
    this.year,
  });

  RegistrationFeesDto.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    feesAmount = json['FeesAmount'];
    busAmount = json['BusAmount'];
    level = json['Level'];
    year = json['Year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = id;
    data['FeesAmount'] = feesAmount;
    data['BusAmount'] = busAmount;
    data['Level'] = level;
    data['Year'] = year;
    return data;
  }
}

class RegistrationFeesPaginationResult {
  List<RegistrationFeesDto>? data;
  int? count;

  RegistrationFeesPaginationResult({this.data, this.count});

  RegistrationFeesPaginationResult.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <RegistrationFeesDto>[];
      json['data'].forEach((v) {
        data!.add(RegistrationFeesDto.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['registrationFees'] = this.data!.map((v) => v.toJson()).toList();
    data['count'] = count;
    return data;
  }
}
