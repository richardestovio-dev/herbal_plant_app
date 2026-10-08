import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../data/scan_history.dart';
import '../services/scan_history_service.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<ScanHistory> _history = [];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _loadHistory();
  }

  // ============================================================
  // LOAD HISTORY
  // ============================================================

  Future<void> _loadHistory() async {
    final history = await ScanHistoryService.getHistory();

    if (!mounted) return;

    setState(() {
      _history = history;
      _isLoading = false;
    });
  }

  // ============================================================
  // DELETE HISTORY ITEM
  // ============================================================

  Future<void> _deleteHistory(ScanHistory history) async {
    await ScanHistoryService.deleteHistory(history);

    await _loadHistory();
  }

  // ============================================================
  // CLEAR ALL HISTORY
  // ============================================================

  Future<void> _clearAllHistory() async {
    if (_history.isEmpty) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Clear Scan History?'),
          content: const Text(
            'All saved scan records will be removed from this device.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Cancel'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.error,
                foregroundColor: AppColors.white,
              ),
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Clear'),
            ),
          ],
        );
      },
    );

    if (confirmed != true) return;

    await ScanHistoryService.clearHistory();

    if (!mounted) return;

    setState(() {
      _history = [];
    });
  }

  // ============================================================
  // FORMAT DATE
  // ============================================================

  String _formatDate(DateTime date) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    final month = months[date.month - 1];

    return '$month ${date.day}, ${date.year}';
  }

  // ============================================================
  // FORMAT CONFIDENCE
  // ============================================================

  String _formatConfidence(double confidence) {
    return '${(confidence * 100).toStringAsFixed(2)}%';
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text('Scan History'),
        centerTitle: true,
        actions: [
          if (_history.isNotEmpty)
            IconButton(
              tooltip: 'Clear history',
              onPressed: _clearAllHistory,
              icon: const Icon(Icons.delete_sweep_outlined),
            ),
        ],
      ),

      body: _buildBody(),
    );
  }

  // ============================================================
  // BODY
  // ============================================================

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primaryGreen),
      );
    }

    if (_history.isEmpty) {
      return _buildEmptyState();
    }

    return RefreshIndicator(
      color: AppColors.primaryGreen,
      onRefresh: _loadHistory,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        itemCount: _history.length,
        itemBuilder: (context, index) {
          final history = _history[index];

          return _historyItem(history);
        },
      ),
    );
  }

  // ============================================================
  // EMPTY STATE
  // ============================================================

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: AppColors.surfaceGreen,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.history_rounded,
                size: 52,
                color: AppColors.primaryGreen,
              ),
            ),

            const SizedBox(height: 22),

            const Text(
              'No Scan History',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 21,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Plants you identify will appear here automatically.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13.5,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // HISTORY ITEM
  // ============================================================

  Widget _historyItem(ScanHistory history) {
    return Dismissible(
      key: ValueKey(
        '${history.scannedAt.toIso8601String()}'
        '_${history.plantName}',
      ),

      direction: DismissDirection.endToStart,

      background: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          color: AppColors.error,
          borderRadius: BorderRadius.circular(18),
        ),
        child: const Icon(Icons.delete_outline_rounded, color: AppColors.white),
      ),

      onDismissed: (_) {
        _deleteHistory(history);
      },

      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        elevation: 0,
        color: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(color: AppColors.border),
        ),

        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 10,
          ),

          // ----------------------------------------------------
          // PLANT ICON
          // ----------------------------------------------------
          leading: Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: AppColors.surfaceGreen,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.local_florist_rounded,
              color: AppColors.primaryGreen,
              size: 27,
            ),
          ),

          // ----------------------------------------------------
          // PLANT NAME
          // ----------------------------------------------------
          title: Text(
            history.plantName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w800,
              fontSize: 15.5,
            ),
          ),

          // ----------------------------------------------------
          // SCIENTIFIC NAME + DATE
          // ----------------------------------------------------
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              '${history.scientificName}\n'
              '${_formatDate(history.scannedAt)}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 11.5,
                height: 1.5,
              ),
            ),
          ),

          // ----------------------------------------------------
          // CONFIDENCE
          // ----------------------------------------------------
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _formatConfidence(history.confidence),
                style: const TextStyle(
                  color: AppColors.primaryGreen,
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                'Confidence',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
