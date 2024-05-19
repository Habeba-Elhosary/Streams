class Person {
  final String name;
   static final List<String> usedNames = [];

  Person({required this.name}) {
    if (usedNames.contains(name)) {
      throw AssertionError('$name already exists');
    } else {
      usedNames.add(name);
    }
  }
}
