import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'BMI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 var wtController =TextEditingController();
 var ftController =TextEditingController();
 var inController =TextEditingController();
 var result="";
 var bgColor=Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('BMI'),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BMI",
                  style:TextStyle(
                      fontSize: 34,
                      fontWeight:FontWeight.w700),),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text("Enter your Weight(in Kgs)"),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 21),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text("Enter your height(in Feet)"),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text("Enter your height(in Inch)"),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                    onPressed: (){
                     var wt=wtController.text.toString();
                     var ft=ftController.text.toString();
                     var inch=inController.text.toString();

                     if(wt!=""&&ft!=""&&inch!=""){
                       //Bmi calculation
                       var iWt=int.parse(wt);
                       var iFt=int.parse(ft);
                       var iInch=int.parse(inch);

                       var tInch=(iFt*12)+iInch;
                       var tCm=tInch*2.54;
                       var tM=tCm/100;
                       var bmi=(iWt)/(tM*tM);
                       var msg="";
                       if(bmi>25){
                         msg="You're OverWeight!!";
                         bgColor=Colors.orange.shade200;
                       }else if(bmi<18)
                         {
                           msg="You're UnderWeight!!";
                           bgColor=Colors.red.shade200;
                         }
                       else{
                         msg="You're Healthy!!";
                         bgColor=Colors.green.shade200;
                       }

                       setState(() {
                         result="$msg \n  Your BMI is: ${bmi.toStringAsFixed(2)}";
                       });

                     }
                     else{
                        setState(() {
                          result="Please fill the all the required blanks!!";
                        });
                     }

                    },
                    child: Text('Calculate')),
                 SizedBox(height: 11),
                Text(result,style: TextStyle(fontSize: 19),),
              ],
            ),
          ),
        ),
      )

    );
  }
}
