import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/controller/dashboard/object_screen_controller.dart';
import 'package:user_app/models/readings.dart';
import 'package:user_app/utils/custom_text_style.dart';

import '../utils/colors.dart';

class ReadingScreen extends StatelessWidget {
  final String objectListId;
  ReadingScreen({super.key, required this.objectListId});

  final c = Get.put(ObjectScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Readings",
          style: CustomTextStyles.f16W600(),
        ),
        // leading: InkWell(
        //   onTap: () {
        //     Get.back();
        //   },
        //   child: const Padding(
        //     padding: EdgeInsets.only(left: 20),
        //     child: Icon(
        //       Icons.arrow_back,
        //       color: Colors.black,
        //     ),
        //   ),
        // ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            c.readingsListDetail.clear();
            c.getAllReadingList(objectListId);
          },
          child: Obx(
            () => c.loading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: c.readingsListDetail.length,
                    itemBuilder: ((context, index) {
                      ReadingList rList = c.readingsListDetail[index];
                      return ObjectListWidget(
                        content: "asdasd",
                        color: index % 2 == 0
                            ? AppColors.primaryColor
                            : Colors.amber,
                        readList: rList,
                      );
                    }),
                  ),
          ),
        ),
      ),
    );
  }
}

class ObjectListWidget extends StatelessWidget {
  const ObjectListWidget({
    Key? key,
    required this.content,
    required this.color,
    required this.readList,
  }) : super(key: key);

  final String content;
  final ReadingList readList;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 19,
        right: 19,
        top: 19,
      ),
      child: InkWell(
        onTap: () {},
        child: IntrinsicHeight(
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.extraWhiteLight,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(4, 4),
                    blurRadius: 9,
                    color: AppColors.shadowColor,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: color,
                    ),
                    width: 8,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 13, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Object Id: ${readList.objectId ?? ""}',
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Reading Type Id: ${readList.readingTypeId ?? ""}',
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Reading Value: ${readList.readingValue ?? ""}',
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Visiting Date: ${readList.visitDate ?? ""}',
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Remarks: ${readList.remarks ?? ""}',
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final Color? color;
  final bool showTrailing;
  final String title;
  final IconData leadingIcon;
  final VoidCallback onTap;
  const ProfileTile({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.onTap,
    this.color,
    this.showTrailing = true,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListTile(
      onTap: onTap,
      leading: Icon(
        leadingIcon,
        color: color ?? theme.colorScheme.onBackground,
      ),
      trailing: showTrailing
          ? Icon(
              Icons.chevron_right,
              color: color ?? theme.colorScheme.onBackground,
            )
          : null,
      title: Text(
        title,
        style: CustomTextStyles.f16W400(
            color: color ?? theme.colorScheme.onBackground),
      ),
    );
  }
}
