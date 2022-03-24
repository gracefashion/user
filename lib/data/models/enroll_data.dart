import 'package:json_annotation/json_annotation.dart';

part 'enroll_data.g.dart';

@JsonSerializable()
class EnrollData {
  final String name;
  final String phoneNumber;
  final List<String> courseNameList;
  final String paymentAccName;
  final String bankSsImage;
  final String facebookProfileSsImage;
  final DateTime? dateTime;
  EnrollData({
    required this.name,
    required this.phoneNumber,
    required this.courseNameList,
    required this.paymentAccName,
    required this.bankSsImage,
    required this.facebookProfileSsImage,
    this.dateTime,
  });

  factory EnrollData.fromJson(Map<String, dynamic> json) =>
      _$EnrollDataFromJson(json);
  Map<String, dynamic> toJson() => _$EnrollDataToJson(this);

  EnrollData copyWith({
    String? name,
    String? phoneNumber,
    List<String>? courseNameList,
    String? paymentAccName,
    String? bankSsImage,
    String? facebookProfileSsImage,
    DateTime? dateTime,
  }) =>
      EnrollData(
        name: name ?? this.name,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        courseNameList: courseNameList ?? this.courseNameList,
        paymentAccName: paymentAccName ?? this.paymentAccName,
        bankSsImage: bankSsImage ?? this.bankSsImage,
        facebookProfileSsImage:
            facebookProfileSsImage ?? this.facebookProfileSsImage,
        dateTime: dateTime ?? this.dateTime,
      );
}
