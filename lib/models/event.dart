import 'dart:convert';

class Event {
  final String? id;
  final String? uuid;
  final String? text;
  final String? dateTime;
  final String? imagePath;
  final String? videoPath;
  final int? functionId;
  final int? deviceId;
  final int? checkpointId;

  Event({
    this.id,
    this.uuid,
    this.text,
    this.dateTime,
    this.imagePath,
    this.videoPath,
    this.functionId,
    this.deviceId,
    this.checkpointId,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json['id'] as String,
        uuid: json['uuid'] as String,
        text: json['text'] as String,
        dateTime: json['dateTime'] as String,
        imagePath: json['imagePath'] as String,
        videoPath: json['videoPath'] as String,
        functionId: json['functionId'] as int,
        deviceId: json['deviceId'] as int,
        checkpointId: json['checkpointId'] as int,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'uuid': uuid,
        'text': text,
        'dateTime': dateTime,
        'imagePath': imagePath,
        'videoPath': videoPath,
        'functionId': functionId,
        'deviceId': deviceId,
        'checkpointId': checkpointId,
      };

  factory Event.fromString(String jsonString) =>
      Event.fromJson(json.decode(jsonString) as Map<String, dynamic>);
}
