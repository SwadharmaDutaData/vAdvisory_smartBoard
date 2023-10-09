import 'dart:async';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:vadvisory_smartboard/cubits/advisory/advisory_cubit.dart';
import 'package:vadvisory_smartboard/firebase_options.dart';
import 'package:vadvisory_smartboard/screenutil/screenutil.dart';
import 'package:vadvisory_smartboard/shared/shared.dart';
import 'package:vadvisory_smartboard/ui/pages/pages.dart';

import 'cubits/advisory/advisory_detail_cubit.dart';
import 'cubits/booking/booking_cubit.dart';
import 'cubits/branch/branch_cubit.dart';
import 'cubits/device/device_cubit.dart';
import 'cubits/notification/notification_cubit.dart';
import 'cubits/product/product_cubit.dart';
import 'cubits/region/region_cubit.dart';
import 'cubits/rm/rm_cubit.dart';

final _storage = LocalStorage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]));
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  String? isRegistered = await _storage.readValue('isRegistered');

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(MyApp(
    isRegistered: isRegistered,
  ));
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  final String? isRegistered;

  const MyApp({Key? key, this.isRegistered}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BookingCubit()),
        BlocProvider(create: (_) => AdvisoryCubit()),
        BlocProvider(create: (_) => AdvisoryDetailCubit()),
        BlocProvider(create: (_) => NotificationCubit()),
        BlocProvider(create: (_) => RegionCubit()),
        BlocProvider(create: (_) => BranchCubit()),
        BlocProvider(create: (_) => ProductCubit()),
        BlocProvider(create: (_) => DeviceCubit()),
        BlocProvider(create: (_) => RmCubit()),
      ],
      child: GetMaterialApp(
        title: 'Virtual Advisory Smart Screen',
        home: (isRegistered == "false" || isRegistered == null)
            ? const DeviceRegistrationPage()
            : HomePage(),
        // const LoginPage(),
        // const WelcomePage(),
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: thirdColor, // Your accent color
            ),
            primaryColor: borderGrey,
            primarySwatch: MaterialColor(0xFF006181, color)),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class DummyPage extends StatefulWidget {
  const DummyPage({Key? key}) : super(key: key);

  @override
  _DummyPageState createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  String token =
      'evjoXzrISEyUnC6Dratbmn:APA91bH7RDLdFvOq_rRooIldIV780NSr7dx1x44pdcTP0OYJxMKWM8WQ4zoNrqDpImH9lo_9CugLUIAREsG9yiSc_ZcU0ZfMGUmM3K37AM97cZ3C238LNkfVat8mY717J72GpmHZWT8K';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              await context
                  .read<NotificationCubit>()
                  .pushNotification('Test', 'Fathan', token);
              NotificationState state = context.read<NotificationCubit>().state;
            } catch (e) {
              log('errornya $e');
            }
          },
          child: Text('test token'),
        ),
      ),
    );
  }
}
