import 'package:amit_project/bloc/bloc_event.dart';
import 'package:bloc/bloc.dart';

class BlocControl extends Bloc<BlocEvents,int>{
  BlocControl(int initialState) : super(1);

  @override
  Stream<int> mapEventToState(BlocEvents event)async* {
    // TODO: implement mapEventToState
    switch(event){
      case (BlocEvents.increment):{

        yield state+1;
      }
      break;
      case(BlocEvents.decrement):{
        yield state-1;
      }
      break;
      case(BlocEvents.lastValue):{
        yield 1;
      }

    }


  }


}