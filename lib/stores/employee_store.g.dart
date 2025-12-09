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

  late final _$loadEmployeesAsyncAction = AsyncAction(
    '_EmployeeStore.loadEmployees',
    context: context,
  );

  @override
  Future<void> loadEmployees() {
    return _$loadEmployeesAsyncAction.run(() => super.loadEmployees());
  }

  late final _$deleteEmployeeAsyncAction = AsyncAction(
    '_EmployeeStore.deleteEmployee',
    context: context,
  );

  @override
  Future<void> deleteEmployee(String id) {
    return _$deleteEmployeeAsyncAction.run(() => super.deleteEmployee(id));
  }

  @override
  String toString() {
    return '''
employees: ${employees},
isLoading: ${isLoading}
    ''';
  }
}
