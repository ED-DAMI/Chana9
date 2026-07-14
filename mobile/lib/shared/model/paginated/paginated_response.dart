class PaginatedResponse<T> {
  final List<T> content;
  final int totalElements;
  final int totalPages;
  final int number;
  final int size;
  final bool first;
  final bool last;

  const PaginatedResponse({
    required this.content,
    required this.totalElements,
    required this.totalPages,
    required this.number,
    required this.size,
    required this.first,
    required this.last,
  });

  factory PaginatedResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object?) fromJsonT,
      ) {
    return PaginatedResponse(
      content: (json['content'] as List).map(fromJsonT).toList(),
      totalElements: (json['totalElements'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      number: (json['number'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      first: json['first'] as bool,
      last: json['last'] as bool,
    );
  }

  PaginatedResponse<R> map<R>(R Function(T) mapper) {
    return PaginatedResponse<R>(
      content: content.map(mapper).toList(),
      totalElements: totalElements,
      totalPages: totalPages,
      number: number,
      size: size,
      first: first,
      last: last,
    );
  }

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return {
      'content': content.map(toJsonT).toList(),
      'totalElements': totalElements,
      'totalPages': totalPages,
      'number': number,
      'size': size,
      'first': first,
      'last': last,
    };
  }
}