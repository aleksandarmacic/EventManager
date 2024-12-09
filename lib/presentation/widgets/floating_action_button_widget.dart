import 'package:event_manager_app/application/cubits/add_event/add_event_cubit.dart';
import 'package:event_manager_app/domain/repositories/event_repository.dart';
import 'package:event_manager_app/presentation/screens/add_event_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  final EventRepository eventRepository;

  const FloatingActionButtonWidget({
    Key? key,
    required this.eventRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      AddEventCubit(eventRepository: eventRepository),
                  child: const AddEventScreen(),
                ),
              ),
            );
          },
          backgroundColor: Colors.blueAccent,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
