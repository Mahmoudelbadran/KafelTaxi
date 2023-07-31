import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxizer/data/Remote/request/user/review_requset/review_requset.dart';
import 'package:taxizer/data/Remote/response/user/review_response/review_response.dart';

part 'comment_state.dart';
class CommentLogic extends Cubit<CommentState> {
  CommentLogic() : super(AppIntialStates());

  static CommentLogic get(context) => BlocProvider.of<CommentLogic>(context);

  ReviewResponse reviewResponse=ReviewResponse();
  Future sendComment({
    required String token,
    required String comment
  }) async {
    emit(LoadingSentCommentAppState());
    await ReviewRequest()
        .reviewRequest(token: token,comment: comment)
        .then((value) {
      reviewResponse = value;
      emit(SuscessSentCommentAppState());
    }).catchError((error) {
      emit(ErorrSentCommentAppState());
    });
  }
}