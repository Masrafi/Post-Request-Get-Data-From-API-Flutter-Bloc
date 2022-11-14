import 'package:apicalling/bloc/api_bloc.dart';
import 'package:apicalling/bloc/api_event.dart';
import 'package:apicalling/bloc/api_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/model.dart';
import '../repo/repository.dart';
import 'view_data.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Email Screen"),
      ),
      body: BlocListener<ApiBloc, ApiState>(
        listener: (context, state) {
          if (state is ApiIsLoaded) {
            List<ApiModel> userList = state.getWeather;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ViewData(userdata: userList)));
          }
        },
        child: BlocBuilder<ApiBloc, ApiState>(builder: (context, state) {
          if (state is ApiNotSearched) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                ),
                ElevatedButton(
                  onPressed: () async {
                    BlocProvider.of<ApiBloc>(context)
                        .add(ApiFetch(emailController.text));
                    emailController.clear();
                    await Future.delayed(const Duration(seconds: 6));
                  },
                  child: const Text("Search"),
                ),
              ],
            );
          }
          if (state is ApiIsLoading) {
            return const Center(child: const CircularProgressIndicator());
          }
          // if (state is ApiIsLoaded) {
          //   List<ApiModel> userList = state.getWeather;
          //   print("This is Data: $userList");
          //   return ViewData(
          //     userdata: userList,
          //   );
          // return ListView.builder(
          //     itemCount: userList.length,
          //     itemBuilder: (_, index) {
          //       return Card(
          //         color: Colors.blue,
          //         elevation: 4,
          //         margin:
          //             const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //         child: ListTile(
          //           title: Text(
          //             userList[index].tendersource,
          //             style: const TextStyle(color: Colors.white),
          //           ),
          //           subtitle: Text(
          //             userList[index].workdesc,
          //             style: const TextStyle(color: Colors.white),
          //           ),
          //         ),
          //       );
          //     });
          //}
          if (state is ApiErrorState) {
            return const Center(
              child: Text(
                "Error",
                style: TextStyle(color: Colors.black, fontSize: 50),
              ),
            );
          }
          return Container();
        }),
      ),
    );
  }
}
