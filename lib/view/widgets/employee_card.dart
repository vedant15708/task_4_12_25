import 'package:flutter/material.dart';
import '../../data/models/employee_model.dart';

class EmployeeCard extends StatelessWidget {
  final EmployeeModel employee;
  final bool isSelected;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback? onTap;

  const EmployeeCard({
    required this.employee,
    required this.isSelected,
    required this.onDelete,
    required this.onEdit,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: 2,
        margin: EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    isSelected
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
                    color: isSelected ? Colors.green : Colors.grey,
                    size: 22,
                  ),
                  SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${employee.name}  (ID: ${employee.id})",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                        SizedBox(height: 4),
                        Text("Salary: ${employee.salary}   Age: ${employee.age}",
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12),

              Divider(),

              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: onDelete,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.delete_outline, color: Colors.red),
                            SizedBox(width: 6),
                            Text("Delete",
                                style:
                                TextStyle(color: Colors.red, fontSize: 14)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  VerticalDivider(width: 1),
                  Expanded(
                    child: InkWell(
                      onTap: onEdit,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.edit_outlined, color: Colors.black),
                            SizedBox(width: 6),
                            Text("Change",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
