import 'package:intl/intl.dart';

class ConvertDate {
  convertDate(String dataString) {
    var data = dataString;
    DateTime parseData = DateTime.parse(data);
    var newFormatData = DateFormat("dd/MM/yyyy");

    String updatedData = newFormatData.format(parseData);
    return updatedData;
  }

  convertHour(String dataString) {
    var data = dataString;
    DateTime parseData = DateTime.parse(data);
    var newFormatHora = DateFormat("HH:mm");

    String updatedHora = newFormatHora.format(parseData);
    return updatedHora;
  }
}
