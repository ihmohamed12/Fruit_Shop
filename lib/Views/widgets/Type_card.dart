import 'package:flutter/material.dart';
import 'package:fruitzzz_shop/Views/Screens/User_page.dart';
import 'package:fruitzzz_shop/Model/Product.dart';

callback(List<Product> grid){

  }


class Type_card extends StatefulWidget {
  Function callback;

  Type_card({ required this.callback});

  @override
  State<Type_card> createState() => _Type_card();

}


List<bool> _flag = [true,true,true,true,true];

class _Type_card extends  State<Type_card>  {


  // popular();
  List<Product> Grid = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) => Card(
        shadowColor: Colors.transparent,
        //specify the button's elevation color

        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(15.0),
        ),
        child:

        RaisedButton(
            elevation: 0,
            hoverElevation: 0,
            focusElevation: 0,
            highlightElevation: 0,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15.0),
            ),
            onPressed: () {
              setState(() {

                Grid = List.from(items);

                for (int j = 0; j < _flag.length; j++)
                  if (i != j)
                    _flag[j] = true;
                  else
                    _flag[j] = !_flag[j];

                if (!_flag[i])
                  for (int j = 0;
                  j < Grid.length;
                  j++) {
                    if (Grid[j].Type ==
                        items[i].Type) {
                      Grid.remove(Grid[j]);
                      j--;
                    }
                  }
                else
                  Grid = List.from(items);
                widget.callback(Grid);
                print(items.length);
              });
            },
            color: _flag[i] ? Colors.white : Colors.red,
            splashColor: Colors.red,
            // Text Color (Foreground color)

            child: Row(children: <Widget>[
              SizedBox(
                // <-- SEE HERE
                width: MediaQuery.of(context).size.width *
                    0.08,
                height: MediaQuery.of(context).size.height *
                    0.08,
                child: Image(
                    image: AssetImage(items[i].ImagePath)),
              ),
              Text(items[i].Type,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'Churchward Isabella')),
            ])),
      ),
    );

    //  return


  }

}