// import '../models/meals.dart';
// //كان ممكن اعملها list of list بس كسلت اغير
//  List<Meal> meals =[
//   Meal(name: 'Salad with Smoked Salmon', time: '15 min', standard: 'Luxurious', difficulty:'Simple',imageUrl:'assets/images/istockphoto-1395140920-612x612.jpg',id: 0,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced. 1 avocado sliced',steps: 'try yourself' ),
//   Meal(name: 'Delicious Orange Mousse', time: '240 min', standard: 'Affordable', difficulty:'Hard',imageUrl:'assets/images/istockphoto-1402021474-612x612.jpg' ,id:0,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'turn on the kettle'),
//   Meal(name: 'Salad with Smoked Salmon', time: '30 min', standard: 'Luxurious', difficulty:'Simple',imageUrl:'assets/images/istockphoto-1395140920-612x612.jpg',id: 0,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'try yourself' ),
//
//   Meal(name: 'Salad', time: '15 min', standard: 'Luxurious', difficulty:'Simple',imageUrl:'assets/images/istockphoto-1416818056-612x612.jpg' ,id:1,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'try yourself'),
//   Meal(name: 'Orange Mousse', time: '240 min', standard: 'Affordable', difficulty:'Hard',imageUrl:'assets/images/istockphoto-1416818056-612x612.jpg' ,id:1,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'turn on the kettle'),
//   Meal(name: 'Salad', time: '30 min', standard: 'Luxurious', difficulty:'Simple',imageUrl:'assets/images/istockphoto-1416818056-612x612.jpg' ,id:1,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'try yourself'),
//   Meal(name: 'Fresh Avocado', time: '15 min', standard: 'Luxurious', difficulty:'Simple',imageUrl:'assets/images/istockphoto-1416818056-612x612.jpg',id: 2 ,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'try yourself'),
//   Meal(name: 'Orange Mousse', time: '240 min', standard: 'Affordable', difficulty:'Hard',imageUrl:'assets/images/istockphoto-1416818056-612x612.jpg',id:2,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'try yourself' ),
//   Meal(name: 'Salad Avocado ', time: '30 min', standard: 'Luxurious', difficulty:'Simple',imageUrl:'assets/images/istockphoto-1371167585-640x640.jpg' ,id: 2,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'try yourself'),
//
//   Meal(name: 'Meat', time: '15 min', standard: 'Affordable', difficulty:'Simple',imageUrl:'assets/images/istockphoto-1371167585-640x640.jpg',id: 3,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'try yourself' ),
//   Meal(name: 'Juicy meat', time: '240 min', standard: 'Luxurious', difficulty:'Hard',imageUrl:'assets/images/istockphoto-1371167585-640x640.jpg',id:3 ,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'turn on the kettle'),
//   Meal(name: 'Salad', time: '30 min', standard: 'Affordable', difficulty:'Simple',imageUrl:'assets/images/istockphoto-1395140920-612x612.jpg' ,id: 3,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'try yourself'),
//
//   Meal(name: 'Salad', time: '15 min', standard: 'Affordable', difficulty:'Simple',imageUrl:'assets/images/istockphoto-1371167585-640x640.jpg',id: 4,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'try yourself' ),
//   Meal(name: 'Beans', time: '240 min', standard: 'Affordable', difficulty:'Hard',imageUrl:'assets/images/istockphoto-1402021474-612x612.jpg',id:4,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'turn on the kettle'),
//   Meal(name: 'Salad ', time: '30 min', standard: 'Affordable', difficulty:'Simple',imageUrl:'assets/images/istockphoto-1395140920-612x612.jpg' ,id: 4,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'try yourself'),
//
//   Meal(name: 'Fillet-fish With Salad', time: '15 min', standard: 'Affordable', difficulty:'Simple',imageUrl:'assets/images/istockphoto-1407144829-612x612.jpg',id: 5 ,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'try yourself'),
//   Meal(name: 'Beans', time: '240 min', standard: 'Luxurious', difficulty:'Hard',imageUrl:'assets/images/istockphoto-1395140920-612x612.jpg',id:5,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'turn on the kettle' ),
//   Meal(name: 'Fresh Salad ', time: '30 min', standard: 'Affordable', difficulty:'Simple',imageUrl:'assets/images/istockphoto-1416818056-612x612.jpg' ,id: 5,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'try yourself'),
//
//   Meal(name: 'Chicken With Salad', time: '15 min', standard: 'Affordable', difficulty:'Simple',imageUrl:'assets/images/istockphoto-1407144829-612x612.jpg',id: 6,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'try yourself' ),
//   Meal(name: 'Beans', time: '240 min', standard: 'Luxurious', difficulty:'Hard',imageUrl:'assets/images/istockphoto-1395140920-612x612.jpg',id:6,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'turn on the kettle' ),
//   Meal(name: 'Fresh Salad ', time: '30 min', standard: 'Affordable', difficulty:'Simple',imageUrl:'assets/images/istockphoto-1416818056-612x612.jpg' ,id: 6,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'try yourself'),
//
//   Meal(name: 'Fish', time: '15 min', standard: 'Affordable', difficulty:'Simple',imageUrl:'assets/images/istockphoto-1519649251-612x612.jpg',id: 7,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'try yourself' ),
//   Meal(name: 'Beans', time: '240 min', standard: 'Luxurious', difficulty:'Hard',imageUrl:'assets/images/istockphoto-1395140920-612x612.jpg',id:7 ,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'turn on the kettle'),
//   Meal(name: 'Fresh Salad ', time: '30 min', standard: 'Affordable', difficulty:'Simple',imageUrl:'assets/images/istockphoto-1416818056-612x612.jpg' ,id: 7,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'try yourself'),
//
//   Meal(name: 'Fish', time: '15 min', standard: 'Affordable', difficulty:'Simple',imageUrl:'assets/images/istockphoto-1519649251-612x612.jpg',id: 8 ,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'try yourself'),
//   Meal(name: 'Fresh Salad With Avocado', time: '240 min', standard: 'Luxurious', difficulty:'Hard',imageUrl:'assets/images/istockphoto-1416818056-612x612.jpg',id:8,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'turn on the kettle' ),
//   Meal(name: 'Fresh Salad ', time: '30 min', standard: 'Affordable', difficulty:'Simple',imageUrl:'assets/images/istockphoto-1416818056-612x612.jpg' ,id: 8,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'try yourself'),
//
//   Meal(name: 'Delicious Sandwich', time: '15 min', standard: 'Affordable', difficulty:'Simple',imageUrl:'assets/images/istockphoto-1457847465-612x612.jpg',id: 9 ,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'try yourself'),
//   Meal(name: 'Fresh Salad With Rice', time: '240 min', standard: 'Luxurious', difficulty:'Hard',imageUrl:'assets/images/istockphoto-1472680285-612x612.jpg',id:9 ,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'turn on the kettle'),
//   Meal(name: 'Fresh Salad ', time: '30 min', standard: 'Affordable', difficulty:'Simple',imageUrl:'assets/images/istockphoto-1416818056-612x612.jpg' ,id: 9,ingredients: '¼ red onion sliced.3 Persian cucumbers sliced.8 ounces smoked salmon thinly sliced.2 hard boiled eggs sliced.1 avocado sliced',steps: 'try yourself'),
// ];