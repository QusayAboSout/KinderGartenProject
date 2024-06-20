class GetAllDto {
  String? searchText;
  String? sortField;
  String? sortOrder;
  int? skipCount;
  int? maxResultCount;
  DateTime? fromDate;
  DateTime? toDate;

  GetAllDto(
      {this.searchText,
      this.sortField,
      this.sortOrder,
      this.skipCount,
      this.fromDate,
      this.toDate,
      this.maxResultCount});

  GetAllDto.fromJson(Map<String, dynamic> json) {
    searchText = json['searchText'];
    sortField = json['sortField'];
    sortOrder = json['sortOrder'];
    skipCount = json['skipCount'];
    maxResultCount = json['maxResultCount'];
    if (json['fromDate'] != null) {
      if (json['fromDate'] is DateTime) {
        fromDate = json["fromDate"];
      } else {
        fromDate = DateTime.parse(json["fromDate"]);
      }
    }
    if (json['toDate'] != null) {
      if (json['toDate'] is DateTime) {
        toDate = json["toDate"];
      } else {
        toDate = DateTime.parse(json["toDate"]);
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (searchText != null) data['searchText'] = searchText;
    if (sortField != null) data['sortField'] = sortField;
    if (sortOrder != null) data['sortOrder'] = sortOrder;
    if (skipCount != null) data['skipCount'] = skipCount.toString();
    if (maxResultCount != null) {
      data['maxResultCount'] = maxResultCount.toString();
    }
    data['fromDate'] = fromDate?.toIso8601String();
    data['toDate'] = toDate?.toIso8601String();
    return data;
  }
}
