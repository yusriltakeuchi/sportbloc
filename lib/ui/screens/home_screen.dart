import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportbloc/core/bloc/sport_bloc.dart';
import 'package:sportbloc/core/models/sport_model.dart';
import 'package:sportbloc/core/repository/sport_repository.dart';
import 'package:sportbloc/ui/widgets/custom_textfield.dart';
import 'package:sportbloc/ui/widgets/widget_state.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SportBloc",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: HomeBody(),
      )
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  SportBloc sportBloc = new SportBloc();

  @override
  void dispose() {
    super.dispose();
    sportBloc.close();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sportBloc,
      child: BlocBuilder(
        bloc: sportBloc,
        builder: (BuildContext context, SportState state) {
          return Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                CustomTextField(
                  action: TextInputAction.done,
                  type: TextInputType.text,
                  hintText: "Cari nama pemain",
                  onChange: (String value) {
                    BlocProvider.of<SportBloc>(context).add(SearchTextChangedEvent(searchName: value));
                  },
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: BlocBuilder(
                    bloc: sportBloc,
                    builder: (BuildContext context, SportState state) {
                      if (state is SportInitial) {
                        return Container();
                      }
                      else if (state is SportFetchingState) {
                        return WidgetState.Loading(context);
                      } else if (state is SportFetchedState) {
                        return ItemList(sportData: state.sportData,);
                      } else if (state is SportEmptyState) {
                        return WidgetState.NotFound(context);
                      } else if (state is SportErrorState) {
                        return WidgetState.Error(context);
                      }
                    },
                  )
                )
              ],
            ),
          );
        }
      )
    );
  }
}

class ItemList extends StatelessWidget {
  List<SportModel> sportData;
  ItemList({this.sportData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: sportData.length,
        itemBuilder: (context, index) {

          var sport = sportData[index];
          return Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: InkWell(
                onTap: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.network(sport.imageUrl, width: 64, height: 64),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            sport.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: <Widget>[
                            Image.network(sport.clubFlag, width: 16, height: 16),
                            SizedBox(width: 5),
                            Text(
                              sport.clubName,
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        } 
      )
    );
  }
}