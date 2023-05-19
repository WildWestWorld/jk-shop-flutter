import 'package:shared_preferences/shared_preferences.dart';

// 这是一个 Storage 类实现了 kv 离线存储，它是基于 shared_preferences 包实现的。其主要作用是提供常见的存储操作方法，
// 例如  setString()  、  setBool()  、  setList()  、  getString()  、  getBool()  、  getList()  和  remove() 等。

// 这个类使用了Dart中的单例模式，也就是在类的内部维护了一个私有的、静态的、不可变的实例对象 _instance ，并提供了一个命名的私有构造函数 _internal() ，
// _internal()不能被外部访问。
//当需要获取类的实例时，通过一个工厂函数 factory Storage() => _instance 返回单例实例，这样可以确保整个应用程序中只存在一个 Storage 对象。

// 在 Storage 类的构造函数中，我们使用了 SharedPreferences.getInstance() 方法异步获得了一个 SharedPreferences 对象，
// 它是一个跨平台的 key-value 存储系统，可用于在应用程序的生命周期内进行简单的本地存储。

// 在存储方法中，我们使用了 await 来等待异步操作完成，并返回一个 Future 对象。
// 在获取方法中，我们使用了 ?? 运算符来处理空值的情况，并返回一个默认值。

// 在总体架构中，这个 Storage 类非常重要，因为它提供了一个轻量级的、可靠的数据存储方案，可以在整个应用程序中使用它来存储和读取配置和状态信息。

// 单例写法

// 这是一个Dart中的单例模式的实现，它通过一个私有的、静态的、不可变的实例对象 _instance 来确保整个应用程序中只存在一个 Storage 对象。
//  在 Storage 类中，我们使用了一个命名为 _internal() 的私有构造函数来创建对象，这样外部就不能通过 new 关键字创建一个 Storage 对象。
//  在构造函数中，我们初始化了一个 SharedPreferences 对象，我们在需要时可以使用该对象来存储和读取数据。
//  在声明 _instance 变量时，我们使用了 static 和 final 关键字来确保整个应用程序中只有一个实例对象，并且该对象是不可变的。
//  在工厂构造函数中，我们使用了一个简单的 => 表达式来返回 _instance 对象，这样就可以使用 Storage() 来获取单例实例。
//  这种单例模式可以在整个应用程序中使用，并且可以确保每次获取到的都是同一个类的实例。
//  因此，我们可以在应用程序中任何地方使用 Storage() 来访问单例对象，并进行数据存储和读取操作。

// 在Dart语言中，工厂函数是一种特殊的构造函数，其作用是返回一个已经存在的对象，而不是创建一个新的对象。
//  工厂函数常用于实现单例模式，这是一种设计模式，用于确保一个类只有一个实例。

// 在上述代码中，我们通过 _instance 变量创建了一个单例对象，并将其设置为不可变的。
// 当我们调用 Storage() 时，实际上调用的是一个工厂函数，即 factory Storage() => _instance; 。
// 该函数只返回一个已经存在的单例实例，而不会对这个实例进行任何其他操作。这样可以确保整个应用程序中只有一个 Storage 对象，从而节省内存空间并提高性能。

// 值得注意的是，工厂函数必须返回一个已经存在的对象，而不能返回一个新的对象。此外，工厂函数通常是静态方法，因为它们不需要访问实例变量。

// 没有创建 工厂函数的写法

// class Storage {
//   static Storage? _instance;
//   late SharedPreferences _prefs;

//   Storage._internal() {
//     SharedPreferences.getInstance().then((prefs) {
//       _prefs = prefs;
//     });
//   }

//   static Storage getInstance() {
//     if (_instance == null) {
//       _instance = Storage._internal();
//     }
//     return _instance!;
//   }
// }

/// kv离线存储
class Storage {
// 这是因为在这个例子中， Storage 类有两个构造函数。
// 一个是私有构造函数 Storage._internal() ，用于创建单例实例；
// 另一个是公有工厂构造函数 Storage() ，用于获取已经存在的单例实例。
// 在工厂构造函数 Storage() 中，我们需要调用 Storage._internal() 来获取 Storage 类的单例实例，因此需要在方法体中直接调用 Storage._internal() 。
//这样，当我们调用 Storage() 时，就可以返回已经存在的单例实例了。
// 而在私有构造函数 Storage._internal() 中，我们需要获取 SharedPreferences 实例并存储在 _prefs 变量中，
//因此需要在构造函数内部使用 SharedPreferences.getInstance() 方法来获取实例
//。这样，当我们创建 Storage 类的实例时，就可以自动获取 SharedPreferences 实例并存储在 _prefs 变量中了。
// 因此，在这个例子中， Storage 类的两个构造函数各自有不同的作用，需要分别调用并实现它们。

// 这是因为在这个例子中，私有构造函数 Storage._internal() 不需要定义任何内容或进行赋值操作。
// 它的主要作用是用于创建 Storage 类的单例实例，在调用 SharedPreferences.getInstance() 方法获取 SharedPreferences 实例之后
// ，将其存储在类的成员变量 _prefs 中。

// 在这个例子中，私有构造函数 Storage._internal() 的主要作用是实现单例模式
// ，因此它只需要被调用一次，然后将获取到的实例赋值给类的成员变量 _instance 。在之后的调用中，
// 我们就可以通过工厂构造函数 Storage() 来获取已存在的单例实例，而不需要重新创建实例了。

// 所以 Storage._internal() 函数的存在，是为了实现单例模式而创造的，而函数本身不需要进行其他操作，
// 只需要在调用时返回 Storage 类的单例实例即可。

  // 调用获取单例的方法，返回并赋值给_instance

  // 创建获取单例的方法
  //删除了这个方法，上面的实例也不回被创建
  // ignore: empty_constructor_bodies
  Storage._internal() {}

  factory Storage() {
    // 工厂函数返回实例 来确保整个应用程序中只存在一个 Storage 对象。
    return _instance;
  }

  static final Storage _instance = Storage._internal();

  late final SharedPreferences _prefs;

  Future<void> init() async {
    // SharedPreferences.getInstance 是SharedPreferences自带的初始化方法
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setList(String key, List<String> value) async {
    return await _prefs.setStringList(key, value);
  }

  String getString(String key) {
    return _prefs.getString(key) ?? '';
  }

  bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  List<String> getList(String key) {
    return _prefs.getStringList(key) ?? [];
  }

  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }
}
