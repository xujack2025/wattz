part of 'bottom_nav_bloc.dart';

sealed class BottomNavState extends Equatable {
  const BottomNavState();

  @override
  List<Object> get props => [];
}

final class BottomNavInitial extends BottomNavState {}

final class BottomNavSelected extends BottomNavState {
  final int selectedIndex;

  const BottomNavSelected(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
