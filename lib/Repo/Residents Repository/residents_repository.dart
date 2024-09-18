// import 'dart:convert';
// import 'dart:developer';
// import '../../Constants/api_routes.dart';
// import '../../Module/View Residents/Model/Resident.dart';
// import '../../Services/Network Services/network_services.dart';
// import 'package:http/http.dart' as Http;

// class ResidentsRepository {
//   final networkServices = NetworkServices();

//   // Future<Resident> residentGetApi(
//   //     {required subAdminId, required bearerToken}) async {
//   //   var response = await networkServices
//   //       .getReq("${Api.viewResidents}/$subAdminId", bearerToken: bearerToken);

//   //   return Resident.fromJson(response);
//   // }

//   Future<Resident> residentGetApi(
//       {required subAdminId, required bearerToken}) async {
//     final response = await Http.get(
//       Uri.parse(Api.viewResidents + "/" + subAdminId.toString()),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Authorization': "Bearer $bearerToken"
//       },
//     );
//     print(response.statusCode);
//     print(response.body.toString());

//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body);
//       return Resident.fromJson(jsonData);
//     } else {
//       throw Exception('Failed to fetch data');
//     }
//   }
// }
