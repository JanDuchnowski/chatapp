part of 'navigation_bloc.dart';

class NavigationEvent extends Equatable {
  const NavigationEvent({required this.index});
  final int index;
  @override
  List<Object> get props => [index];
}
