import 'package:equatable/equatable.dart';

enum UserStatus { active, suspended, blocked }
enum UserRole { customer, admin }

abstract class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final UserStatus status;
  final UserRole role;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.status,
    required this.role,
  });

  @override
  List<Object?> get props => [id, name, email, phoneNumber, status, role];
}

class Customer extends User {
  final int balanceCents;

  const Customer({
    required super.id,
    required super.name,
    required super.email,
    required super.phoneNumber,
    this.balanceCents = 0,
    super.status = UserStatus.active,
    super.role = UserRole.customer,
  }) : assert(balanceCents >= 0);

  double getBalance() => balanceCents / 100.0;

  Customer topUp(int amountCents) {
    if (amountCents <= 0) {
      throw ArgumentError('Top up amount must be > 0');
    }
    return copyWith(balanceCents: balanceCents + amountCents);
  }

  Customer deduct(int amountCents) {
    if (amountCents <= 0) {
      throw ArgumentError('Deduct amount must be > 0');
    }
    if (amountCents > balanceCents) {
      throw StateError('Insufficient balance');
    }
    return copyWith(balanceCents: balanceCents - amountCents);
  }

  Customer copyWith({
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
    UserStatus? status,
    UserRole? role,
    int? balanceCents,
  }) {
    return Customer(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      status: status ?? this.status,
      role: role ?? this.role,
      balanceCents: balanceCents ?? this.balanceCents,
    );
  }

  @override
  List<Object?> get props => [...super.props, balanceCents];
}