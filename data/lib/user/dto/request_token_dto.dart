class RequestToken {
  final String? refresh;
  final String? access;

  const RequestToken({required this.refresh, required this.access});

  static RequestToken fromJson(json) => RequestToken(
    refresh: json['refresh'],
    access: json['access'],
  );
}