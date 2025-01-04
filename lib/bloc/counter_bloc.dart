import 'package:bloc_st_ma_training2/bloc/counter_event.dart';
import 'package:bloc_st_ma_training2/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {

    on<CounterIncrementPressed> ((event, emmit){
      emmit(CounterState(state.count + 1)); // increment is done
    });

    on<CounterDecrementPressed> ((event, emmit) {
      emmit(CounterState(state.count - 1));
    });// decrement is done

    on<CounterResetPressed> ((event, emmit) {
      emmit(CounterState(0));
    });

  }

}