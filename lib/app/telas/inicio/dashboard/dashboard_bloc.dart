import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:jornada_troy_ferramentas/models/dashboard_model.dart';

import 'dashboard_event.dart';
import 'dashboard_service.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitialState()) {
    on<LoadDashboardEvent>((event, emit) async {
      emit(DashboardLoadingState());
      try {

        http.Response response = await getDashboard();
        var jsonModel = json.decode(response.body) as List;
        List<DashboardModel> listModel = [];

        for (var element in jsonModel) {
          listModel.add(DashboardModel.fromMap(element));
        }

        emit(DashboardSuccessState(dashboardModel: listModel));
      } catch (e) {
        emit(DashboardErrorState());
      }
    });
  }
}