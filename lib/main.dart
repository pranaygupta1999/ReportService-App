/**
 * @author Pranay Gupta
 * @description The flutter app to see all the errors of a particular customer
 * @created 31 Oct 2019
 */
import 'package:flutter/material.dart';
import './login.dart';

void main() => runApp(ReportService());

class ReportService extends StatefulWidget {
  @override
  State<ReportService> createState() {
    return _ReportServiceState(LoginScreen());
  }
}

class _ReportServiceState extends State<ReportService> {
  Widget homeWidget;
  _ReportServiceState(this.homeWidget);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Report Service",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: homeWidget,
    );
  }
}
