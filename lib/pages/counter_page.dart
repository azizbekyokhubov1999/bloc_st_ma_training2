import 'dart:math';

import 'package:bloc_st_ma_training2/bloc/counter_bloc.dart';
import 'package:bloc_st_ma_training2/bloc/counter_event.dart';
import 'package:bloc_st_ma_training2/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {

    final counterBloc = context.read<CounterBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Batman Counter"),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state){
            return Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                for(int index = 0; index < state.count; index++)
                  Positioned(
                    left: Random().nextInt(250).toDouble(),
                      top: Random().nextInt(400).toDouble(),
                      child: SizedBox(
                        height: 150,
                        width: 150,
                        child: Image.asset("assets/images/batman_logo.png"),
                      )
                  )
              ],
            );
          }
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
              onPressed: (){
                counterBloc.add(CounterIncrementPressed());
              },
            child: Icon(Icons.add),
          ),
          SizedBox(
            height: 10
          ),
          FloatingActionButton(
            onPressed: (){
              counterBloc.add(CounterDecrementPressed());
            },
            child: Icon(Icons.remove),
          ),
          SizedBox(
              height: 10
          ),
          FloatingActionButton(
            onPressed: (){
              counterBloc.add(CounterResetPressed());
            },
            child: Icon(Icons.exposure_zero),
          ),
        ],
      ),
    );
  }
}
