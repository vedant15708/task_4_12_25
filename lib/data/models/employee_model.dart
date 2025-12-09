
class EmployeeModel {
  final String id;
  final String name;
  final String salary;
  final String age;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.salary,
    required this.age,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json["id"].toString(),
      name: json["employee_name"],
      salary: json["employee_salary"].toString(),
      age: json["employee_age"].toString(),
    );
  }
}
