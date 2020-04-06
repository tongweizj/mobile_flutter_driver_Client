class CommCode {
  const CommCode({
    this.code101,
    this.code102,
    this.code103,
    this.code104,
  });

  final String code101;
  final String code102;
  final String code103;
  final String code104;
}

final List<CommCode> commCode = [
  CommCode(
    code101: 'login Success',
    code102: 'err 102, no such user!',
    code103: 'err 103, password error',
    code104: 'err 104, other errors!',
  ),
];