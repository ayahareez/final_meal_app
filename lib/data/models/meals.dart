class Meal{
  final String name,time,standard,difficulty,imageUrl,ingredients,steps;
   final int id;
  bool isFav;
  Meal( {required this.name,required this.time,required this.standard,required this.difficulty,required this.imageUrl,required this.id,required this.steps,required this.ingredients,this.isFav=false,});
  Map<String,dynamic> toMap()=>{'name':name,'time':time,'standard':standard,'difficulty':difficulty,'imageUrl':imageUrl,'ingredients':ingredients,'id':id,'steps':steps,'isFav':isFav};
  factory Meal.fromMap(Map<String,dynamic> map)=>Meal(name: map['name'], time: map['time'], standard: map['standard'], difficulty: map['difficulty'], imageUrl: map['imageUrl'], id: map['id'], steps: map['steps'], ingredients: map['ingredients'],isFav: map['isFav']);
}

int count(){
  int i=0;
  i++;
  return i;
}