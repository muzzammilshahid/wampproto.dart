import "package:wampproto/src/messages/message.dart";
import "package:wampproto/src/messages/util.dart";

class Registered implements Message {
  Registered(this.requestID, this.registrationID);

  static const int id = 65;

  static const String text = "REGISTERED";

  final int requestID;
  final int registrationID;

  static Registered parse(final List<dynamic> message) {
    sanityCheck(message, 3, 3, id, text);

    int requestID = validateIntOrRaise(message[1], text, "request ID");

    int registrationID = validateIntOrRaise(message[2], text, "registration ID");

    return Registered(requestID, registrationID);
  }

  @override
  List<dynamic> marshal() {
    return [id, requestID, registrationID];
  }

  @override
  int messageType() => id;
}
