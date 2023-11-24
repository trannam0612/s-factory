part of 'home_bloc.dart';

class HomeEvent {}

class AddProductModelEvent extends HomeEvent {
  AddProductModelEvent({this.itemProductModel});

  final ProductModel? itemProductModel;
}

class RemoveProductModelEvent extends HomeEvent {
  RemoveProductModelEvent({this.itemProductModel});

  final ProductModel? itemProductModel;
}

class CheckSerialEvent extends HomeEvent {
  CheckSerialEvent({required this.serial});

  final String serial;
}

class ConfirmReportEvent extends HomeEvent {
  ConfirmReportEvent();
}
