import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  StarRating(this.rating,{super.key});
  double rating;
  final maxrating = 5;
  @override
  Widget build(BuildContext context) {
    return Row(
      children:List.generate(maxrating, (index){
        if(index<rating){

          if(rating-index < 1){

            return Icon(Icons.star_half,color: Colors.black,size: 20,);
          }else{
            return Icon(Icons.star,color: Colors.black,size: 20,);
          }
        }else{
          return Icon(Icons.star,color: Colors.grey,size: 20,);
        }






      }),


    );
  }
}