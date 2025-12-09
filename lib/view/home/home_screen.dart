import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../stores/employee_store.dart';
import '../add_employee/add_employee_screen.dart';
import '../widgets/employee_card.dart';

class HomeScreen extends StatelessWidget {
  final store = EmployeeStore();

  HomeScreen({super.key}) {
    store.loadEmployees();
  }

  void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Manage Employees",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),

      body: Observer(
        builder: (_) {
          if (store.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          // ERROR UI
          if (store.errorMessage.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, color: Colors.red, size: 40),
                  SizedBox(height: 10),
                  Text(
                    store.errorMessage,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => store.loadEmployees(),
                    child: Text("Retry"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  )
                ],
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: store.employees.length,
            itemBuilder: (context, index) {
              final emp = store.employees[index];

              return EmployeeCard(
                employee: emp,
                isSelected: index == 0,
                onDelete: () async {
                  try {
                    await store.deleteEmployee(emp.id);
                  } catch (e) {
                    showError(context, e.toString());
                  }
                },
                onEdit: () async {
                  final updated = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AddEmployeeScreen(editEmployee: emp),
                    ),
                  );

                  if (updated == true) {
                    try {
                      await store.loadEmployees();
                    } catch (e) {
                      showError(context, e.toString());
                    }
                  }
                },
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () async {
          final added = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddEmployeeScreen()),
          );

          if (added == true) {
            try {
              await store.loadEmployees();
            } catch (e) {
              showError(context, e.toString());
            }
          }
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
