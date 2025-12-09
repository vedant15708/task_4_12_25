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

  @action
  Future<void> loadEmployees() async {
    try {
      isLoading = true;
      final list = await repo.getEmployees();
      employees = ObservableList<EmployeeModel>.of(list);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }

  @observable
  String errorMessage = "";


  @action
  Future<void> deleteEmployee(String id) async {
    await repo.deleteEmployee(id);
    await loadEmployees();
  }
}
