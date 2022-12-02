import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/dashboard/dashboard_bloc.dart';
import 'package:jornada_troy_ferramentas/models/dashboard_model.dart';
import 'package:jornada_troy_ferramentas/widgets/erro_componente.dart';
import 'package:jornada_troy_ferramentas/widgets/text.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../widgets/container.dart';
import '../dashboard/dashboard_event.dart';
import '../dashboard/dashboard_state.dart';

class GraficosInicio extends StatefulWidget {
  const GraficosInicio({Key? key}) : super(key: key);

  @override
  State<GraficosInicio> createState() => _GraficosInicioState();
}

class _GraficosInicioState extends State<GraficosInicio> {
  DashboardBloc dashboardBloc = DashboardBloc();
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true, header: '', canShowMarker: false);
    dashboardBloc.add(LoadDashboardEvent());
    super.initState();
  }

  SfCartesianChart _buildDefaultColumnChart(DashboardModel model) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: model.nomeEmpresa ?? ''),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(axisLine: const AxisLine(width: 0), labelFormat: '{value}%', majorTickLines: const MajorTickLines(size: 0)),
      series: _getDefaultColumnSeries(model),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  List<ColumnSeries<ChartSampleData, String>> _getDefaultColumnSeries(DashboardModel model) {
    double calculoGanhoDeRendimento = double.parse(double.parse(model.calculoGanhoDeRendimento ?? '').toStringAsFixed(2));
    double calculoTempoDeUsinagem = double.parse(double.parse(model.calculoTempoDeUsinagem ?? '').toStringAsFixed(2));

    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        dataSource: <ChartSampleData>[
          ChartSampleData(x: 'GANHO de rendimento (pças / aresta)', y: calculoGanhoDeRendimento),
          ChartSampleData(x: 'Tempo em tempo usinagem', y: calculoTempoDeUsinagem),
        ],
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        dataLabelSettings: const DataLabelSettings(isVisible: true, textStyle: TextStyle(fontSize: 10)),
      )
    ];
  }

  Widget _body(List<DashboardModel> listModel) {
    if (listModel.isNotEmpty) {
      return _buildDefaultColumnChart(listModel.last);
    } else {
      return Center(
        child: text('Nenhum registro encontrado'),
      );
    }
  }

  Widget _blocBuilder() {
    return BlocBuilder<DashboardBloc, DashboardState>(
      bloc: dashboardBloc,
      builder: (context, state) {
        switch (state.runtimeType) {
          case DashboardLoadingState:
            return Center(child: getLoadingWithoutPopup(context));

          case DashboardErrorState:
            return getErroTentarNovamente(function: () => dashboardBloc.add(LoadDashboardEvent()));

          default:
            return _body(state.dashboardModel);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _blocBuilder();
  }
}

class ChartSampleData {
  String x;
  double y;

  ChartSampleData({required this.x, required this.y});
}
