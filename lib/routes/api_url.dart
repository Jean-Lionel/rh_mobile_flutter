const IP_ADDRESS = "http://10.250.1.75:8000/api/";

Uri makeUrl(String url) {
  String full_url = IP_ADDRESS + url;
  return Uri.parse(full_url);
}

final loginUrl = makeUrl("login");
