import 'package:equatable/equatable.dart';

enum PaymentStatus { pending, completed, canceled, rejected }

class Payment extends Equatable {
  final String id;
  final int amountInCent;
  final PaymentStatus status;
  final PaymentMethod method;
  final DateTime createdAt;

  const Payment({
    required this.id,
    required this.amountInCent,
    required this.status,
    required this.method,
    required this.createdAt,
  }) : assert(amountInCent > 0, 'Amount must be positive');

  Payment copyWith({
    String? id,
    int? amountInCent,
    PaymentStatus? status,
    PaymentMethod? method,
    DateTime? createdAt,
  }) {
    return Payment(
      id: id ?? this.id,
      amountInCent: amountInCent ?? this.amountInCent,
      status: status ?? this.status,
      method: method ?? this.method,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [id, amountInCent, status, method, createdAt];
}

abstract class PaymentMethod extends Equatable {
  final String providerName;
  const PaymentMethod({required this.providerName});

  @override
  List<Object?> get props => [providerName];
}

class CardPayment extends PaymentMethod {
  final String lastFourDigits;
  final String brand;

  const CardPayment({
    super.providerName = 'Credit/Debit Card',
    required this.lastFourDigits,
    required this.brand,
  });

  @override
  List<Object?> get props => [...super.props, lastFourDigits, brand];
}

class WalletPayment extends PaymentMethod {
  final String walletId;

  const WalletPayment({
    super.providerName = 'Wattz Wallet',
    required this.walletId,
  });

  @override
  List<Object?> get props => super.props + [walletId];
}
