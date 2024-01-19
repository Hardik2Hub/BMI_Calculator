import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: emi(),
    debugShowCheckedModeBanner: false,
  ));
}

class emi extends StatefulWidget {
  @override
  State<emi> createState() => _emiState();
}

class _emiState extends State<emi> {
  double HomeLoanAmount = 0;
  double InterestRate = 5;
  double LoanTenure = 1;
  double LoanEMI = 0;
  double rate = 0;
  double r = 0;
  double n = 0;
  double year = 0;
  double amount = 0;
  double totl_intr = 0;
  double total_pay = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EMI Calculator"),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.all(10),
          color: Colors.blueGrey[50],
          child: Column(
            children: [
              Expanded(
                  child: Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                color: Colors.blueGrey,
                child: Text(
                    style: TextStyle(fontSize: 20),
                    "Home Loan Amount = ${HomeLoanAmount.toInt()}"),
              )),
              Expanded(
                  child: Container(
                color: Colors.blueGrey[50],
                child: Slider(
                  value: HomeLoanAmount,
                  min: 0,
                  max: 20000000,
                  divisions: 200,
                  secondaryTrackValue: HomeLoanAmount,
                  label: HomeLoanAmount.round().toString(),
                  onChanged: (double value) {
                    HomeLoanAmount = value;

                    amount = HomeLoanAmount;
                    n = year * 12;
                    r = rate / 12 / 100;
                    LoanEMI = (amount * r * pow((1 + r), n) / (pow((1 + r), n) - 1));
                    totl_intr = LoanEMI * n - HomeLoanAmount;
                    total_pay = HomeLoanAmount + totl_intr;
                    setState(() {});
                  },
                ),
              )),
              Expanded(
                  child: Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                color: Colors.blueGrey,
                child: Text(
                    style: TextStyle(fontSize: 20),
                    "Interest Rate = ${InterestRate.toInt()}"),
              )),
              Expanded(
                  child: Container(
                color: Colors.blueGrey[50],
                child: Slider(
                  value: InterestRate,
                  min: 5,
                  max: 20,
                  divisions: 15,
                  secondaryTrackValue: InterestRate,
                  label: InterestRate.round().toString(),
                  onChanged: (double value) {
                    InterestRate = value;
                    rate = InterestRate;
                    n = year * 12;
                    r = rate / 12 / 100;
                    LoanEMI =
                        (amount * r * pow((1 + r), n) / (pow((1 + r), n) - 1));
                    totl_intr = LoanEMI * n - HomeLoanAmount;
                    total_pay = HomeLoanAmount + totl_intr;
                    setState(() {});
                  },
                ),
              )),
              Expanded(
                  child: Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                color: Colors.blueGrey,
                child: Text(
                    style: TextStyle(fontSize: 20),
                    "Loan Tenure = ${LoanTenure.toInt()}"),
              )),
              Expanded(
                  child: Container(
                color: Colors.blueGrey[50],
                child: Slider(
                  value: LoanTenure,
                  min: 1,
                  max: 30,
                  divisions: 29,
                  secondaryTrackValue: LoanTenure,
                  label: LoanTenure.round().toString(),
                  onChanged: (double value) {
                    LoanTenure = value;
                    year = LoanTenure;
                    n = year * 12;
                    r = rate / 12 / 100;
                    LoanEMI =
                        (amount * r * pow((1 + r), n) / (pow((1 + r), n) - 1));
                    totl_intr = LoanEMI * n - HomeLoanAmount;
                    total_pay = HomeLoanAmount + totl_intr;
                    setState(() {});
                  },
                ),
              )),
              Expanded(
                  child: Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                color: Colors.blueGrey,
                child: Text(
                    style: TextStyle(fontSize: 20),
                    "Loan EMI = ${LoanEMI.toDouble().toStringAsFixed(0)}"),
              )),
              Expanded(
                  child: Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                color: Colors.blueGrey,
                child: Text(
                    style: TextStyle(fontSize: 20),
                    "Total Interest Payable = ${totl_intr.toStringAsFixed(0)}"),
                margin: EdgeInsets.only(top: 5, bottom: 5),
              )),
              Expanded(
                  child: Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                color: Colors.blueGrey,
                child: Text(
                    style: TextStyle(fontSize: 20),
                    "Total Payment = ${total_pay.toStringAsFixed(0)}"),
              )),
              Expanded(child: Container(color: Colors.blueGrey[50])),
            ],
          )),
    );
  }
}
