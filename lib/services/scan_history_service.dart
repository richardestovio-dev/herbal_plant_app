import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/scan_history.dart';

class ScanHistoryService {
  static const String _historyKey = 'herbvision_scan_history';

  /// Saves a new scan to local device storage.
  static Future<void> addHistory(ScanHistory history) async {
    final preferences = await SharedPreferences.getInstance();

    final existingHistory = await getHistory();

    existingHistory.insert(0, history);

    final encodedHistory = existingHistory
        .map((item) => jsonEncode(item.toJson()))
        .toList();

    await preferences.setStringList(_historyKey, encodedHistory);
  }

  /// Retrieves all saved scans.
  static Future<List<ScanHistory>> getHistory() async {
    final preferences = await SharedPreferences.getInstance();

    final storedHistory = preferences.getStringList(_historyKey);

    if (storedHistory == null || storedHistory.isEmpty) {
      return [];
    }

    final history = <ScanHistory>[];

    for (final item in storedHistory) {
      try {
        final decoded = jsonDecode(item) as Map<String, dynamic>;

        history.add(ScanHistory.fromJson(decoded));
      } catch (_) {
        // Ignore invalid history records.
      }
    }

    return history;
  }

  /// Deletes one history record.
  static Future<void> deleteHistory(ScanHistory history) async {
    final existingHistory = await getHistory();

    existingHistory.remove(history);

    await _saveHistory(existingHistory);
  }

  /// Deletes all saved scan history.
  static Future<void> clearHistory() async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.remove(_historyKey);
  }

  static Future<void> _saveHistory(List<ScanHistory> history) async {
    final preferences = await SharedPreferences.getInstance();

    final encodedHistory = history
        .map((item) => jsonEncode(item.toJson()))
        .toList();

    await preferences.setStringList(_historyKey, encodedHistory);
  }
}
