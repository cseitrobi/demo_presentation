class Employee {
  String name;
  int id;
  String position;

  Employee(this.name, this.id, this.position);

  @override
  String toString() {
    return 'Employee{name: $name, id: $id, position: $position}';
  }
}

List<Employee> generateEmployeeList() {
  List<Employee> employeeList = [];

  for (int i = 1; i <= 50; i++) {
    String name = 'Employee$i';
    int id = i;
    String position = 'Position$i';

    Employee employee = Employee(name, id, position);
    employeeList.add(employee);
  }

  return employeeList;
}
