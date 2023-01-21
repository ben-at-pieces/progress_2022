import 'package:flutter/material.dart';

/// Interface to provide information about item use in [SideNavigationBar.items]
class PiecesSideNavigationBarItem {
  /// The [IconData] you want to display
  final IconData icon;

  /// A text to display route information
  final String label;

  /// Item data
  const PiecesSideNavigationBarItem({
    required this.icon,
    required this.label,

  });
}
