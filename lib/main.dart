import 'package:flutter/material.dart';
import 'package:test_project/Screen/Auth//loginScreen.dart';
import 'package:test_project/Screen/Auth//signUpScreen.dart';
import 'package:test_project/Screen/Auth/SplashScreen.dart';
import 'package:test_project/Screen/Auth/landingScreen.dart';
import 'package:test_project/Screen/User/addUser.dart';
import 'package:test_project/Screen/User/todo.dart';
import 'package:test_project/utilities/shared_pref.dart';
import 'question.dart';
import 'questionMap.dart';
import 'package:get/get.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  runApp(const TestingApp());
}

class TestingApp extends StatelessWidget {
  const TestingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
        // initialRoute: "/LandingScreen",
        // getPages: [
        // GetPage(name: "/LandingScreen", page: ()=> const LandingScreen()),
        //   GetPage(name: "/TodoApp", page: ()=>  const TodoApp()),
        //   GetPage(name: "/addUser", page: ()=>   const AddUser(checkingUser: -1)),
        //   GetPage(name: "/login", page: ()=> LoginScreen()),
        //   GetPage(name: "/signUp", page: ()=> SignUpScreen()),
        //   GetPage(name: "/splashScreen", page: ()=> SplashScreen()),
        // ],

    home: const SplashScreen()
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key, required this.title, required this.title2}) : super(key: key);

  final String title;
  final String title2;
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int _counter =0;
  // collections are two types
  // list creation
  var questions = ['what`s your favorite color?', 'What`s your favorite animal?','What`s your favorite snacks?'];
  // map creations

  void _incrementCount(){
    setState(() {
      _counter++;

    });
  }
  int answerQuestionIndex=0;
  void answerQuestion(){
    if(answerQuestionIndex==2){

    }else {
      setState(() {
        answerQuestionIndex++;
      });
    }
    print(questions[answerQuestionIndex]);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title2),
      ),
      body:
      Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const QuestionMap(),
            const Testing(),
            Align(
                alignment: Alignment.topRight,
                child: Text(widget.title2, style: const TextStyle(color: Colors.blue, fontSize: 30),textAlign: TextAlign.left,)),

            Text(widget.title2, style: const TextStyle(color: Colors.blue),textAlign: TextAlign.left,),
            Text("$_counter"),
            const Text("const will be static values", textDirection: TextDirection.rtl),
            Question( _incrementCount,"Press It"),
            Text(questions.elementAt(answerQuestionIndex)),
            ElevatedButton(onPressed: answerQuestion, child: Text(questions[0])),
            const Text("questions"),
            ElevatedButton(onPressed: ()=>{
              print("anonymous function")
            }, child: Text(questions.elementAt(1))),
            const Text("question"),
            ElevatedButton(
                style:  ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.pink), foregroundColor: MaterialStateProperty.all(Colors.deepOrange)),
                onPressed: () {
              print("second type anonymous function");
            }, child: Text(questions.elementAt(2)))
          ],
        ),
),
      floatingActionButton: FloatingActionButton(
      onPressed: _incrementCount,
      tooltip: "Increment",
      child: const Icon(Icons.add),
    ),


    );
  }
}

class Testing extends StatelessWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
     margin: const EdgeInsets.all(40),
     child: Column(
       children: const <Widget> [
          Text("const will be static values",

           textDirection: TextDirection.rtl,
           style: TextStyle(color: Colors.green),textAlign: TextAlign.right,),
         Text("const will be static values",

           textDirection: TextDirection.rtl,
           style: TextStyle(color: Colors.green),textAlign: TextAlign.right,),

       ],
     )
    );


  }
}
