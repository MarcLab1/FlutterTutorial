main() {
  var d1 = getSomething("Brian", age: 33);
  print(d1);

  var v1 = "Thing";
  printSomething(v1);
}

dynamic getSomething(String name, {int? age, double amount = 44.44}) {
  if (name.isNotEmpty)
    return "hello $name you are $age and make $amount an hour";
  else
    return 44;
}

void printSomething(item) {
  print(item);
}

/*
Const v Final

Const
Value must be known at compile time
const today ="2023/07/02"

Final
Value must be known at run time
final today = DateTime.now()
*/
