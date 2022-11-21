class Token {
  final String refresh;
  final String access;

  const Token({
    required this.refresh,
    required this.access,
  });

  static Token fromJson(json) =>
      Token(
        refresh: json['refresh'],
        access: ('Token ${json['access']}'),
      );
}
