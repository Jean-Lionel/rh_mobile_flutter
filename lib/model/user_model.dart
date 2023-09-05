class User {
  String? id;
  String? name;
  String? email;
  String? username;
  String? email_verified_at;
  String? created_at;
  String? updated_at;
  String? deleted_at;
  String? entreprise_id;
  String? photo;
  User.fromJosn(dynamic json)
      : this.id = json['user'] ?? "",
        this.name = json['name'],
        this.email = json['email'],
        this.username = json['username'],
        this.email_verified_at = json['email_verified_at'],
        this.created_at = json['created_at'],
        this.updated_at = json['updated_at'],
        this.deleted_at = json['deleted_at'],
        this.entreprise_id = json['entreprise_id'],
        this.photo = json['photo'];

  // User.fromJosn();
}
