import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:vadvisory_smartboard/cubits/advisory/advisory_cubit.dart';
import 'package:vadvisory_smartboard/cubits/device/device_cubit.dart';
import 'package:vadvisory_smartboard/extensions/extensions.dart';
import 'package:vadvisory_smartboard/models/models.dart';
import 'package:vadvisory_smartboard/ui/widgets/widgets.dart';

import '../../cubits/advisory/advisory_detail_cubit.dart';
import '../../cubits/branch/branch_cubit.dart';
import '../../cubits/notification/notification_cubit.dart';
import '../../cubits/region/region_cubit.dart';
import '../../cubits/rm/rm_cubit.dart';
import '../../shared/shared.dart';

part 'home_page.dart';
part 'product_detail_page.dart';
part 'product_page.dart';
part 'detail_rm_page.dart';
part 'device_registration_page.dart';