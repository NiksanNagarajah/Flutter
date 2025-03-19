

class Task {
  int id;
  String title;
  List<String> tags;
  int nbhours;
  int difficuty;
  String description;
  static int nb=5;

  Task({required this.id,required this.title,required this.tags,required
  this.nbhours,required this.difficuty,required this.description});

  static List<Task> generateTask(int i){
    List<Task> tasks=[];
    for(int n=0;n<i;n++){
      tasks.add(Task(id: n, title: "title $n", tags: ['tag $n','tag${n+1}'], nbhours: n, difficuty: n, description: '$n'));
    }
    return tasks;
  }

  static Task fromJson(element) {
    return Task(id: element["id"], title: element["title"], tags: element["tags"].cast<String>(), nbhours: element["nbhours"], difficuty: element["difficulty"], description: element["description"]);
  }

  factory Task.newTask(){
    nb++; //attribut static de la classe.
    return Task(id: nb, title: 'title $nb', tags: ['tags $nb'], nbhours: nb, difficuty: nb%5, description: 'description $nb');
  }
}