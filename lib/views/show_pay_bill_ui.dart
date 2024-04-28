// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';

class ShowPayBill extends StatefulWidget {
  //สร้างตัวแปรมารับค่าที่ส่งมาจากหน้าคิดเงิน
  String? adult;
  String? baby;
  int? water;
  String? coke;
  String? pure;
  String? memberType;
  double? toTalPay;
  File? imageFile;

  //รับค่าจากที่ส่งมาจาดหน้าคิดเงิน
  ShowPayBill({
    super.key,
    this.adult,
    this.baby,
    this.water,
    this.coke,
    this.pure,
    this.memberType,
    this.toTalPay,
    this.imageFile,
  });

  @override
  State<ShowPayBill> createState() => _ShowPayBillState();
}

class _ShowPayBillState extends State<ShowPayBill> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'ชำระเงิน',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              widget.imageFile == null
                  ? Image.asset(
                      'assets/images/camera.jpg',
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: MediaQuery.of(context).size.width * 0.35,
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      widget.imageFile!,
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: MediaQuery.of(context).size.width * 0.35,
                    ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text(
                'จำนวนคน',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.035,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ผู้ใหญ่  ',
                  ),
                  Text(
                    widget.adult!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      color: Colors.deepOrange,
                    ),
                  ),
                  Text(
                    '  คน',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'เด็ก  ',
                  ),
                  Text(
                    widget.baby!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      color: Colors.deepOrange,
                    ),
                  ),
                  Text(
                    '  คน',
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Text(
                'บุฟเฟต์น้ำดื่ม',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.035,
                ),
              ),
              Text(
                widget.water == 1 ? 'รับ' : 'ไม่รับ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  color: Colors.deepOrange,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'โค้ก จำนวน  ',
                  ),
                  Text(
                    widget.coke!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      color: Colors.deepOrange,
                    ),
                  ),
                  Text(
                    '  ขวด',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'น้ำเปล่าจำนวน  ',
                  ),
                  Text(
                    widget.pure!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      color: Colors.deepOrange,
                    ),
                  ),
                  Text(
                    '  ขวด',
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Text(
                'ประเภทสมาชิก',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.035),
              ),
              Text(
                widget.memberType!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  color: Colors.deepOrange,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Text(
                'รวมเป็นเงินทั้งสิ้น (บาท)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.035,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.125,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.amber[100],
                ),
                child: Text(
                  widget.toTalPay!.toStringAsFixed(2),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.05,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Image.asset(
                'assets/images/sauqr.png',
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.width * 0.35,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
