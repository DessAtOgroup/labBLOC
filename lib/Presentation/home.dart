import 'package:flutter/material.dart';
import 'package:flutterdemo2/Data/repository/day_data_repository.dart';

import 'package:flutterdemo2/Domain/Model/day.dart';
import 'package:flutterdemo2/Domain/Repository/day_repository.dart';
import 'package:flutterdemo2/Internal/dependencies/repository_module.dart';
import 'package:flutterdemo2/Presentation/bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _latController = TextEditingController();
  final _lngController = TextEditingController();
  Update _update = Update();
  int _yaSchitalka = 0;
  RepositoryModule _rm = RepositoryModule();

  Day _day = Day(sunrise: DateTime(0), sunset: DateTime(0), solarNoon: DateTime(0), dayLength: 0);

  @override void dispose() {
    _update.closeStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: _getBody(),
      ),
    );
  }

  Widget _getBody() {
    return StreamBuilder(
      stream: _update.outputEventStream,
      initialData: Events.firstEvent,
      builder: (context, snapshot) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _getRowInput(),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text('Получить'),
                  onPressed:() { _getDay(double.tryParse(_latController.text) ?? 0, double.tryParse(_lngController.text) ?? 0 ) ;} ,
                ),
                SizedBox(height: 20),
                if (_day != null) _getDayInfo(_day),
                Text('Считалка для проверки блок: $_yaSchitalka'),
              ],
            ),
          ),
        );
      }
    );
  }

  Widget _getRowInput() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _latController,
            keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
            decoration: InputDecoration(hintText: 'Широта'),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: TextField(
            controller: _lngController,
            keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
            decoration: InputDecoration(hintText: 'Долгота'),
          ),
        ),
      ],
    );
  }

  Widget _getDayInfo(Day day) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Восход: ${day.sunrise?.toLocal()}'),
        Text('Заход: ${day.sunset?.toLocal()}'),
        Text('Полдень: ${day.solarNoon?.toLocal()}'),
        Text('Продолжительность: ${Duration(seconds: day.dayLength ?? 0)}'),
      ],
    );
  }

  Future<void> _getDay(@required double latitude, @required double longitude) async {

   // DayRepository _dayRepo = RepositoryModule.dayRepository();
    DayDataRepository? _ddr;
    Day? __day;
    __day = await _ddr?.getDay(latitude: latitude, longitude: longitude);
    if (__day != null) _day = __day;
    _yaSchitalka++;
   _update.inputEventSink.add(Events.firstEvent);

  }

}