import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:what_to_do_app/domain/repositories/events_repository.dart';
import 'package:what_to_do_app/features/add/cubit/add_cubit.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({super.key});

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  String? title;
  DateTime? eventDate;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCubit(EventsRepository()),
      child: BlocListener<AddCubit, AddState>(
        listener: (context, state) {
          if (state.saved) {
            Navigator.of(context).pop();
          }
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<AddCubit, AddState>(
          builder: (context, state) {
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
                          color: const Color(0xFF4158D0),
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                    const SizedBox(height: 18),
                    TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.orange,
                          ),
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.orange,
                          ),
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        hintText: 'What to do...',
                        // filled: true,
                        // fillColor: const Color(0xFFFBFBFB),
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          title = newValue;
                        });
                      },
                    ),
                    const SizedBox(height: 15),
                    OutlinedButton.icon(
                      onPressed: () async {
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(
                            const Duration(days: 365 * 10),
                          ),
                        );
                        if (selectedDate != null) {
                          setState(() {
                            eventDate = selectedDate;
                          });
                        }
                      },
                      icon: const Icon(Icons.calendar_month_rounded),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      label: Text(eventDate == null
                          ? 'Choose date'
                          : DateFormat.yMMMd().format(eventDate!)),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: eventDate == null || title == null
                          ? null
                          : () {
                              context.read<AddCubit>().add(
                                    title!,
                                    eventDate!,
                                  );
                            },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      child: Text(
                        'Add task',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
