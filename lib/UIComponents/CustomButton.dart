// import 'package:flutter/material.dart';
//
// class CustomButton extends StatelessWidget {
//   final String label;
//   final IconData icon;
//   final VoidCallback onPressed;
//
//   const CustomButton({
//     Key? key,
//     required this.label,
//     required this.icon,
//     required this.onPressed,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 60,
//       width: 400,
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           textStyle: const TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//           backgroundColor: Colors.white70,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(label),
//             const SizedBox(width: 30),
//             Icon(icon),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final Color buttonColor; // New property to specify button color

  const CustomButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.buttonColor = const Color(0xFFB9CCF8), // Default button color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 400,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: buttonColor, // Use the specified button color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label),
            const SizedBox(width: 30),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}
