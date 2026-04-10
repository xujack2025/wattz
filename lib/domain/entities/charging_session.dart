import 'package:equatable/equatable.dart';
import 'package:wattz/domain/entities/payment.dart';

enum SessionStatus { active, completed, canceled }

class ChargingSession extends Equatable {
  final String id;
  final String customerId;
  final String chargerId;
  final String stationId;
  final DateTime startTime;
  final Payment? payment;
  final DateTime? endTime;
  final double? kwhUsed;
  final int? totalAmount;
  final SessionStatus status;

  const ChargingSession({
    required this.id,
    required this.customerId,
    required this.chargerId,
    required this.stationId,
    required this.startTime,
    this.endTime,
    this.kwhUsed = 0.0,
    this.totalAmount = 0,
    this.status = SessionStatus.active,
    this.payment,
  });

  ChargingSession copyWith({
    String? id,
    String? customerId,
    String? chargerId,
    String? stationId,
    DateTime? startTime,
    DateTime? endTime,
    double? kwhUsed,
    int? totalAmount,
    SessionStatus? status,
    Payment? payment,
  }) {
    return ChargingSession(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      chargerId: chargerId ?? this.chargerId,
      stationId: stationId ?? this.stationId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      kwhUsed: kwhUsed ?? this.kwhUsed,
      totalAmount: totalAmount ?? this.totalAmount,
      status: status ?? this.status,
      payment: payment ?? this.payment,
    );
  }

  @override
  List<Object?> get props => [
    id,
    customerId,
    chargerId,
    stationId,
    startTime,
    endTime,
    kwhUsed,
    totalAmount,
    status,
    payment,
  ];
}
