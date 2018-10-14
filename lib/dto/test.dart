class Test {
  String name;
  TestInfo info;

  Test({this.name, this.info});

  factory Test.fromJson(Map<String, dynamic> data) {
    return Test(name: data['name'], info: TestInfo.fromJson(data['info']));
  }
}

class TestInfo {
  double age;

  TestInfo({this.age});

  factory TestInfo.fromJson(Map<String, dynamic> data) {
    return TestInfo(age: data['age']);
  }
}
