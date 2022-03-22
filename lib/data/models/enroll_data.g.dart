// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enroll_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrollData _$EnrollDataFromJson(Map<String, dynamic> json) => EnrollData(
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      courseNameList: (json['courseNameList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      paymentAccName: json['paymentAccName'] as String,
      bankSsImage: json['bankSsImage'] as String,
      facebookProfileSsImage: json['facebookProfileSsImage'] as String,
    );

Map<String, dynamic> _$EnrollDataToJson(EnrollData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'courseNameList': instance.courseNameList,
      'paymentAccName': instance.paymentAccName,
      'bankSsImage': instance.bankSsImage,
      'facebookProfileSsImage': instance.facebookProfileSsImage,
    };
