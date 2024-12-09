import 'package:event_manager_app/application/cubits/favorite/favorite_cubit.dart';
import 'package:event_manager_app/data/models/event_model.dart';
import 'package:event_manager_app/presentation/screens/event_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventListTile extends StatelessWidget {
  final EventModel event;

  const EventListTile({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          event.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            event.location,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ),
        trailing: BlocProvider(
          create: (_) => FavoriteCubit(event.isFavorite),
          child: BlocBuilder<FavoriteCubit, bool>(
            builder: (context, isFavorite) {
              return IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.grey,
                  size: 28,
                ),
                onPressed: () {
                  context.read<FavoriteCubit>().toggleFavorite();
                },
              );
            },
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => EventDetailScreen(event: event),
            ),
          );
        },
      ),
    );
  }
}
