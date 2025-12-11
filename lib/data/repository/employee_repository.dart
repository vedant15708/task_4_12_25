import 'package:dio/dio.dart';
import '../../core/network/dio_client.dart';
import '../../core/network/connectivity_service.dart';
import '../models/employee_model.dart';

class EmployeeRepository {
  final dio = DioClient.dio;
  Future<List<EmployeeModel>> getEmployees() async {
    await _checkInternet();

    try {
      final res = await dio.get("employees");

      if (res.statusCode == 200 && res.data["data"] is List) {
        return (res.data["data"] as List)
            .map((e) => EmployeeModel.fromJson(e))
            .toList();
      } else {
        throw Exception("Failed to load employees");
      }

    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<EmployeeModel> getEmployeeById(String id) async {
    await _checkInternet();

    try {
      final res = await dio.get("employee/$id");

      if (res.statusCode == 200 && res.data["data"] != null) {
        return EmployeeModel.fromJson(res.data["data"]);
      } else {
        throw Exception("Failed to load employee details");
      }

    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> addEmployee(Map<String, dynamic> body) async {
    await _checkInternet();

    try {
      final res = await dio.post("create", data: body);

      if (res.statusCode != 200) {
        throw Exception("Failed to add employee.");
      }

    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> updateEmployee(String id, Map<String, dynamic> body) async {
    await _checkInternet();

    try {
      final res = await dio.put("update/$id", data: body);

      if (res.statusCode != 200) {
        throw Exception("Failed to update employee.");
      }

    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> deleteEmployee(String id) async {
    await _checkInternet();

    try {
      final res = await dio.delete("delete/$id");

      if (res.statusCode != 200) {
        throw Exception("Failed to delete employee.");
      }

    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> _checkInternet() async {
    if (!await ConnectivityService.hasInternet()) {
      throw Exception("No internet connection. Please check your network.");
    }
  }

  Exception _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return Exception("Request timed out. Please try again.");
    }

    return Exception("Network error: ${e.message}");
  }
}
