class TodoItem {
  int id;
  String name;
  String description;

  TodoItem({this.id, this.name, this.description});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  TodoItem.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    description = map['description'];
  }
}
