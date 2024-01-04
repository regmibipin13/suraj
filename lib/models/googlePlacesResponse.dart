// To parse this JSON data, do
//
//     final googlePlacesResponse = googlePlacesResponseFromJson(jsonString);

import 'dart:convert';

GooglePlacesResponse googlePlacesResponseFromJson(String str) =>
    GooglePlacesResponse.fromJson(json.decode(str));

String googlePlacesResponseToJson(GooglePlacesResponse data) =>
    json.encode(data.toJson());

class GooglePlacesResponse {
  final List<Candidate>? candidates;
  final String? status;

  GooglePlacesResponse({
    this.candidates,
    this.status,
  });

  factory GooglePlacesResponse.fromJson(Map<String, dynamic> json) =>
      GooglePlacesResponse(
        candidates: json["candidates"] == null
            ? []
            : List<Candidate>.from(
                json["candidates"]!.map((x) => Candidate.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "candidates": candidates == null
            ? []
            : List<dynamic>.from(candidates!.map((x) => x.toJson())),
        "status": status,
      };
}

class Candidate {
  final String? placeId;

  Candidate({
    this.placeId,
  });

  factory Candidate.fromJson(Map<String, dynamic> json) => Candidate(
        placeId: json["place_id"],
      );

  Map<String, dynamic> toJson() => {
        "place_id": placeId,
      };
}
