import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/presentation/auth/bloc/ages_display_cubit.dart';
import 'package:ecommerce/presentation/auth/bloc/ages_display_state.dart';
import 'package:ecommerce/presentation/auth/bloc/ages_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ages extends StatelessWidget {
  const Ages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 2.7,
      child: BlocBuilder<AgesDisplayCubit, AgesDisplayState>(
        builder: (context, state) {
          if (state is AgesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AgesLoaded) {
            return _ages(state.ages);
          } else if (state is AgesLoadFailure) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _ages(List<QueryDocumentSnapshot<Map<String, dynamic>>> ages) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pop(context);

            context.read<AgeSelectionCubit>().selectAge(
                  ages[index].data()['value'],
                );
          },
          child: Text(
            ages[index].data()['value'],
            style: const TextStyle(fontSize: 18),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 20,
        );
      },
      itemCount: ages.length,
    );
  }
}
