import 'package:flutter/material.dart';
import 'package:kzn/data/models/checkbox_model.dart';

final String appName = "A 1 Online Learning Center";
// production server http://13.213.196.157:8000 2021-10-08 Updated
// development server http://192.168.1.2:8000
// http://127.0.0.1:8000/
//final String backendApiServer = 'http://13.213.196.157:8000';
final String backendApiServer = 'http://3.7.94.137:8000';
final String apiVersion = backendApiServer + '';
final String loginEndpoint = apiVersion + '/api/token/';
final String courseEndpoint = apiVersion + '/courses/';
final String subscriptionEndpoint = apiVersion + '/subscriptions/';

final String appIconAsset = "assets/images/appicon.png";
final String appIconUrl =
    "https://a1olc.sfo3.cdn.digitaloceanspaces.com/A1.jpeg";

final Color tileColor = Colors.yellow;
final Color? iconColor = Colors.indigo[900];

final String fbProtocolUrl = "fb://page/102832035634505";
final String fallbackUrl =
    "https://www.facebook.com/A-1-Online-Learning-Center-102832035634505";

final List<String> introSliderImages = [
  "assets/images/slider/1.png",
  "assets/images/slider/2.png",
  "assets/images/slider/3.png",
  "assets/images/slider/4.png"
];

const List<String> courseNameList = [
  "Ready To Wear Basic Outfit Batch 2",
  "Fashion Illustration Online Training",
  "Baby Wear Online Class",
  "Polo Shirt & T Shirt Online Class",
  "Men Wear Wedding Suit Online Class",
  "Master of Myanmar Blouse Online Class",
  "Ready - Made Pant Online Training Course",
  "Readymade Coat & Jacket Online Class",
  "Ready To Wear Basic Outfit Course Online Class",
  "Readymade Crop Top Online Class",
  "Myanmar Basic Blouse & Longyi Course Online Class",
  "Ready - Made Corset & Bra Online Class",
  "Ready Made Advanced Online Class",
];
List<CheckboxModel> courseList = [
  CheckboxModel(
      courseTitle: "Ready To Wear Basic Outfit Batch 2", isSelected: false),
  CheckboxModel(
      courseTitle: "Fashion Illustration Online Training", isSelected: false),
  CheckboxModel(courseTitle: "Baby Wear Online Class", isSelected: false),
  CheckboxModel(
      courseTitle: "Polo Shirt & T Shirt Online Class", isSelected: false),
  CheckboxModel(
      courseTitle: "Men Wear Wedding Suit Online Class", isSelected: false),
  CheckboxModel(
      courseTitle: "Master of Myanmar Blouse Online Class", isSelected: false),
  CheckboxModel(
      courseTitle: "Ready - Made Pant Online Training Course",
      isSelected: false),
  CheckboxModel(
      courseTitle: "Readymade Coat & Jacket Online Class", isSelected: false),
  CheckboxModel(
      courseTitle: "Ready To Wear Basic Outfit Course Online Class",
      isSelected: false),
  CheckboxModel(
      courseTitle: "Readymade Crop Top Online Class", isSelected: false),
  CheckboxModel(
      courseTitle: "Myanmar Basic Blouse & Longyi Course Online Class",
      isSelected: false),
  CheckboxModel(
      courseTitle: "Ready - Made Corset & Bra Online Class", isSelected: false),
  CheckboxModel(
      courseTitle: "Ready Made Advanced Online Class", isSelected: false),
];

final List<String> paymentAccList = [
  "09968610865 (KBZ Pay)",
  "Wave Pay 09269303500 Password - 303500 ထားပေးပါ။",
  "20009228825 (AYA Bank)",
  "0010600100428507 (CB Bank)",
];

const Map<String, dynamic> paymentAccMap = {
  "1": "09968610865 (KBZ Pay)",
  "2": "Wave Pay 09269303500 Password - 303500 ထားပေးပါ။",
  "3": "20009228825 (AYA Bank)",
  "4": "0010600100428507 (CB Bank)",
};

//Theme
const inputLabel = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);
const courseLabel = TextStyle(
  color: Colors.black,
  fontSize: 18,
);
const formBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.grey,
  ),
);

const enrollCollection = "enrollCollection";
