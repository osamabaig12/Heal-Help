/*SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //Image(image: ),//<< any widgets added
            //SizedBox(),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text('header'),  //<< any widgets added
                Container(
                    height: queryData.size.height,
                    child: ListView.separated(
                  //scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  //here your code
                    scrollDirection: Axis.vertical,
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 150,
                        color: Colors.amber[colorCodes[index]],
                        child: Center(child: Text('Entry ${entries[index]}')),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => const Divider(),
                )
                ),
                Divider(),//<< any widgets added
              ],
            ),

          ],
        ),
      )*/





/*ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),*/






















