class Course {
  int id;
  String name;
  String description;
  int cycle;
  int credits;
  int research;

  Course(this.name, this.cycle, this.credits, this.research, [this.description]);
  Course.withId(this.id, this.name, this.cycle, this.credits, this.research, [this.description]);
}