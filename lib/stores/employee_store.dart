import 'package:mobx/mobx.dart';
import '../data/models/employee_model.dart';
import '../data/repository/employee_repository.dart';

part 'employee_store.g.dart';

class EmployeeStore = _EmployeeStore with _$EmployeeStore;

abstract class _EmployeeStore with Store {
  final repo = EmployeeRepository();

  @observable
  ObservableList<EmployeeModel> employees = ObservableList<EmployeeModel>();

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = "";

  @observable
  EmployeeModel? selectedEmployee;


  @action
  Future<void> loadEmployees() async {
    try {
      isLoading = true;
      errorMessage = "";

      final list = await repo.getEmployees();
      employees = ObservableList<EmployeeModel>.of(list);

    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }


  @action
  Future<void> deleteEmployee(String id) async {
    try {
      isLoading = true;
      await repo.deleteEmployee(id);
      await loadEmployees();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<bool> addEmployee(Map<String, String> data) async {
    try {
      isLoading = true;
      await repo.addEmployee(data);
      await loadEmployees();
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<bool> updateEmployee(String id, Map<String, String> data) async {
    try {
      isLoading = true;
      await repo.updateEmployee(id, data);
      await loadEmployees();
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isLoading = false;
    }
  }


  @action
  Future<EmployeeModel?> getEmployeeDetails(String id) async {
    try {
      isLoading = true;
      errorMessage = "";

      selectedEmployee = await repo.getEmployeeById(id);
      return selectedEmployee;

    } catch (e) {
      errorMessage = e.toString();
      return null;
    } finally {
      isLoading = false;
    }
  }
}
