// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

class CarAnounceModel {
  final File carImgPath;
  final String carBrand;
  final String carModel;
  final String carMileAge;
  final String carPrice;
  final String carColor;
  final int carYear;
  final String carLoc;
  final String yourEmailAddress;
  final String yourPhoneNumber;
  final String carAdditionalInfo;

  CarAnounceModel(
      this.carImgPath,
      this.carBrand,
      this.carModel,
      this.carMileAge,
      this.carPrice,
      this.carColor,
      this.carYear,
      this.carLoc,
      this.yourEmailAddress,
      this.yourPhoneNumber,
      this.carAdditionalInfo);

  CarAnounceModel copyWith({
    File? carImgPath,
    String? carBrand,
    String? carModel,
    String? carMileAge,
    String? carPrice,
    String? carColor,
    int? carYear,
    String? carLoc,
    String? yourEmailAddress,
    String? yourPhoneNumber,
    String? carAdditionalInfo,
  }) {
    return CarAnounceModel(
      carImgPath ?? this.carImgPath,
      carBrand ?? this.carBrand,
      carModel ?? this.carModel,
      carMileAge ?? this.carMileAge,
      carPrice ?? this.carPrice,
      carColor ?? this.carColor,
      carYear ?? this.carYear,
      carLoc ?? this.carLoc,
      yourEmailAddress ?? this.yourEmailAddress,
      yourPhoneNumber ?? this.yourPhoneNumber,
      carAdditionalInfo ?? this.carAdditionalInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'carImgPath': carImgPath,
      'carBrand': carBrand,
      'carModel': carModel,
      'carMileAge': carMileAge,
      'carPrice': carPrice,
      'carColor': carColor,
      'carYear': carYear,
      'carLoc': carLoc,
      'yourEmailAddress': yourEmailAddress,
      'yourPhoneNumber': yourPhoneNumber,
      'carAdditionalInfo': carAdditionalInfo,
    };
  }

  factory CarAnounceModel.fromMap(Map<String, dynamic> map) {
    return CarAnounceModel(
      map['carImgPath'] as File,
      map['carBrand'] as String,
      map['carModel'] as String,
      map['carMileAge'] as String,
      map['carPrice'] as String,
      map['carColor'] as String,
      map['carYear'] as int,
      map['carLoc'] as String,
      map['yourEmailAddress'] as String,
      map['yourPhoneNumber'] as String,
      map['carAdditionalInfo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CarAnounceModel.fromJson(String source) =>
      CarAnounceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CarAnounceModel(carImgPath: $carImgPath, carBrand: $carBrand, carModel: $carModel, carMileAge: $carMileAge, carPrice: $carPrice, carColor: $carColor, carYear: $carYear, carLoc: $carLoc, yourEmailAddress: $yourEmailAddress, yourPhoneNumber: $yourPhoneNumber, carAdditionalInfo: $carAdditionalInfo)';
  }

  @override
  bool operator ==(covariant CarAnounceModel other) {
    if (identical(this, other)) return true;

    return other.carImgPath == carImgPath &&
        other.carBrand == carBrand &&
        other.carModel == carModel &&
        other.carMileAge == carMileAge &&
        other.carPrice == carPrice &&
        other.carColor == carColor &&
        other.carYear == carYear &&
        other.carLoc == carLoc &&
        other.yourEmailAddress == yourEmailAddress &&
        other.yourPhoneNumber == yourPhoneNumber &&
        other.carAdditionalInfo == carAdditionalInfo;
  }

  @override
  int get hashCode {
    return carImgPath.hashCode ^
        carBrand.hashCode ^
        carModel.hashCode ^
        carMileAge.hashCode ^
        carPrice.hashCode ^
        carColor.hashCode ^
        carYear.hashCode ^
        carLoc.hashCode ^
        yourEmailAddress.hashCode ^
        yourPhoneNumber.hashCode ^
        carAdditionalInfo.hashCode;
  }
}
