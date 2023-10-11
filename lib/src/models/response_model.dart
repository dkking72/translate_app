class ResponseModel {
  final bool status;
  final String message;
  final dynamic data;

  bool get isSuccess => status;

  bool get isFailed => !status;

  bool get hasData => data != null;

  dynamic get r => hasData ? (data['data'] ?? []) : [];

  List<T> list<T>(T f(x)) => List<T>.from(r.map(f));

  ResponseModel({
    this.status = false,
    this.message = "",
    this.data = const {},
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      status: json['status'] == 200 ? true : false,
      message: json['message'] ?? "",
      data: json['data'] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        's': status ? 200 : 0,
        'm': message,
        'r': data ?? "",
      };
}
