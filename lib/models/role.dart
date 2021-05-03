class Role {
  final String id;
  final String role;
  final String description;
  Role({this.id, this.role, this.description});

  factory Role.fromJson(Map<dynamic, dynamic> json) {
    return Role(
        id: json['_id'], role: json['role'], description: json['description']);
  }
}
