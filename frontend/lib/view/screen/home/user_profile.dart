import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/services/session.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Implement your user profile page UI here
    return Container(
      color: AppColors.SECONDARY_COLOR,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(
                  'assets/images/tom.png'), // Replace with actual user image
            ),
            const SizedBox(height: 16),
            Text(
              '${Session.user?.name}', // Replace with actual user name
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.LIGHT_TEXT),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
