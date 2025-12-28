import 'package:bloc/bloc.dart';
import 'package:chat_app_with_ai/models/message_model.dart';
import 'package:meta/meta.dart';

import '../../services/chat_service.dart';

part 'send_message_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  SendMessageCubit() : super(SendMessageInitial());

  sendMessage(List<MessageModel> messages) async {
    emit(SendMessageLoading());
    try {
      var messageModel = await ChatService().sendMessage(messages: messages);
      emit(SendMessageSuccess(messageModel: messageModel));
    } on ServerException catch (e) {
      emit(SendMessageFailure(errMesasge: e.errMessage));
    }
  }
}
