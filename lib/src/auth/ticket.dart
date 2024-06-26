import "package:wampproto/messages.dart";
import "package:wampproto/src/auth/auth.dart";

class TicketAuthenticator extends IClientAuthenticator {
  TicketAuthenticator(this._ticket, String authID, [Map<String, dynamic>? authExtra]) : super(type, authID, authExtra);

  static const String type = "ticket";
  final String _ticket;

  @override
  Authenticate authenticate(Challenge challenge) {
    return Authenticate(_ticket, {});
  }
}
