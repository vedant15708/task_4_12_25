// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EmployeeStore on _EmployeeStore, Store {
  late final _$employeesAtom = Atom(
    name: '_EmployeeStore.employees',
    context: context,
  );

  @override
  ObservableList<EmployeeModel> get employees {
    _$employeesAtom.reportRead();
    return super.employees;
  }

  @override
  set employees(ObservableList<EmployeeModel> value) {
    _$employeesAtom.reportWrite(value, super.employees, () {
      super.employees = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_EmployeeStore.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isDetailLoadingAtom = Atom(
    name: '_EmployeeStore.isDetailLoading',
    context: context,
  );

  @override
  bool get isDetailLoading {
    _$isDetailLoadingAtom.reportRead();
    return super.isDetailLoading;
  }

  @override
  set isDetailLoading(bool value) {
    _$isDetailLoadingAtom.reportWrite(value, super.isDetailLoading, () {
      super.isDetailLoading = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: '_EmployeeStore.errorMessage',
    context: context,
  );

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$selectedEmployeeAtom = Atom(
    name: '_EmployeeStore.selectedEmployee',
    context: context,
  );

  @override
  EmployeeModel? get selectedEmployee {
    _$selectedEmployeeAtom.reportRead();
    return super.selectedEmployee;
  }

  @override
  set selectedEmployee(EmployeeModel? value) {
    _$selectedEmployeeAtom.reportWrite(value, super.selectedEmployee, () {
      super.selectedEmployee = value;
    });
  }

  late final _$loadEmployeesAsyncAction = AsyncAction(
    '_EmployeeStore.loadEmployees',
    context: context,
  );

  @override
  Future<void> loadEmployees() {
    return _$loadEmployeesAsyncAction.run(() => super.loadEmployees());
  }

  late final _$getEmployeeDetailsAsyncAction = AsyncAction(
    '_EmployeeStore.getEmployeeDetails',
    context: context,
  );

  @override
  Future<void> getEmployeeDetails(String id) {
    return _$getEmployeeDetailsAsyncAction.run(
      () => super.getEmployeeDetails(id),
    );
  }

  late final _$deleteEmployeeAsyncAction = AsyncAction(
    '_EmployeeStore.deleteEmployee',
    context: context,
  );

  @override
  Future<void> deleteEmployee(String id) {
    return _$deleteEmployeeAsyncAction.run(() => super.deleteEmployee(id));
  }

  late final _$addEmployeeAsyncAction = AsyncAction(
    '_EmployeeStore.addEmployee',
    context: context,
  );

  @override
  Future<bool> addEmployee(Map<String, dynamic> body) {
    return _$addEmployeeAsyncAction.run(() => super.addEmployee(body));
  }

  late final _$updateEmployeeAsyncAction = AsyncAction(
    '_EmployeeStore.updateEmployee',
    context: context,
  );

  @override
  Future<bool> updateEmployee(String id, Map<String, dynamic> body) {
    return _$updateEmployeeAsyncAction.run(
      () => super.updateEmployee(id, body),
    );
  }

  @override
  String toString() {
    return '''
employees: ${employees},
isLoading: ${isLoading},
isDetailLoading: ${isDetailLoading},
errorMessage: ${errorMessage},
selectedEmployee: ${selectedEmployee}
    ''';
  }
}
