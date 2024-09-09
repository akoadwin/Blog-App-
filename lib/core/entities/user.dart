// This entity can use throughout our application
//and this entity serves as the base model
//or the parent Class of the model that is created in the Data Layer

class User {
  final String id;
  final String email;
  final String name;
  User({
    required this.id,
    required this.email,
    required this.name,
  });
}
