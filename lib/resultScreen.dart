import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {

  final bmiModel;

  ResultScreen({this.bmiModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
                height: 200.0,
                width: 200.0,
                child: bmiModel.isNormal ? Image(image: AssetImage('images/happy.png'),fit: BoxFit.contain,):Image(image: AssetImage('images/sad.png'),fit: BoxFit.contain,)

            ),
            SizedBox(height: 8.0,),
            Text('Your BMI is ${bmiModel.bmi.round()}',style: TextStyle(color: Colors.red[700],fontWeight: FontWeight.w700,fontSize: 34.0),),
            Text('${bmiModel.comments}',style: TextStyle(color: Colors.grey[700],fontWeight: FontWeight.w500,fontSize: 18.0),),
            SizedBox(height: 16.0,),
            bmiModel.isNormal ?
            Text('Hurray! Your BMI is normal',style: TextStyle(color: Colors.red[700],fontWeight: FontWeight.w700,fontSize: 18.0),):
            Text('Hurray! Your BMI is not normal',style: TextStyle(color: Colors.red[700],fontWeight: FontWeight.w700,fontSize: 18.0),),

            SizedBox(height: 16.0,),
            Container(
              padding: EdgeInsets.only(left: 16.0,right: 24.0),
              width: double.infinity,
              color: Colors.pink,

              child:  FlatButton.icon(
                label: Text('LET CALCULATE AGAIN',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
                icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                onPressed: () {
                  Navigator.pop(context);
                }

              )
            )


          ],
        ),
      ),
    );
  }
}
