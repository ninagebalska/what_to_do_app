import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:what_to_do_app/data/event_db.dart';
import 'package:what_to_do_app/domain/model/event_model.dart';

import 'package:what_to_do_app/features/add/add_dialog/add_task.dart';
import 'package:what_to_do_app/features/drawer/drawer.dart';
import 'package:what_to_do_app/features/home/cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FFF8),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Your Daily Tasks',
          style: GoogleFonts.poppins(
            color: const Color(0xFF354F52),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      drawer: const NavigationDrawer(),
      body: const _HomePageBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFDA769),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => const AddTaskDialog(),
          );
        },
        child: const Icon(
          Icons.add,
          color: Color(0xFFF6FFF8),
        ),
      ),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(EventDataBase())..start(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final events = state.events;
          return ListView(children: [
            for (final event in events)
              Dismissible(
                background: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'DONE',
                          style: GoogleFonts.poppins(fontSize: 20),
                        ),
                        const Icon(
                          Icons.done_rounded,
                        ),
                      ],
                    ),
                  ),
                ),
                confirmDismiss: (direction) async {
                  // only from right to left
                  return direction == DismissDirection.endToStart;
                },
                key: ValueKey(event.id),
                onDismissed: (direction) {
                  context.read<HomeCubit>().delete(id: event.id);
                },
                child: _EventTile(
                  event: event,
                ),
              ),
          ]);
        },
      ),
    );
  }
}

class _EventTile extends StatelessWidget {
  const _EventTile({
    Key? key,
    required this.event,
  }) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF52796F),
        borderRadius: BorderRadius.circular(17),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 6,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            event.title,
            style: GoogleFonts.poppins(
                color: const Color(0xFFFBFBFB),
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          const Divider(
            height: 10,
            thickness: 1,
            color: Color(0xFFFBFBFB),
          ),
          Text(
            event.eventDateFormatted(),
            textAlign: TextAlign.right,
            style: GoogleFonts.poppins(
                color: const Color(0xFFFBFBFB),
                fontWeight: FontWeight.bold,
                fontSize: 12),
          ),
        ],
      ),
    );
  }
}
