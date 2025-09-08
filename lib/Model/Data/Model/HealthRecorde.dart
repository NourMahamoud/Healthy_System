class HealthRecord {
  final String condition;
  final DateTime diagnosisDate;
  final String treatment;
  final String status;// active, recovered, chronic, etc.
  final String? notes;

  HealthRecord({
    required this.condition,
    required this.diagnosisDate,
    required this.treatment,
    required this.status,
    this.notes,
  });

  // Convert to JSON (for Firebase/API)
   Map<String, dynamic> toJson() => {
    'condition': condition,
    'diagnosisDate': diagnosisDate.toIso8601String(),
    'treatment': treatment,
    'status': status,
    'notes': notes,
  };

  // Convert from JSON (for Firebase/API)
  factory HealthRecord.fromJson(Map<String, dynamic> json) => HealthRecord(
    condition: json['condition'],
    diagnosisDate: DateTime.parse(json['diagnosisDate']),
    treatment: json['treatment'],
    status: json['status'],
    notes: json['notes'],
  ); }