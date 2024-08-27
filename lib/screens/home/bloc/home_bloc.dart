import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:watch_store/data/model/home_model.dart';

import '../../../data/repo/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHomeRepo homeRepo;
  HomeBloc(this.homeRepo) : super(HomeLoading()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeInit) {
        try {
          emit(HomeLoading());
          final home = await homeRepo.getHome();
          emit(HomeSuccess(home));
        } catch (e) {
          emit(HomeError("خطا در برقراری ارتباط با سرور"));
        }
      }
    });
  }
}
