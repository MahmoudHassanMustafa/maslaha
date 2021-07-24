import 'package:flutter/material.dart';
class AppBarProfile extends StatelessWidget {
  var rating;
  AppBarProfile({this.rating});
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 43,
        left: 15,
        right: 15,
        child:Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: Icon(Icons.arrow_back_ios,size: 40,color: Colors.white,),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
//              GestureDetector(
//                child: Icon(Icons.favorite_border,size: 40,color: Colors.white,),
//                onTap: (){
//                  Navigator.pop(context);
//                },
//              ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.all(4),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.star,color: Colors.yellow,),
                    SizedBox(
                      width: 2,
                    ),
                    Text(rating.toString(),style: TextStyle(
                      color: Colors.black
                    ),),
                    SizedBox(
                      width: 2,
                    ),
                  ],
                ),
              ),
            )
            ],
          ),
        ));
  }
}
