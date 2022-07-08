class UserCreationEvent {
  final int id;
  final String name;

  const UserCreationEvent({
    required this.id,
    required this.name
  });
}