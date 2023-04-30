import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTaskDialog extends StatelessWidget {
  const AddTaskDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      backgroundColor: const Color(0xFFFBFBFB),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'NEW TASK',
              style: GoogleFonts.poppins(
                  color: const Color(0xFF52796F),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(height: 18),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 3,
                    color: Color.fromARGB(255, 194, 194, 194),
                  ),
                  borderRadius: BorderRadius.circular(32.0),
                ),
                hintText: 'What to do...',
                filled: true,
                fillColor: const Color(0xFFFBFBFB),
              ),
            ),
            const SizedBox(height: 15),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.calendar_month_rounded),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              label: const Text('Choose date'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              child: Text(
                'Add task',
                style: GoogleFonts.poppins(
                  color: const Color(0xfffbfbfb),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
