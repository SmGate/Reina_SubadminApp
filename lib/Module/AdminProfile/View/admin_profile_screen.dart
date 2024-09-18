import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:societyadminapp/utils/Constants/api_routes.dart';
import 'package:societyadminapp/Module/AdminProfile/Controller/profile_controller.dart';
import '../../../utils/Constants/constants.dart';

class AdminProfileScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: primaryColor,
            appBar: AppBar(
              title: Text('Admin Profile'),
              automaticallyImplyLeading: false,
              backgroundColor: primaryColor,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Container(
                          child: Image(
                            image: NetworkImage(
                              Api.imageBaseUrl + controller.user.image!,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                        height: 350,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                controller.user.firstName! +
                                    " " +
                                    controller.user.lastName!,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),

                              Text(
                                'Address',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Text(
                                controller.user.address!,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),

                              // Text(
                              //   controller.user.mobileno!,
                              //   style: TextStyle(
                              //     fontSize: 18.0,
                              //     fontWeight: FontWeight.normal,
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 20,
                              // ),
                              Text(
                                'CNIC',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                controller.user.cnic!,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          );
        });
  }
}
