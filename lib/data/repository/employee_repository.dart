import 'package:dio/dio.dart';
import '../../core/network/dio_client.dart';
import '../models/employee_model.dart';

class EmployeeRepository {
  final dio = DioClient.dio;

  Future<List<EmployeeModel>> getEmployees() async {
    try {
      final res = await dio.get("employees");

      if (res.statusCode == 200) {
        return (res.data["data"] as List)
            .map((e) => EmployeeModel.fromJson(e))
            .toList();
      } else {
        throw Exception("Failed to load employees");
      }
    } catch (e) {
      throw Exception("API Error: $e");
    }
  }

  Future<void> deleteEmployee(String id) async {
    try {
      final res = await dio.delete("delete/$id");

      if (res.statusCode != 200) {
        throw Exception("Failed to delete employee");
      }
    } catch (e) {
      throw Exception("API Error: $e");
    }
  }

  Future<void> addEmployee(Map<String, String> body) async {
    try {
      final res = await dio.post("create", data: body);

      if (res.statusCode != 200) {
        throw Exception("Failed to add employee");
      }
    } catch (e) {
      throw Exception("API Error: $e");
    }
  }

  Future<void> updateEmployee(String id, Map<String, String> body) async {
    try {
      final res = await dio.put("update/$id", data: body);

      if (res.statusCode != 200) {
        throw Exception("Failed to update employee");
      }
    } catch (e) {
      throw Exception("API Error: $e");
    }
  }

  Future<EmployeeModel> getEmployeeById(String id) async {
    try {
      final res = await dio.get("employee/$id");

      if (res.statusCode == 200) {
        return EmployeeModel.fromJson(res.data["data"]);
      } else {
        throw Exception("Failed to load employee details");
      }
    } catch (e) {
      throw Exception("API Error: $e");
    }
  }

}
