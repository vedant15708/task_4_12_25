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
  bool isDetailLoading = false;


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
  Future<void> getEmployeeDetails(String id) async {
    try {
      isDetailLoading = true;
      errorMessage = "";

      selectedEmployee = await repo.getEmployeeById(id);

    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isDetailLoading = false;
    }
  }

  @action
  Future<void> deleteEmployee(String id) async {
    try {
      await repo.deleteEmployee(id);
      await loadEmployees();
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  @action
  Future<bool> addEmployee(Map<String, dynamic> body) async {
    try {
      isLoading = true;
      errorMessage = "";
      await repo.addEmployee(body);
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<bool> updateEmployee(String id, Map<String, dynamic> body) async {
    try {
      isLoading = true;
      errorMessage = "";
      await repo.updateEmployee(id, body);
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isLoading = false;
    }
  }
}
