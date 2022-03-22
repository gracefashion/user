import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kzn/controller/enroll_controller.dart';
import 'package:kzn/data/constant.dart';

class EnrollFormRoute extends StatefulWidget {
  static const routeName = '/enroll_route';
  const EnrollFormRoute({Key? key}) : super(key: key);

  @override
  State<EnrollFormRoute> createState() => _EnrollFormRouteState();
}

class _EnrollFormRouteState extends State<EnrollFormRoute> {
  @override
  void initState() {
    Get.put(EnrollController());
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<EnrollController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    EnrollController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text("Enroll Your Desire Courses",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
                color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Name and Phone FormField
                Text("Name", style: courseLabel),
                const SizedBox(height: 10),
                TextFormField(
                  controller: controller.nameController,
                  validator: controller.nameInputValidator,
                  decoration: InputDecoration(
                    hintText: "Name",
                    border: formBorder,
                  ),
                ),
                const SizedBox(height: 15),
                Text("Phone Number", style: courseLabel),
                const SizedBox(height: 10),
                TextFormField(
                  controller: controller.phoneController,
                  keyboardType: TextInputType.phone,
                  validator: controller.phoneInputValidator,
                  decoration: InputDecoration(
                    hintText: "Phone Number",
                    border: formBorder,
                  ),
                ),
                const SizedBox(height: 15),
                //Course Multiple Checkbox
                Text("တက်ရောက်လိုသော အတန်း", style: courseLabel),
                Obx(() {
                  final list = controller.checkboxModelList;
                  return SizedBox(
                    height: list.length * 30,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 32,
                          child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.all(0),
                            value: list[index].isSelected,
                            onChanged: (val) =>
                                controller.changeCheckboxValue(val!, index),
                            title: Text(
                              list[index].courseTitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: courseLabel,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
                const SizedBox(height: 15),
                //Payment Options
                Text("Payment (Acc Name : Yadanar Aung)", style: courseLabel),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Obx(() {
                    return DropdownButton<String>(
                      underline: const SizedBox(),
                      isExpanded: true,
                      alignment: Alignment.center,
                      value: controller.paymentAccValue.value,
                      onChanged: (val) => controller.changePaymentAccValue(val),
                      items: paymentAccList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          onTap: () => controller.changePaymentAccValue(value),
                          value: value,
                          child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(value)),
                        );
                      }).toList(),
                    );
                  }),
                ),
                const SizedBox(height: 15),
                //Bank ScreenShot
                Text("Bank Screenshot", style: courseLabel),
                const SizedBox(height: 5),
                SizedBox(
                    height: 50,
                    child: Obx(() {
                      return Row(children: [
                        //OutlineButton to get Image
                        OutlinedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey.shade300,
                          ),
                          onPressed: () => getBankScreenshot(controller),
                          child: Text(
                            "Choose Screenshot",
                            style: courseLabel.copyWith(fontSize: 16),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            controller.bankSs.isEmpty
                                ? "No file chosen"
                                : controller.bankSs.value,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ]);
                    })),
                const SizedBox(height: 15),
                //Facebook Profile ScreenShot
                Text("Facebook Account Profile Screenshot", style: courseLabel),
                const SizedBox(height: 5),
                SizedBox(
                    height: 50,
                    child: Obx(() {
                      return Row(children: [
                        //OutlineButton to get Image
                        OutlinedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey.shade300,
                          ),
                          onPressed: () =>
                              getFacebookProfileScreenshot(controller),
                          child: Text(
                            "Choose Screenshot",
                            style: courseLabel.copyWith(fontSize: 16),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            controller.facebookProfileSs.isEmpty
                                ? "No file chosen"
                                : controller.facebookProfileSs.value,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ]);
                    })),
                const SizedBox(width: 15),
                Obx(() => SizedBox(
                      height: 50,
                      width: size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        ),
                        onPressed: () => controller.isUploading.value
                            ? null
                            : controller.uploadEnroll().then((value) =>
                                value ? Navigator.of(context).pop() : null),
                        child: controller.isUploading.value
                            ? SizedBox(
                                height: 50,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ))
                            : Text("Enroll Now!",
                                style:
                                    inputLabel.copyWith(color: Colors.white)),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getBankScreenshot(EnrollController controller) async {
    try {
      final XFile? image =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      controller.setBankSs(image!.path);
    } catch (e) {
      debugPrint("Error Bank Slip Image Picking");
    }
  }

  getFacebookProfileScreenshot(EnrollController controller) async {
    try {
      final XFile? image =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      controller.setFacebookProfileSs(image!.path);
    } catch (e) {
      debugPrint("Error Bank Slip Image Picking");
    }
  }
}
