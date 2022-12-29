import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_model.dart';

late SharedPreferences sharedPreferences;
User? user;


//
// Position? position;
// List<Placemark>? placeMarks;
String completeAddress = "";

String perParcelDeliveryAmount = "";

String previousEarnings = ""; //this is previous seller earnings

String previousRiderEarnings = ""; // this is previous rider earnings
