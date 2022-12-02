import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jornada_troy_ferramentas/app/app_theme/app_theme.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/dashboard/dashboard_bloc.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/dashboard/dashboard_event.dart';
import 'package:jornada_troy_ferramentas/app/telas/inicio/dashboard/dashboard_state.dart';
import 'package:jornada_troy_ferramentas/models/dashboard_model.dart';
import 'package:jornada_troy_ferramentas/widgets/container.dart';
import 'package:jornada_troy_ferramentas/widgets/drawer.dart';
import 'package:jornada_troy_ferramentas/widgets/erro_componente.dart';
import 'package:jornada_troy_ferramentas/widgets/scaffold.dart';
import 'package:jornada_troy_ferramentas/widgets/text.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  DashboardBloc dashboardBloc = DashboardBloc();
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true, header: '', canShowMarker: false);
    dashboardBloc.add(LoadDashboardEvent());
    super.initState();
  }

  Widget _buildDefaultColumnChart(DashboardModel model) {
    return ShowUpAnimation(
      delayStart: const Duration(microseconds: 0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: getContainerDefault(
          height: 250,
          radius: BorderRadius.circular(10),
          padding: 10,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 10,
              offset: const Offset(10,10)
            )
          ],
          child: SfCartesianChart(
            plotAreaBorderWidth: 0,
            title: ChartTitle(text: model.nomeEmpresa ?? ''),
            primaryXAxis: CategoryAxis(
              majorGridLines: const MajorGridLines(width: 0),
            ),
            primaryYAxis: NumericAxis(axisLine: const AxisLine(width: 0), labelFormat: '{value}%', majorTickLines: const MajorTickLines(size: 0)),
            series: _getDefaultColumnSeries(model),
            tooltipBehavior: _tooltipBehavior,
            enableAxisAnimation: true,
          ),
        ),
      ),
    );
  }

  List<ColumnSeries<ChartSampleData, String>> _getDefaultColumnSeries(DashboardModel model) {
    double calculoGanhoDeRendimento = double.parse(double.parse(model.calculoGanhoDeRendimento ?? '').toStringAsFixed(2));
    double calculoTempoDeUsinagem = double.parse(double.parse(model.calculoTempoDeUsinagem ?? '').toStringAsFixed(2));

    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        dataSource: <ChartSampleData>[
          ChartSampleData(x: 'Ganho de rendimento', y: calculoGanhoDeRendimento),
          ChartSampleData(x: 'Tempo em tempo usinagem', y: calculoTempoDeUsinagem),
        ],
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        color: HexColor('050045'),
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        dataLabelSettings: const DataLabelSettings(isVisible: true, textStyle: TextStyle(fontSize: 10)),
      )
    ];
  }

  Widget _body(List<DashboardModel> listModel) {
    List<Widget> lista = [];

    if (listModel.isNotEmpty) {
      for (DashboardModel model in listModel.reversed) {
        lista.add(_buildDefaultColumnChart(model));
      }

      return Column(
        children: lista,
      );
    } else {
      return SizedBox(
        height: MediaQuery.of(context).size.height - 90,
        child: Center(child: text('Nenhum registro encontrado')),
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
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return getScaffoldDefault(
      bodyColor: themeProvider.isDarkMode ? Colors.grey.shade900 : Colors.grey.shade200,
      drawer: getDrawerPrincipal(context),
      title: 'Dashboard',
      body: _blocBuilder(),
    );
  }
}

class ChartSampleData {
  String x;
  double y;

  ChartSampleData({required this.x, required this.y});
}
