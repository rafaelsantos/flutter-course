import 'package:flutter/material.dart';
import 'package:store/data/productData.dart';

class ProductTile extends StatelessWidget {

  final String type;
  final ProductData data;

  ProductTile(this.type, this.data);

  @override
  Widget build(BuildContext context) {
    //Could be inkwell or gesture detector, but inkwell will create a animation
    return InkWell(
      child: Card(
        child: type == "grid" ?
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 0.8,
                child: Image.network(
                  data.images[0],
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text(data.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        "R\$ ${data.price.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        : Row(),
      ),
    );
  }
}
