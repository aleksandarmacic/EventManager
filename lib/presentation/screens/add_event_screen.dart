import 'package:event_manager_app/application/cubits/add_event/add_event_cubit.dart';
import 'package:event_manager_app/application/cubits/add_event/add_event_states.dart';
import 'package:event_manager_app/presentation/widgets/add_event_form.dart';
import 'package:event_manager_app/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEventScreen extends StatelessWidget {
  const AddEventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Add Event",
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocConsumer<AddEventCubit, AddEventState>(
        listener: (context, state) {
          if (state is AddEventSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text(state.successMessage),
              ),
            );
            Navigator.pop(context);
          } else if (state is AddEventFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return AddEventForm(
            state: state,
          );
        },
      ),
    );
  }
}
