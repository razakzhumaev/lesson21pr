// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

void main(List<String> args) {
  Kelvin kelvin = Kelvin(0);
  // kelvin.convert();
  Farengeit farengeit = Farengeit(0);
  // farengeit.convert();

  Tiles tiles = Tiles(brand: 'lacoste', size_h: '10km', size_w: '5km', price: 100);
  // tiles.getData();

  Children children = Children('razak', 'zhumaev', 18);
  // children.displayData();

  Soda soda = Soda(adding: 'сироп');
  // soda.show_my_drink();

  Worker razak = Razak(name: 'razak', surname: 'zhumaev', rate: 100, days: 30);
  // razak.getSalary();

  Tunnel tunnel = Tunnel(
      tunnel_height: 20, tunnel_width: 10, train_height: 19, train_width: 1);
  // tunnel.compare();

  Burger burger = Burger_big_small();
  burger.choose();
  burger.filling();
  burger.additionally();
}

abstract class BaseConverter {
  void convert();
}

class Kelvin extends BaseConverter {
  int degree;
  Kelvin(this.degree);
  @override
  void convert() {
    print('Цельсий $degree равняется ${degree + 273.15} Кельвинам');
  }
}

class Farengeit extends BaseConverter {
  int degree;
  Farengeit(this.degree);
  @override
  void convert() {
    print('Цельсий $degree равняется ${degree * 9 / 5 + 32} Фаренгейтам');
  }
}

class Tiles {
  String brand;
  String size_h;
  String size_w;
  int price;

  Tiles({
    required this.brand,
    required this.size_h,
    required this.size_w,
    required this.price,
  });

  void getData() {
    print('brand is $brand');
    print('size_h is $size_h');
    print('size_w is $size_w');
    print('price is $price');
  }
}

class Children {
  String _name;
  String _surname;
  int _age;

  Children(
    this._name,
    this._surname,
    this._age,
  );

  void displayData() {
    print('Имя: $_name');
    print('Фамилия: $_surname');
    print('Возраст: $_age');
  }
}

class Soda {
  String? adding;

  Soda({required this.adding});

  void show_my_drink() {
    if (adding == null) {
      print('Обычная газировка');
    } else {
      print('Газировка и $adding');
    }
  }
}

abstract class Worker {
  void getSalary();
}

class Razak extends Worker {
  String name;
  String surname;
  int rate;
  int days;
  Razak({
    required this.name,
    required this.surname,
    required this.rate,
    required this.days,
  });

  @override
  void getSalary() {
    print('$surname $name получает зарплату ${rate * days}');
  }
}

class Tunnel {
  int tunnel_height;
  int tunnel_width;
  int train_height;
  int train_width;

  Tunnel({
    required this.tunnel_height,
    required this.tunnel_width,
    required this.train_height,
    required this.train_width,
  });

  void compare() {
    if (train_height < tunnel_height && train_width < tunnel_width) {
      print('Поезд проходит через туннель');
    } else {
      print('Поезд разобьется');
    }
  }
}

abstract class Burger {
  void choose();
  void filling();
  void additionally();
}

class Burger_big_small extends Burger {
  int price = 0;
  int calories = 0;

  @override
  void choose() {
    print(
        'Выберите бургер (1 - маленький(50сом , 20 калорий) , 2 - большой(100сом , 40 калорий))');
    int choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      print('Вы выбрали маленький бургер');
      print('Настоящая сумма оплаты = ${price += 50}');
      print('Настоящая калорийность ${calories += 20}');
    } else if (choice == 2) {
      print('Вы выбрали большой бургер');
      print('Настоящая сумма оплаты = ${price += 100}');
      print('Настоящая калорийность ${calories += 40}');
    } else {
      print('Введите строго цифру 1 или 2');
      choose();
    }
  }

  @override
  void filling() {
    print(
        'Выберете начинку(1 - с сыром , 2 - с салатом , 3 - с картофелем , 4 - все сразу)');
    int choice2 = int.parse(stdin.readLineSync()!);

    if (choice2 == 1) {
      print('Вы выбрали сырную начинку');
      print('Настоящая сумма оплаты = ${price += 10}');
      print('Настоящая калорийность ${calories += 20}');
    } else if (choice2 == 2) {
      print('Вы выбрали начинку в виде салата');
      print('Настоящая сумма оплаты = ${price += 20}');
      print('Настоящая калорийность ${calories += 5}');
    } else if (choice2 == 3) {
      print('Вы выбрали начинку в виде картофеля');
      print('Настоящая сумма оплаты = ${price += 15}');
      print('Настоящая калорийность ${calories += 10}');
    } else if (choice2 == 4) {
      print('Вы выбрали все виды начинок');
      price += 10 + 20 + 15;
      calories += 20 + 5 + 10;
    } else {
      print('Введите строго цифру 1 , 2 , 3 или 4');
      filling();
    }
  }

  @override
  void additionally() {
    print(
        'Дополнитель можно посыпать приправой(цифра 1) и полить майонезом(цифра 2)');
    int choice3 = int.parse(stdin.readLineSync()!);

    if (choice3 == 1) {
      price += 15;
      calories += 0;
    } else if (choice3 == 2) {
      price += 20;
      calories += 5;
    } else {
      print('Введите строго цифру 1 или 2');
      additionally();
    }

    print(
        'Конечная стоимость бургера обойдется вам в $price сом и калорийность этого бургера будет $calories');
  }
}
