import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../models/models.dart';
import 'package:http/http.dart' as http;

part 'booking_service.dart';
part 'notification_service.dart';
part 'product_service.dart';
part 'registration_service.dart';

// String baseURL = 'http://10.12.4.163:8086/';
// String baseURL = 'http://ruangjuang.sdd.co.id:6062/'; //master
String baseURL = 'http://ruangjuang.sdd.co.id:6064/';