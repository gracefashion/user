class CheckboxModel{
  String courseTitle;
  bool isSelected;
  CheckboxModel({required this.courseTitle,required this.isSelected});

  CheckboxModel copyWith({
    String? courseTitle,
    bool? isSelected,
  }) => CheckboxModel(
    courseTitle: courseTitle ?? this.courseTitle, 
    isSelected: isSelected ?? this.isSelected,
    );
}