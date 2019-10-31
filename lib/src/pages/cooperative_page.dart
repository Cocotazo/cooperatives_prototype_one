import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CooperativePage extends StatelessWidget {

  Size screenSize;

  @override
  Widget build(BuildContext context) {

    screenSize = MediaQuery.of(context).copyWith().size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(245, 115, 127, 1.0),
      ),
      body: Stack(
        children: <Widget>[
          _buildBack(),
          Container(
            margin: EdgeInsets.only(left: 20.0, top: 70.0, bottom: 50.0),
            child: Text(
                'Cootracesar',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold
                )
            ),
          ),
        ],
      ),
    );
  }

  Column _buildBack() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                  colors: [
                    Color.fromRGBO(245, 115, 127, 1.0),
                    Color.fromRGBO(245, 90, 110, 1.0)
                  ]
              )
          ),
          //padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 70.0),
          //color: Color.fromRGBO(245, 115, 127, 1.0),
          height: screenSize.height*0.2,
          width: double.infinity,
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: _contentDrivers(),
          ),
        )
      ],
    );
  }

  Widget _contentDrivers() {
    return Container(
      width: double.infinity,
      height: screenSize.height*0.8,
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 20.0
                  )
                ]
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://www.w3schools.com/howto/img_avatar.png'),
              ),
              title: Text('Conductor 01'),
              subtitle: Text('Camioneta'),
              trailing: Icon(Icons.airport_shuttle, color: Colors.green,),
              onTap: (){},
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 20.0
                  )
                ]
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://www.w3schools.com/howto/img_avatar.png'),
              ),
              title: Text('Conductor 02'),
              subtitle: Text('Vechiculo'),
              trailing: Icon(Icons.airport_shuttle, color: Colors.red,),
              onTap: (){},
            ),
          )
        ],
      ),
    );
  }
}
