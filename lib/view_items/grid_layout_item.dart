import 'package:flutter/material.dart';
import '../res/app_colors/app_colors.dart';

class GridLayout  {
 
 
  final String title;
  final IconData icon;
  final Color color;
  final String count;

  GridLayout(
      {required this.title,
      required this.icon,
      required this.color,
      required this.count});
}

List<GridLayout> options = [
   
  GridLayout(
      title: 'Total Orders',
      icon: Icons.home,
      color: AppColors.primaryColor,
      count: ""),
  GridLayout(
      title: 'Assigned Orders',
      icon: Icons.assignment,
      color: AppColors.green,
      count: "15"),
  GridLayout(
      title: 'Cancelled Orders',
      icon: Icons.access_alarm,
      color: AppColors.red,
      count: "15"),
  GridLayout(
      title: 'In Progress Orders',
      icon: Icons.on_device_training,
      color: AppColors.orange,
      count: "7"),
];

class GridOptions extends StatelessWidget {
  final GridLayout layout;
  const GridOptions({required this.layout});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: layout.color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              layout.icon,
              size: 40,
              color: AppColors.white,
            ),
            Text(
              layout.title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 15, color: AppColors.white),
            ),
            Text(
              layout.count,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
