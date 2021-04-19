import 'package:counter_template/features/counter/cubit/couter_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<CouterCubitCubit, CounterData>(
            listener: (context, counterState) {
              return null;
            },
            builder: (context, counterState) {
              return Center(
                child: Text(
                  counterState.counterValue.toString(),
                  style: GoogleFonts.aBeeZee(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
