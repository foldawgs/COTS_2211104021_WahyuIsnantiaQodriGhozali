import 'package:flutter/material.dart';
// import 'package:cots_wahyuisnantiaqodrighozali/design_system/fontCollections.dart';
import 'package:cots_wahyuisnantiaqodrighozali/design_system/colorCollections.dart';

class ContinueButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ContinueButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width * 0.8;

    return Container(
      width: buttonWidth,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        onPressed: onPressed,
        child: Text(
          'Continue',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
