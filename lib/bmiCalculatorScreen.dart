import 'package:ex/bmiModel.dart';
import 'package:ex/resultScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {

  BMIModel _bmiModel;

  double _heightOfUser = 100.0;
  double _weightOfUser = 40.0;
  double _bmi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 200.0,
                  width: 200.0,
                  child: Image(
                    image: AssetImage('images/i1.png'),
                    fit: BoxFit.contain,
                  )

              ),
              SizedBox(height: 8.0,),
              Text('BMI Calculator',style: TextStyle(color: Colors.red[700],fontWeight: FontWeight.w700,fontSize: 34.0),),
              Text('We care about your health',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 15.0),),
              SizedBox(height: 32.0,),
              Text('Height(cm)',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700,fontSize: 24.0),),
              Container(
                padding: EdgeInsets.only(left: 16.0,right: 16.0),
                child: Slider(
                  min: 80.0,
                  max: 250.0,
                  onChanged: (height){
                    setState(() {
                      _heightOfUser = height;
                    });
                    },
                  value: _heightOfUser,
                  divisions: 100,
                  activeColor: Colors.pink,
                  label: "$_heightOfUser",
                ),
              ),
              Text('$_heightOfUser',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w900,fontSize: 18.0),),

              SizedBox(height: 24.0,),

              Text('Weight(Kg)',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700,fontSize: 24.0),),
              Container(
                padding: EdgeInsets.only(left: 16.0,right: 16.0),
                child: Slider(
                  min: 30.0,
                  max: 120.0,
                  onChanged: (height){
                    setState(() {
                      _weightOfUser = height;
                    });
                  },
                  value: _weightOfUser,
                  divisions: 100,
                  activeColor: Colors.pink,
                  label: "$_weightOfUser",
                ),
              ),
              Text('$_weightOfUser',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w900,fontSize: 18.0),),
             SizedBox(height: 16.0,),
             Container(
               padding: EdgeInsets.only(left: 16.0,right: 24.0),
               width: double.infinity,
               color: Colors.pink,

               child:  FlatButton.icon(
                 label: Text('CALCULATE',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
                 icon: Icon(Icons.favorite,color: Colors.white,),
                 onPressed: () {
                       setState(() {
                         _bmi = _weightOfUser/((_heightOfUser/100)*(_heightOfUser/100));

                         if(_bmi >= 18.5 && _bmi <=25){

                            _bmiModel = BMIModel(bmi: _bmi ,isNormal: true,comments: "You are normaly fit" );
                         }

                         else if(_bmi < 18.5){

                           _bmiModel = BMIModel(bmi: _bmi ,isNormal: false,comments: "You are underweighted" );

                         }

                         else if(_bmi >25 && _bmi <= 30){

                           _bmiModel = BMIModel(bmi: _bmi ,isNormal: false,comments: "You are overweighted" );

                         }
                         else{

                           _bmiModel = BMIModel(bmi: _bmi ,isNormal: false,comments: "You are obesed" );

                         }

                       });
                       
                       Navigator.push(context, MaterialPageRoute(

                           builder:(context) =>ResultScreen(bmiModel: _bmiModel,)

                       ));

                 },
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
