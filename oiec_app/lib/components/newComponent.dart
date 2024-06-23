import 'package:flutter/material.dart';
import 'dart:io';

class Noticias extends StatelessWidget{

  final String newPicture;
  final String newTitle;
  final String newBrief;

  const Noticias({super.key, required this.newPicture, required this.newTitle, required this.newBrief});
  
  @override
  // ignore: avoid_renaming_method_parameters, avoid_types_as_parameter_names, non_constant_identifier_names
  Widget build(BuildContext){
    return InkWell(
        onTap:()=>{

        },
        child: Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
          ),
          child: Row(
            children: [
              Container(
                width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: FileImage(File(newPicture)),
                  fit: BoxFit.cover,
                )
              
              )
              ),
              const SizedBox(width: 10.0),

              Expanded(
                child: Column(
                  children: [
                    Text(
                      newTitle,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      )
                      )
                  ,const SizedBox(height: 5.0),

                  //Separador
                   Container(
                    height: 1.0,
                    color: Colors.black,
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                  ),
                  
                  Text(
                      newBrief,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      )
                  )
                    
                  

                  ]),)

            ],
            )
          )
    );
  }

}