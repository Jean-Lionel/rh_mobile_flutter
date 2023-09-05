class Presence {
  DateTime? date_in;
  DateTime? date_out;
  DateTime? created_at;
  DateTime? updated_at;

  Presence({
    this.date_in,
    this.date_out,
    this.created_at,
    this.updated_at,
  });

  Presence.fromJosn(Map<String, dynamic> json)
      : date_in = json['date_in'],
        date_out = json['date_out'],
        created_at = json['created_at'],
        updated_at = json['updated_at'];
}
