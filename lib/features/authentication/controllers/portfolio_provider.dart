import 'package:flutter/material.dart';
import 'package:my_portfolio/data/services/portfolio_service.dart';

import '../models/portfolio/portfolio_model.dart';

class PortfolioProvider extends ChangeNotifier {
  final PortfolioService _portfolioService;
  
  PortfolioModel? _portfolioData;
  bool _isLoading = true;
  String? _error;

  PortfolioProvider({
    required PortfolioService portfolioService,
  }) : _portfolioService = portfolioService {
    initializeData();
  }

  // Getters
  PortfolioModel? get portfolioData => _portfolioData;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasData => _portfolioData != null;
  bool get hasError => _error != null;

  Future<void> initializeData() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _portfolioData = await _portfolioService.getPortfolioData();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refreshData() async {
    await initializeData();
  }
}
