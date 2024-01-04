import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:user_app/controller/dashboard/object_screen_controller.dart';
import 'package:user_app/models/googlePlaceDetailReponse.dart';
import 'package:user_app/models/googlePlacesResponse.dart';
import 'package:user_app/models/object_list.dart';
import 'package:user_app/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'package:user_app/utils/custom_snackbar.dart';
import 'package:user_app/views/add_reading_screen.dart';
import 'package:user_app/views/reading_screen.dart';
import 'package:user_app/widgets/custom/elevated_button.dart';

class ObjectDetailScreen extends StatefulWidget {
  const ObjectDetailScreen({super.key, required this.objlist});

  final ObjectList objlist;

  @override
  State<ObjectDetailScreen> createState() => _ObjectDetailScreenState();
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
}

class _ObjectDetailScreenState extends State<ObjectDetailScreen> {
  final c = Get.put(ObjectScreenController());

  bool? isAllowed;

  @override
  void initState() {
    super.initState();
    checkLocation();
  }

  void checkLocation() async {
    try {
      Position position = await _determinePosition();
      var data = await http.get(
          Uri.parse(
              'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?key=AIzaSyAYNRBLsx31Eh9XanXrTolPuRk7q9DuW1U&input=${widget.objlist.googleAddress}&inputtype=textquery'),
          headers: {
            "Accept": "application/json",
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Methods": "GET, POST"
          });

      GooglePlacesResponse googlePlacesResponse =
          googlePlacesResponseFromJson(data.body);

      var placeId = googlePlacesResponse.candidates?[0].placeId;

      var data2 = await http.get(
          Uri.parse(
              'https://maps.googleapis.com/maps/api/place/details/json?place_id=${placeId}&key=AIzaSyAYNRBLsx31Eh9XanXrTolPuRk7q9DuW1U'),
          headers: {
            "Accept": "application/json",
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Methods": "GET, POST"
          });

      GooglePlaceDetailResponse googlePlaceDetailResponse =
          googlePlaceDetailResponseFromJson(data2.body);

      var lat = googlePlaceDetailResponse.result?.geometry?.location?.lat;
      var lng = googlePlaceDetailResponse.result?.geometry?.location?.lng;

      var distance = Geolocator.distanceBetween(
          position.latitude, position.longitude, lat ?? 0.0, lng ?? 0.0);

      if (distance < 100) {
        setState(() {
          isAllowed = true;
        });
      } else {
        setState(() {
          isAllowed = false;
        });
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: theme.colorScheme.tertiary,
        elevation: 5,
        shadowColor: AppColors.shadowColor,
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
                  details: widget.objlist.objectId ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Contract Transaction",
                  details: widget.objlist.contractTransaction ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Customer",
                  details: widget.objlist.customer ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Invoice Type",
                  details: widget.objlist.invoiceType ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Frequency",
                  details: widget.objlist.frequency ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Emirates",
                  details: widget.objlist.emirates ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Visiting Address",
                  details: widget.objlist.visitingAddress ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "City",
                  details: widget.objlist.city ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Contact Name",
                  details: widget.objlist.contactName ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Phone",
                  details: widget.objlist.phone ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Email",
                  details: widget.objlist.email ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Remarks",
                  details: widget.objlist.remarks ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Rider Id",
                  details: widget.objlist.riderId ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Area",
                  details: widget.objlist.area ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Google Address",
                  details: widget.objlist.googleAddress ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Month Wise Remarks",
                  details: widget.objlist.monthWiseRemarks ?? "",
                ),
                ObjectListRow(
                  textTheme: textTheme,
                  theme: theme,
                  title: "Batch",
                  details: widget.objlist.batch ?? "",
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 13, right: 13, bottom: 16),
        child: Row(
          children: [
            Flexible(
                flex: 1,
                child: CustomElevatedButton(
                  backGroundColor: Colors.green,
                  onTap: () {
                    Uri mapLocation = Uri.parse(
                        'https://www.google.com/maps/search/?api=1&query=${widget.objlist.googleAddress}');
                    launchUrl(mapLocation);
                  },
                  title: "Go to Map",
                )),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
                width: 120,
                child: isAllowed == null
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                        ],
                      )
                    : CustomElevatedButton(
                        onTap: () {
                          if (isAllowed == null) {
                            return;
                          } else if (isAllowed == false) {
                            CustomSnackBar.error(
                                title: "Not Allowed",
                                message:
                                    "Not allowed, go near the Place to add reading");
                            return;
                          }
                          Get.to(() => AddReadingScreen(
                                obj: widget.objlist,
                              ));
                        },
                        title: "Add Reading",
                      )),
            const SizedBox(
              width: 10,
            ),
            Flexible(
                flex: 1,
                child: CustomElevatedButton(
                  onTap: () {
                    c.readingsListDetail.clear();
                    c.getAllReadingList(widget.objlist.id.toString());

                    Get.to(() => ReadingScreen(
                          objectListId: widget.objlist.id.toString(),
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
          const SizedBox(
            width: 15,
          ),
          Flexible(
            child: Text(
              details,
              style: textTheme.bodyMedium!.copyWith(),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
