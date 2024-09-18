// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:societyadminapp/Widgets/loading.dart';
import 'package:societyadminapp/Widgets/my_back_button.dart';

import '../../../Routes/set_routes.dart';
import '../Controller/generated_house_bill_controller.dart';

class GeneratedHouseBill extends StatelessWidget {
  const GeneratedHouseBill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<GeneratedHouseBillController>(
          init: GeneratedHouseBillController(),
          builder: (controller) {
            return WillPopScope(
              onWillPop: () async {
                await Get.offNamed(bills, arguments: controller.user);

                return true;
              },
              child: Scaffold(
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'House Bills',
                        onTap: () {
                          Get.offNamed(bills, arguments: controller.user);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: FutureBuilder(
                            future: controller.generatedHouseBillApi(
                                controller.user.userid!,
                                controller.user.bearerToken!),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DataTable(
                                      dataRowHeight: 40,
                                      columnSpacing: 10,
                                      // dataTextStyle: TextStyle(fontSize: 14,color: Colors.black),
                                      border: TableBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      columns: [
                                        DataColumn(
                                            label: Text(
                                          'Name',
                                        )),
                                        DataColumn(label: Text('DueDate')),
                                        DataColumn(label: Text('Charges')),
                                        DataColumn(label: Text('Status')),
                                        DataColumn(label: Text('info')),
                                      ],
                                      rows:
                                          (snapshot.data.data as List).map((e) {
                                        return DataRow(cells: [
                                          DataCell(Text(
                                              '${e.user.first.firstname}${' '}${e.user.first.lastname}')),
                                          DataCell(Text(e.duedate.toString())),
                                          DataCell(
                                              Text(e.payableamount.toString())),
                                          DataCell(e.status == 0
                                              ? BillStatusWidget(
                                                  text: 'unpaid',
                                                  color: Colors.amber,
                                                )
                                              : e.status == 1
                                                  ? BillStatusWidget(
                                                      text: 'paid',
                                                      color: Colors.green,
                                                    )
                                                  : e.status == 2
                                                      ? BillStatusWidget(
                                                          text: 'late',
                                                          color: Colors.red,
                                                        )
                                                      : Container()),
                                          DataCell(IconButton(
                                            icon: Icon(Icons.info),
                                            onPressed: () {},
                                          )),
                                        ]);
                                      }).toList()),
                                );
                              } else if (snapshot.hasError) {
                                return Icon(Icons.error_outline);
                              } else {
                                return CircularIndicatorUnderWhiteBox();
                              }
                            }),
                      ),
                    ],
                  ),
                  floatingActionButton: IconButton(
                      padding: EdgeInsets.only(top: 85),
                      iconSize: MediaQuery.of(context).size.height * 0.065,
                      icon: SvgPicture.asset('assets/floatingbutton.svg'),
                      onPressed: () {
                        Get.offAndToNamed(generatehousebills,
                            arguments: controller.user);
                      })),
            );
          }),
    );
  }
}

class BillStatusWidget extends StatelessWidget {
  final String? text;
  final Color? color;

  BillStatusWidget({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.05,
        child: Center(
            child: Text(
          text.toString(),
          style: GoogleFonts.montserrat(
              color: Colors.white, fontWeight: FontWeight.w500),
        )),
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
