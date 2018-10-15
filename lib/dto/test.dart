class Test {
  String name;
  TestInfo info;
  List<TestRecord> records;

  Test({this.name, this.info, this.records});

  factory Test.fromJson(Map<String, dynamic> data) {
    return Test(
      name: data['name'],
      info: TestInfo.fromJson(data['info']),
      records: (data['records'] as List).map((item) => TestRecord.fromJson(item)).toList()
    );
  }
}

class TestInfo {
  int age;

  TestInfo({this.age});

  factory TestInfo.fromJson(Map<String, dynamic> data) {
    return TestInfo(age: data['age']);
  }
}

class TestRecord {
  String id;
  String time;
  TestRecord({this.id, this.time});

  factory TestRecord.fromJson(Map<String, dynamic> data) {
    return TestRecord(id: data['id'], time: data['time']);
  }
}
