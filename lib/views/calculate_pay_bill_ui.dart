// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mukrata_sau_app/views/show_pay_bill_ui.dart';

class CalculatePayBillUI extends StatefulWidget {
  const CalculatePayBillUI({super.key});

  @override
  State<CalculatePayBillUI> createState() => _CalculatePayBillUIState();
}

class _CalculatePayBillUIState extends State<CalculatePayBillUI> {
//ตัวแปลดรอปดาว
  List<String> _memberType = [
    'ไม่เป็นสมาชิก',
    'สมาชิก Silver Member ลด 5%',
    'สมาชิก Gold Member ลด 10%',
    'สมาชิก Platinum Member ลด 20%',
  ];

//รายการทีี่เลือก
  String _memberTypeSelected = 'ไม่เป็นสมาชิก';

//ตัวแปรเก็บรูปที่ถ่าย
  File? _imageFromCamera;

//เมธอดเปิดกล้องแล้วถ่ายรูป
  Future getImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image == null) return;

    //เก็บรูปที่ถ่ายไว้ในตัวแปรที่สร้างไว้ก่อนหน้า
    setState(() {
      _imageFromCamera = File(image.path);
    });
  }

//สร้างตัวแปรเก็บสถานะผู้ใหญ่ และ เด็กว่าเลือกไม่เลือก
  bool adultStatus = false;
  bool babyStatus = false;

//สร้างตัวแปรสำหรับกรุ๊ป Value ของ Radio
  int waterStatus = 1;

  //สร้างตัวแปรควบคุม textField
  TextEditingController adultCtrl = TextEditingController(text: '0');
  TextEditingController babyCtrl = TextEditingController(text: '0');
  TextEditingController cokeCtrl = TextEditingController(text: '0');
  TextEditingController pureCtrl = TextEditingController(text: '0');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(50),
          child: Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    getImageFromCamera();
                  },
                  child: _imageFromCamera == null
                      ? Image.asset(
                          'assets/images/camera.jpg',
                          width: 140.0,
                          height: 140.0,
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          _imageFromCamera!,
                          width: 140.0,
                          height: 140.0,
                          fit: BoxFit.cover,
                        ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'จำนวนมนุษย์',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: adultStatus,
                      onChanged: (paramValue) {
                        setState(() {
                          adultStatus = adultStatus == true ? false : true;
                        });
                      },
                    ),
                    Text(
                      'ผู้ใหญ่ 299 บาท/คน จำนวน',
                    ),
                    Expanded(
                      child: TextField(
                        controller: adultCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Text(
                      'คน',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: babyStatus,
                      onChanged: (paramValue) {
                        setState(() {
                          babyStatus = babyStatus == true ? false : true;
                        });
                      },
                    ),
                    Text(
                      'เด็ก 69 บาท/คน จำนวน',
                    ),
                    Expanded(
                      child: TextField(
                        controller: babyCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Text(
                      'คน',
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'บุปเฟต์น้ำดื่ม',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: waterStatus,
                      onChanged: (paramValue) {
                        setState(() {
                          waterStatus = paramValue!;
                        });
                      },
                    ),
                    Text(
                      'รับ 25 บาท/หัว',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: waterStatus,
                      onChanged: (paramValue) {
                        setState(() {
                          waterStatus = paramValue!;
                        });
                      },
                    ),
                    Text(
                      'ไม่รับ',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '                 โค้ก 20 บาท/ขวด จำนวน',
                    ),
                    Expanded(
                      child: TextField(
                        controller: cokeCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Text(
                      'ขวด',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '                 น้ำเปล่า 15 บาท/ขวด จำนวน',
                    ),
                    Expanded(
                      child: TextField(
                        controller: pureCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Text(
                      'ขวด',
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ประเภทสมาชิก',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DropdownButton(
                  items: _memberType
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                            ),
                          ))
                      .toList(),
                  onChanged: (paramValue) {
                    setState(() {
                      _memberTypeSelected = paramValue!;
                    });
                  },
                  value: _memberTypeSelected,
                  isExpanded: true,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          //คิดผู้ใหญ่
                          double adultPay = adultStatus == false
                              ? 0
                              : (int.parse(adultCtrl.text) * 299);
                          //คิดเด็ก
                          double babyPay = babyStatus == false
                              ? 0
                              : (int.parse(babyCtrl.text) * 69);
                          //คิดน้ำดื่มบุฟเฟต์
                          double waterPay = waterStatus == 1
                              ? (int.parse(adultCtrl.text) +
                                      int.parse(babyCtrl.text)) *
                                  25
                              : 0;
                          //คิดโค้ก
                          double cokePay = int.parse(cokeCtrl.text) * 20;
                          //คิดน้ำเปล่า
                          double purePay = int.parse(pureCtrl.text) * 15;
                          //คำนวณราคาจ่ายพร้อมส่วนลด
                          //คำนวณเงินรวมก่อนลด
                          double totalPay = adultPay+babyPay+waterPay+cokePay+purePay;
                          //คำนวณส่วนลด
                          if (_memberTypeSelected=='ไม่เป็นสมาชิก'){
                            totalPay = totalPay;
                          }else if (_memberTypeSelected =='สมาชิก Silver Member ลด 5%'){
                            totalPay = totalPay - (totalPay* 5/100);
                          }else if (_memberTypeSelected == 'สมาชิก Gold Member ลด 10%'){
                            totalPay = totalPay - (totalPay*10/100);
                          }else{
                            totalPay = totalPay - (totalPay*20/100);
                          }

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>ShowPayBill(
                              adult: adultCtrl.text,
                              baby: babyCtrl.text,
                              water: waterStatus,
                              coke: cokeCtrl.text,
                              pure: pureCtrl.text,
                              memberType: _memberTypeSelected,
                              toTalPay: totalPay,
                              imageFile: _imageFromCamera,
                            ),)
                          );
                        },
                        icon: Icon(
                          FontAwesomeIcons.calculator,
                          color: Colors.white,
                        ),
                        label: Text(
                          'คำนวนเงิน',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 255, 85, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          fixedSize: Size(
                            double.infinity,
                            55.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.white,
                        ),
                        label: Text(
                          'ยกเลิก',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 110, 110, 113),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          fixedSize: Size(
                            double.infinity,
                            55.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
