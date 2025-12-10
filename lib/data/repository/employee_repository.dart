import 'package:dio/dio.dart';
import '../../core/network/dio_client.dart';
import '../../core/network/connectivity_service.dart';
import '../models/employee_model.dart';

class EmployeeRepository {
  final dio = DioClient.dio;
  Future<List<EmployeeModel>> getEmployees() async {
    if (!await ConnectivityService.hasInternet()) {
      throw Exception("No internet connection. Please check your network.");
    }

    try {
      final res = await dio.get("employees");

      if (res.statusCode == 200) {
        return (res.data["data"] as List)
            .map((e) => EmployeeModel.fromJson(e))
            .toList();
      } else {
        throw Exception("Failed to load employees");
      }

    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception("Request timed out. Please try again.");
      }
      throw Exception("Network error: ${e.message}");
    }
  }

  Future<EmployeeModel> getEmployeeById(String id) async {
    if (!await ConnectivityService.hasInternet()) {
      throw Exception("No internet connection. Please check your network.");
    }

    try {
      final res = await dio.get("employee/$id");

      if (res.statusCode == 200) {
        return EmployeeModel.fromJson(res.data["data"]);
      } else {
        throw Exception("Failed to load employee details");
      }

    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception("Request timed out. Please try again.");
      }
      throw Exception("Network error: ${e.message}");
    }
  }

  Future<void> addEmployee(Map<String, String> body) async {
    if (!await ConnectivityService.hasInternet()) {
      throw Exception("No internet connection. Please check your network.");
    }

    try {
      final res = await dio.post("create", data: body);

      if (res.statusCode != 200) {
        throw Exception("Failed to add employee.");
      }

    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception("Request timed out. Please try again.");
      }
      throw Exception("Network error: ${e.message}");
    }
  }

  Future<void> updateEmployee(String id, Map<String, String> body) async {
    if (!await ConnectivityService.hasInternet()) {
      throw Exception("No internet connection. Please check your network.");
    }

    try {
      final res = await dio.put("update/$id", data: body);

      if (res.statusCode != 200) {
        throw Exception("Failed to update employee.");
      }

    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception("Request timed out. Please try again.");
      }
      throw Exception("Network error: ${e.message}");
    }
  }


  Future<void> deleteEmployee(String id) async {
    if (!await ConnectivityService.hasInternet()) {
      throw Exception("No internet connection. Please check your network.");
    }

    try {
      final res = await dio.delete("delete/$id");

      if (res.statusCode != 200) {
        throw Exception("Failed to delete employee.");
      }

    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception("Request timed out. Please try again.");
      }
      throw Exception("Network error: ${e.message}");
    }
  }
}
