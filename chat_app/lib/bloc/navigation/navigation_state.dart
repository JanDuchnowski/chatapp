part of 'navigation_bloc.dart';

class NavigationState extends Equatable {
  const NavigationState({required this.selectedIndex});
  final int selectedIndex;
  const NavigationState.initial() : selectedIndex = 0;

  NavigationState copyWith({
    int? selectedIndex,
  }) {
    return NavigationState(selectedIndex: selectedIndex ?? this.selectedIndex);
  }

  @override
  List<Object> get props => [selectedIndex];
}
