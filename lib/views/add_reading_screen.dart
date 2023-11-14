import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/controller/dashboard/home_screen_controller.dart';
import 'package:user_app/models/object_list.dart';
import 'package:user_app/models/reading_types.dart';
import 'package:user_app/models/remarks.dart';
import 'package:user_app/utils/colors.dart';
import 'package:user_app/widgets/custom/custom_textfield.dart';

class AddReadingScreen extends StatelessWidget {
  AddReadingScreen({super.key, required this.obj});
  final formKey = GlobalKey<FormState>();
  final ObjectList obj;
  final c = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: theme.colorScheme.tertiary,
        elevation: 5,
        shadowColor: AppColors.shadowColor,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          "Add Reading",
          style: textTheme.titleSmall,
        ),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                c.addReading(obj.id.toString());
              }
            },
            child: Text(
              "Save",
              style: textTheme.titleSmall!.copyWith(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                ),
                child: Column(
                  children: [
                    CustomTextField(
                      hint: "Select date",
                      readOnly: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please select a date';
                        }
                        return null;
                      },
                      controller: c.startDateController,
                      onTap: () => c.startChooseDate(context),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    CustomTextField(
                      controller: c.readingValueController,
                      hint: "Reading Value",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This field can't be empty";
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    DropdownButtonFormField<ReadingTypes>(
                      decoration: const InputDecoration(
                        // labelText: 'Select a table',
                        border: OutlineInputBorder(),
                      ),
                      value: c.selectedReadingType.value,
                      items: c.allTypes
                          .map((table) => DropdownMenuItem(
                                value: table,
                                child: Text(table.name!),
                              ))
                          .toList(),
                      onChanged: (selectedTable) {
                        c.selectedReadingType.value = selectedTable!;
                      },
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    DropdownButtonFormField<Remarks>(
                      decoration: const InputDecoration(
                        // labelText: 'Select a table',
                        border: OutlineInputBorder(),
                      ),
                      value: c.allRemarks.first,
                      items: c.allRemarks
                          .map((table) => DropdownMenuItem(
                                value: table,
                                child: Text(table.name!),
                              ))
                          .toList(),
                      onChanged: (selectedTable) {
                        c.setSelectedRemarks(selectedTable!);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
