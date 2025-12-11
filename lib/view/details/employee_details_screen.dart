import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../stores/employee_store.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  final EmployeeStore store;

  EmployeeDetailsScreen({required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee Details", style: TextStyle(color: Colors.green)),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),

      body: Observer(
        builder: (_) {
          if (store.isDetailLoading)
            return Center(child: CircularProgressIndicator());

          if (store.errorMessage.isNotEmpty)
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, color: Colors.red, size: 40),
                  SizedBox(height: 10),
                  Text(store.errorMessage,
                      style: TextStyle(color: Colors.red)),
                ],
              ),
            );

          final emp = store.selectedEmployee;

          if (emp == null)
            return Center(child: Text("No employee found"));

          return Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailRow(title: "ID", value: emp.id),
                  DetailRow(title: "Name", value: emp.name),
                  DetailRow(title: "Salary", value: emp.salary),
                  DetailRow(title: "Age", value: emp.age),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


class DetailRow extends StatelessWidget {
  final String title;
  final String value;

  const DetailRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Text("$title:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(width: 10),
          Expanded(
              child: Text(value, style: TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
