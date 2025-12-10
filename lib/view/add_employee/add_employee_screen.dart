import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../stores/employee_store.dart';
import '../../data/models/employee_model.dart';

class AddEmployeeScreen extends StatefulWidget {
  final EmployeeModel? editEmployee;

  AddEmployeeScreen({this.editEmployee});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();
  final EmployeeStore store = EmployeeStore();

  final idCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final salaryCtrl = TextEditingController();
  final ageCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.editEmployee != null) {
      idCtrl.text = widget.editEmployee!.id;
      nameCtrl.text = widget.editEmployee!.name;
      salaryCtrl.text = widget.editEmployee!.salary;
      ageCtrl.text = widget.editEmployee!.age;
    }
  }

  void showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.editEmployee != null;

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          isEdit ? "Edit Employee" : "Add Employee",
          style: TextStyle(
            color: Color(0xFF27AE60),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Observer(
        builder: (_) {
          return Stack(
            children: [
              _buildForm(context, isEdit),

              if (store.isLoading)
                Container(
                  color: Colors.black.withOpacity(0.2),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
            ],
          );
        },
      ),
    );
  }

  Widget _buildForm(BuildContext context, bool isEdit) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildInputField(
                idCtrl,
                "Employee ID",
                icon: Icons.badge,
                readOnly: isEdit,
              ),

              SizedBox(height: 15),
              _buildInputField(
                nameCtrl,
                "Employee Name",
                icon: Icons.person,
              ),

              SizedBox(height: 15),
              _buildInputField(
                salaryCtrl,
                "Salary",
                icon: Icons.attach_money,
                keyboard: TextInputType.number,
              ),

              SizedBox(height: 15),
              _buildInputField(
                ageCtrl,
                "Age",
                icon: Icons.calendar_today,
                keyboard: TextInputType.number,
              ),

              SizedBox(height: 40),
              _buildSaveButton(isEdit)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSaveButton(bool isEdit) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF27AE60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () async {
          final body = {
            "name": nameCtrl.text.trim(),
            "salary": salaryCtrl.text.trim(),
            "age": ageCtrl.text.trim(),
          };

          bool success = false;

          if (isEdit) {
            success = await store.updateEmployee(idCtrl.text.trim(), body);
          } else {
            success = await store.addEmployee(body);
          }

          if (success) {
            showSuccess(isEdit
                ? "Employee updated successfully!"
                : "Employee added successfully!");

            Navigator.pop(context, true);
          } else {
            showError(store.errorMessage);
          }
        },
        child: Text(
          isEdit ? "Update" : "Save",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
      TextEditingController controller,
      String hint, {
        IconData? icon,
        bool readOnly = false,
        TextInputType keyboard = TextInputType.text,
      }) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        keyboardType: keyboard,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: icon != null ? Icon(icon, color: Colors.grey) : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        ),
      ),
    );
  }
}
