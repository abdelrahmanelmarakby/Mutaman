import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mutaman/models/doctor.dart';

Future<List<Doctor>> getdata() async {
  final response = await http.get('http://192.168.1.3/Mutaman/index.php');
  if (response.statusCode == 200) {
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Doctor>((i) => Doctor.fromJson(i)).toList();
  }
}
