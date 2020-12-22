import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => _BottomNavigationBarExampleState();
}

class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}


class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _poocount = 0;

  int _peecount = 0;
  int _eatcount = 0;
  int _walkcount = 0;
  int _currentTabIndex = 0;
  int _counter1 = 0;
  int _counter2 = 0;
  int _counter3 = 0;



  void _incrementPoo() {
    setState(() {
      _poocount++;
    });
  }

  void _incrementPee() {
    setState(() {
      _peecount++;
    });
  }

  void _incrementEat() {
    setState(() {
      _eatcount++;
    });
  }

  void _incrementWalk() {
    setState(() {
      _walkcount++;
    });
  }

  void _incrementCounter1() {
    setState(() {
      _counter1++;
    });
  }

  void _incrementCounter2() {
    setState(() {
      _counter2++;
    });
  }

  void _incrementCounter3() {
    setState(() {
      _counter3++;
    });
  }


  @override
  Widget build(BuildContext context) {

    //
    var data = [
      ClicksPerYear('2018', _counter1, Colors.red),
      ClicksPerYear('2019', _counter2, Colors.yellow),
      ClicksPerYear('2020', _counter3, Colors.green),
    ];

    var series = [
      charts.Series(
        domainFn: (ClicksPerYear clickData, _) => clickData.year,
        measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
        colorFn: (ClicksPerYear clickData, _) => clickData.color,
        id: 'Clicks',
        data: data,
      ),
    ];

    var chart = charts.BarChart(
      series,
      animate: true,
    );

    var chartWidget = Padding(
      padding: EdgeInsets.all(32.0),
      child: SizedBox(
        height: 200.0,
        child: chart,
      ),
    );

    var buttons = new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FloatingActionButton(
          onPressed: _incrementCounter1,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: _incrementCounter2,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: _incrementCounter3,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ],
    );


    var poobutton = new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
      FloatingActionButton(
      onPressed: _incrementPoo,
      tooltip: 'Increment',
      child: Icon(Icons.add),
    ),
    ],
    );

    var peebutton = new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FloatingActionButton(
          onPressed: _incrementPee,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ],
    );

    var Eatbutton = new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FloatingActionButton(
          onPressed: _incrementEat,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ],
    );



    var PooBox  = new Container(
      child: Material(
      child: InkWell(onTap: (){
        _incrementPoo();
        _incrementCounter1();
      },
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.orange,
            child: Column(
              children: <Widget> [
                Text(
                  '$_poocount',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Expanded(
                  child: Image(
                    image: new AssetImage('assets/images/poop.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ],)
        ),
      ),
      ),
    );


    var PeeBox  =  new Container(
      child: InkWell(onTap: (){
        _incrementPee();
        _incrementCounter2();
      },
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.pink,
            child: Column(
              children: <Widget> [
                Text(
                  '$_peecount',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Expanded(
                  child: Image(
                    image: new AssetImage('assets/images/pee.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ],)
        ),
      ),
    );


    var EatBox  =  new Container(
      child: InkWell(onTap: (){
        _incrementEat();
        _incrementCounter3();
      },
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
      color: Colors.yellow,
      child: Column(
        children: <Widget> [
        Text(
          '$_eatcount',
          style: Theme.of(context).textTheme.headline4,
        ),
           Expanded(
            child: Image(
            image: new AssetImage('assets/images/food.png'),
            fit: BoxFit.cover,
          ),
           ),
      ],)
      ),
      ),
    );

    var WalkBox  =  new Container(
      child: InkWell(onTap: (){
        _incrementWalk();
              },
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.lightBlue,
            child: Column(
              children: <Widget> [
                Text(
                  '$_walkcount',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Expanded(
                  child: Image(
                    image: new AssetImage('assets/images/walk.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ],)
        ),
      ),
    );

    final _kTabPages = <Widget>[
      Center(child: GridView.count(

    crossAxisCount: 2,
          childAspectRatio: 0.80,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
           shrinkWrap: true,
           children: <Widget>[
            Draggable(child: PooBox,
                feedback: Container (
                  width: MediaQuery.of(context).size.width / 2,
                  child: Card(
                    color: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Image(
                    image: new AssetImage('assets/images/poop.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                ),
          childWhenDragging: Container()
         ,),
    Draggable(child: PeeBox,
    feedback: Container (
    width: MediaQuery.of(context).size.width / 2,
    child: Card(
    color: Colors.lightBlue,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
    ),
    child: Image(
    image: new AssetImage('assets/images/pee.png'),
    fit: BoxFit.fill,
    ),
    ),
    ),
    childWhenDragging: Container()
    ,),
             Draggable(child: EatBox,
               feedback: Container (
                 width: MediaQuery.of(context).size.width / 2,
                 child: Card(
                   color: Colors.lightBlue,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(15.0),
                   ),
                   child: Image(
                     image: new AssetImage('assets/images/food.png'),
                     fit: BoxFit.fill,
                   ),
                 ),
               ),
               childWhenDragging: Container()
               ,),
             Draggable(child: WalkBox,
               feedback: Container (
                 width: MediaQuery.of(context).size.width / 2,
                 child: Card(
                   color: Colors.lightBlue,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(15.0),
                   ),
                   child: Image(
                     image: new AssetImage('assets/images/walk.png'),
                     fit: BoxFit.fill,
                   ),
                 ),
               ),
               childWhenDragging: Container()
               ,)
           ]
      ),),
      Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
      Column( children: [
        Container(decoration: BoxDecoration(
              color: Colors.red[500],
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),

    width:200.0,
    height: 200.0,
    child: Center(child:
    ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: new Image.asset('assets/images/cube.png',width:150.0,height:150.0))
    )
        ),
      ],
      ),
            Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          chartWidget,
             ],
      ),),
    ];
    final _kBottmonNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Pet'),
      BottomNavigationBarItem(icon: Icon(Icons.check_circle_outline), label: 'Track'),
      BottomNavigationBarItem(icon: Icon(Icons.insert_chart), label: 'Analyze'),
      BottomNavigationBarItem(icon: Icon(Icons.perm_contact_calendar_rounded), label: 'Analyze'),
    ];
    assert(_kTabPages.length == _kBottmonNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      items: _kBottmonNavBarItems,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );
    return Scaffold(
      body: _kTabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
