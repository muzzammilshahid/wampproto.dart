import "package:wampproto/src/messages/message.dart";
import "package:wampproto/src/messages/util.dart";

class UnSubscribe implements Message {
  UnSubscribe(this.requestID, this.subscriptionID);

  static const int id = 34;

  static const String text = "UNSUBSCRIBE";

  final int requestID;
  final int subscriptionID;

  static UnSubscribe parse(final List<dynamic> message) {
    sanityCheck(message, 3, 3, id, text);

    int requestID = validateIntOrRaise(message[1], text, "request ID");

    int subscriptionID = validateIntOrRaise(message[2], text, "subscription ID");

    return UnSubscribe(requestID, subscriptionID);
  }

  @override
  List<dynamic> marshal() {
    return [id, requestID, subscriptionID];
  }

  @override
  int messageType() => id;
}
