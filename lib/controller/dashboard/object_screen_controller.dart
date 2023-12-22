import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user_app/models/object_list.dart';
import 'package:user_app/models/reading_types.dart';
import 'package:user_app/models/readings.dart';
import 'package:user_app/models/remarks.dart';
import 'package:user_app/repo/object_list_repo.dart';
import 'package:user_app/repo/reading_repo.dart';
import 'package:user_app/utils/custom_snackbar.dart';
import 'package:user_app/views/dash_screen.dart';

class ObjectScreenController extends GetxController {
  @override
  void onInit() {
    getAllObjectList();
    getAllTypes();
    getAllRemarks();
    super.onInit();
  }

  RxBool showActualValue = true.obs;
  ImagePicker picker = ImagePicker();

  void toggleVisibility() {
    showActualValue.value = !showActualValue.value;
  }

  TextEditingController startDateController = TextEditingController();
  TextEditingController readingValueController = TextEditingController();
  var startSelectedDate = DateTime.now().obs;

  final selectedTable = ReadingTypes().obs;
  void setSelectedTable(ReadingTypes table) {
    selectedTable.value = table;
  }

  var imageBytes = Rxn<Uint8List>();

  void onPickImage() {
    try {
      var pickedFile = picker.pickImage(source: ImageSource.gallery);
      pickedFile.then((value) async {
        if (value == null) return;

        imageBytes.value = await value.readAsBytes();
      });
    } catch (e) {}
  }

  startChooseDate(BuildContext context) async {
    log("choose date");
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(),
          child: child ?? Container(),
        );
      },
    );

    if (pickedDate != null) {
      startSelectedDate.value = pickedDate;

      startDateController.text =
          startSelectedDate.value.toString().split(" ")[0];
      log('--------->>>>>>>>>>>>${startDateController.text.toString()}');
    }
  }

  RxBool loading = RxBool(false);
  RxList<ObjectList> objectListDetail = <ObjectList>[].obs;
  getAllObjectList() async {
    log("object screen controller loaded");
    loading.value = true;
    await ObjectListRepo.getObjectList(
      onSuccess: (objectList) {
        loading.value = false;
        objectListDetail.addAll(objectList);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Objects", message: message);
      }),
    );
  }

  RxList<ReadingList> readingsListDetail = <ReadingList>[].obs;
  getAllReadingList(String id) async {
    log("object screen controller loaded");
    loading.value = true;
    await ReadingListRepo.getReadingList(
      id: id,
      onSuccess: (readList) {
        loading.value = false;
        readingsListDetail.addAll(readList);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Readings", message: message);
      }),
    );
  }

  RxList<ReadingTypes> allTypes = <ReadingTypes>[].obs;

  var selectedReadingType = Rxn<ReadingTypes>();

  getAllTypes() async {
    loading.value = true;
    await ReadingListRepo.getReadingTypes(
      onSuccess: (table) {
        loading.value = false;
        allTypes.addAll(table);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Reading Types", message: message);
      }),
    );
  }

  RxList<Remarks> allRemarks = <Remarks>[].obs;

  //selectedRemark

  var selectedRemark = Rxn<Remarks>();

  getAllRemarks() async {
    loading.value = true;
    await ReadingListRepo.getRemarks(
      onSuccess: (remark) {
        loading.value = false;
        allRemarks.addAll(remark);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Remarks", message: message);
      }),
    );
  }

  addReading(String id) async {
    loading.value = true;
    String remarks = selectedRemark.value?.name.toString() ??
        allRemarks.first.name.toString();
    String readingTypeId = selectedReadingType.value?.id.toString() ?? '';
    print(remarks);
    print(readingTypeId);
    print(readingTypeId);
    await ReadingListRepo.addReadings(
      image: imageBytes.value,
      startDate: startDateController.text,
      id: id,
      readlingValue: readingValueController.text,
      remarks: remarks,
      readingTypeId: readingTypeId,
      onSuccess: () {
        loading.value = false;
        Get.offAllNamed(DashScreen.routeName);
        CustomSnackBar.success(
            title: "Reading", message: "Reading is done sucessfully");
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Error", message: message);
      }),
    );
  }
}
