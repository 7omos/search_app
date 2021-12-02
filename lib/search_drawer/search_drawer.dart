import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _typeAheadController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> searchData=["afifi",'moaz','yousef','ahmed','saleh','ahhhhh','yooooou','gamal'];
  List getSuggestions(String query){
    List<String>matches=[];

    if(query.length>0){
      matches.addAll(searchData);
      matches.retainWhere((element) => element.toLowerCase().contains(query.toLowerCase()));
    }
    return matches;
  }
  Widget showText(String text){
    return Text(text);
  }
  String text='';
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("ahmed 3adel"),),
          drawer: Drawer(
            child: ListView(children: [
              ListTile(
                title: Text("open page"),
                leading: Icon(Icons.home),

              )
            ],),
          ),
          body: Column(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: this._formKey,
                  child: TypeAheadFormField(
                    textFieldConfiguration: TextFieldConfiguration(
                      decoration: InputDecoration(
                        labelText: "search",
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                      ),
                    ),
                    itemBuilder: (_, suggestion) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(suggestion),
                      );
                    },
                    suggestionsCallback: (pattern){
                      return getSuggestions(pattern);
                    },
                    transitionBuilder: (context, suggestionsBox, controller) {
                      return suggestionsBox;
                    },
                    onSuggestionSelected: (suggestion) {
                      setState(() {
                        text=suggestion;
                        // _typeAheadController.text = suggestion;

                      });
                    },
                    validator: (value){
                      if (value.isEmpty) {
                        return 'Please select a city';
                      }
                      return null;
                    },
                  ),

                ),
              ),SizedBox(height: 20,),

              Text(text),
            ],
          ),
        ));
  }
}