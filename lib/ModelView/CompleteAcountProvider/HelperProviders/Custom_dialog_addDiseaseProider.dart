import 'package:flutter/cupertino.dart';

class CustomDialogAddDiseaseProider extends ChangeNotifier {
  String condition = '';
  DateTime diagnosisDate = DateTime.now();
  String treatment = '';
  String status = 'active';
  String? notes;
  void setCondition(String val) {
    condition = val;
    notifyListeners();
  }
  void setDiagnosisDate(DateTime val) {
    diagnosisDate = val;
    notifyListeners();
  }
  void setTreatment(String val) {
    treatment = val;
    notifyListeners();
  }
  void setStatus(String val) {
    status = val;
    notifyListeners();
  }
  void setNotes(String val) {
    notes = val;
    notifyListeners();
  }

}