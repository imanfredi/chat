import 'package:equatable/equatable.dart';

class Member extends Equatable {
  final String id;
  final String email;

  const Member({
    required this.id,
    required this.email,
  });

  @override
  List<Object?> get props => [id];
}
