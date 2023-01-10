/*
 * File name: availability_hour_model.dart
 * Last modified: 2022.12.12
 * Author: Ditlou tsa Molongoana
 * App Name: The sixth sense
 * Copyright (c) 2022
 */

import 'dart:core';

import 'parents/model.dart';

class AvailabilityHour extends Model {
  String id;
  String day;
  String startAt;
  String endAt;
  String data;

  AvailabilityHour(this.id, this.day, this.startAt, this.endAt, this.data);

  AvailabilityHour.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    day = stringFromJson(json, 'day');
    startAt = stringFromJson(json, 'start_at');
    endAt = stringFromJson(json, 'end_at');
    data = transStringFromJson(json, 'data');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['day'] = this.day;
    data['start_at'] = this.startAt;
    data['end_at'] = this.endAt;
    data['data'] = this.data;
    return data;
  }
}
