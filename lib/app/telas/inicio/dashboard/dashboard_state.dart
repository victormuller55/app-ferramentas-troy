import 'package:jornada_troy_ferramentas/models/dashboard_model.dart';

abstract class DashboardState {
  List<DashboardModel> dashboardModel;

  DashboardState({
    required this.dashboardModel,
  });
}

class DashboardInitialState extends DashboardState {
  DashboardInitialState() : super(dashboardModel: []);
}

class DashboardLoadingState extends DashboardInitialState {}

class DashboardSuccessState extends DashboardState {
  DashboardSuccessState({required List<DashboardModel> dashboardModel}) : super(dashboardModel: dashboardModel);
}

class DashboardErrorState extends DashboardInitialState {}
