import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mentora_admin/controllers/lanca_lead_controller.dart';
import 'package:mentora_admin/utils/NetworkMonitor.dart';

class SyncService {
  final LeadsController _dataService = LeadsController();
  final NetworkMonitor _networkMonitor = NetworkMonitor();
  Timer? _timer;

  SyncService() {
    _networkMonitor.connectivityStream.listen((ConnectivityResult result) {
      if (result != ConnectivityResult.none) {
        _dataService.syncData();
      }
    });

    _timer = Timer.periodic(Duration(minutes: 5), (timer) {
      _dataService.syncData();
    });
  }

  void dispose() {
    _timer?.cancel();
  }
}
