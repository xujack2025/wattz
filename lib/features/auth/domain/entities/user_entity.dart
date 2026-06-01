import 'package:equatable/equatable.dart';

enum UserStatus { active, suspended, blocked }

enum UserRole { customer, admin }

abstract class UserEntity extends Equatable {
  final String id;
  final String email;
  final String name;
  final String phoneNumber;
  final UserStatus status;
  final UserRole role;

  const UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.status,
    required this.role,
  });

  @override
  List<Object?> get props => [id, name, email, phoneNumber, status, role];
}

class CustomerEntity extends UserEntity {
  final int balanceInCents;

  const CustomerEntity({
    required super.id,
    required super.name,
    required super.email,
    required super.phoneNumber,
    super.status = UserStatus.active,
    super.role = UserRole.customer,
    this.balanceInCents = 0,
  }) : assert(balanceInCents >= 0);

  double getBalance() => balanceInCents / 100.0;

  CustomerEntity topUp(int amountInCents) {
    if (amountInCents <= 0) {
      throw ArgumentError('Top up amount must be > 0');
    }
    return copyWith(balanceInCents: balanceInCents + amountInCents);
  }

  CustomerEntity deduct(int amountInCents) {
    if (amountInCents <= 0) {
      throw ArgumentError('Deduct amount must be > 0');
    }
    if (amountInCents > balanceInCents) {
      throw StateError('Insufficient balance');
    }
    return copyWith(balanceInCents: balanceInCents - amountInCents);
  }

  CustomerEntity copyWith({
    String? id,
    String? email,
    String? password,
    String? name,
    String? phoneNumber,
    UserStatus? status,
    UserRole? role,
    int? balanceInCents,
  }) {
    return CustomerEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      status: status ?? this.status,
      role: role ?? this.role,
      balanceInCents: balanceInCents ?? this.balanceInCents,
    );
  }

  @override
  List<Object?> get props => [...super.props, balanceInCents];
}
