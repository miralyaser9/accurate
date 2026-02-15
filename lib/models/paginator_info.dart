class PaginatorInfo {
  final int count;
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;

  PaginatorInfo({
    required this.count,
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
  });

  factory PaginatorInfo.fromJson(Map<String, dynamic> json) {
    return PaginatorInfo(
      count: json['count'] ?? 0,
      currentPage: json['currentPage'] ?? 0,
      lastPage: json['lastPage'] ?? 0,
      perPage: json['perPage'] ?? 0,
      total: json['total'] ?? 0,
    );
  }
}
