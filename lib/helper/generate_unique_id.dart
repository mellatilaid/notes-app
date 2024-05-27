import 'package:uuid/uuid.dart';

int generateUniqueId() {
  // Create a UUID object
  var uuid = const Uuid();

// Generate a v4 (random) UUID
  String uniqueId = uuid.v4();

// Use the hash of the UUID as the unique integer ID for the notification
  return uniqueId.hashCode;
}
