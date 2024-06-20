import 'package:frontend/model/get_all_dto.dart';

class StudentFilter extends GetAllDto {
  num? classID;
  StudentFilter(
      {super.searchText,
      super.sortField,
      super.sortOrder,
      super.skipCount,
      super.fromDate,
      super.toDate,
      this.classID,
      super.maxResultCount});

  StudentFilter.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    classID = json['classID'];
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = super.toJson();
    if (classID != null) {
      data['classID'] = classID.toString();
    } else {
      data['classID'] = null;
    }

    return data;
  }
}
