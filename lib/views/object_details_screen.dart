import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:user_app/controller/dashboard/home_screen_controller.dart';
import 'package:user_app/models/object_list.dart';
import 'package:user_app/utils/colors.dart';
import 'package:user_app/views/add_reading_screen.dart';
import 'package:user_app/views/reading_screen.dart';
import 'package:user_app/widgets/custom/elevated_button.dart';

class ObjectDetailScreen extends StatelessWidget {
  ObjectDetailScreen({super.key, required this.objlist});

  final ObjectList objlist;
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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.extraWhiteLight,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(4, 4),
                  blurRadius: 9,
                  color: const Color(0xFF494949).withOpacity(0.1),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 4,
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Object Id",
                  details: objlist.objectId ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Contract Transaction",
                  details: objlist.contractTransaction ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Customer",
                  details: objlist.customer ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Invoice Type",
                  details: objlist.invoiceType ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Frequency",
                  details: objlist.frequency ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Emirates",
                  details: objlist.emirates ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Visiting Address",
                  details: objlist.visitingAddress ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "City",
                  details: objlist.city ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Contact Name",
                  details: objlist.contactName ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Phone",
                  details: objlist.phone ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Email",
                  details: objlist.email ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Remarks",
                  details: objlist.remarks ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Rider Id",
                  details: objlist.riderId ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Area",
                  details: objlist.area ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Google Address",
                  details: objlist.googleAddress ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Month Wise Remarks",
                  details: objlist.monthWiseRemarks ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Batch",
                  details: objlist.batch ?? "",
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Flexible(
                child: CustomElevatedButton(
              backGroundColor: Colors.green,
              onTap: () {
                Uri mapLocation = Uri.parse(
                    'https://www.google.com/maps/search/?api=1&query=${objlist.googleAddress}');
                launchUrl(mapLocation);
              },
              title: "Go to Map",
            )),
            const SizedBox(
              width: 10,
            ),
            Flexible(
                child: CustomElevatedButton(
              onTap: () {
                Get.to(() => AddReadingScreen(
                      obj: objlist,
                    ));
              },
              title: "Add Reading",
            )),
            SizedBox(
              width: 10,
            ),
            Flexible(
                child: CustomElevatedButton(
              onTap: () {
                c.readingsListDetail.clear();
                c.getAllReadingList(objlist.id.toString());

                Get.to(() => ReadingScreen(
                      objectListId: objlist.id.toString(),
                    ));
              },
              title: 'Show Reading',
            )),
          ],
        ),
      ),
    );
  }
}

class ObjectListRow extends StatelessWidget {
  const ObjectListRow({
    super.key,
    required this.textTheme,
    required this.theme,
    required this.details,
    required this.title,
  });

  final TextTheme textTheme;
  final ThemeData theme;

  final String details;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: textTheme.bodyMedium!.copyWith(),
          ),
          Text(details, style: textTheme.bodyMedium!.copyWith()),
        ],
      ),
    );
  }
}
