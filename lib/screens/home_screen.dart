import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';
import '../cubit/state.dart';
import '../models/group_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var messageAllGroupController = TextEditingController();
    var groupNameController = TextEditingController();
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()..getUserData()..getGroup(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {

          HomeCubit.get(context).getUserData();
          HomeCubit.get(context).getGroup();
          return Scaffold(
            appBar: AppBar(
              actions: [
                Builder(builder: (context) {
                  return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      icon: Icon(
                        Icons.segment,
                      ));
                })
              ],
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => Dialog(
                          backgroundColor: Colors.green,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'add group',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: groupNameController,
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'group name is empty';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Group name',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  child: MaterialButton(
                                    onPressed: () {
                                     HomeCubit().setGroup(name: groupNameController.text);
                                    },
                                    child: Text(
                                      'Add',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )));
                },
                child: Icon(
                  Icons.group_add,
                  size: 30,
                )),
            body: Container(
              decoration: BoxDecoration(),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          height: 100,
                          width: double.infinity,
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional.bottomCenter,
                                child: Container(
                                  width: double.infinity,
                                  height: 80.0,
                                  child: Card(
                                    color: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional.bottomCenter,
                                        child: Text(
                                          'NO. group',
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.topCenter,
                                child: CircleAvatar(
                                  radius: 28.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 25.0,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            '${HomeCubit.get(context).groupModel.length}',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                            child: Container(
                          height: 100,
                          width: double.infinity,
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional.bottomCenter,
                                child: Container(
                                  width: double.infinity,
                                  height: 80.0,
                                  child: Card(
                                    color: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional.bottomCenter,
                                        child: Text(
                                          'table',
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.topCenter,
                                child: CircleAvatar(
                                  radius: 28.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 25.0,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.table_chart),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),

                    Card(
                      color: Colors.green,
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                  backgroundColor: Colors.green,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Card(
                                            clipBehavior: Clip.hardEdge,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                '....',
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            )),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        TextFormField(
                                          controller: messageAllGroupController,
                                          keyboardType: TextInputType.text,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'message is empty';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            hintText: 'write here....',
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20.0))),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional.bottomEnd,
                                          child: MaterialButton(
                                            onPressed: () {
                                              // HomeCubit()
                                              //     .setMessageForAllGroup(
                                              //     messageText: messageAllGroupController.text).then((value)
                                              // {
                                              //   Navigator.pop(context);
                                              // });
                                            },
                                            child: Text(
                                              'edite',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Send massage for all',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.message,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),

                    // TITLE and search
                    Row(
                      children: [
                        Text(
                          'Groups',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'search',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),

                    // list view
                    Expanded(
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) => itemList(
                              index: index,
                              model: HomeCubit.get(context).groupModel[index],
                              context: context),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 20.0,
                              ),
                          itemCount: HomeCubit.get(context).groupModel.length),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget itemList(
      {required GroupModel model,
      required int index,
      required BuildContext context}) {
    return Row(
      children: [


        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0)),
            elevation: 5.0,
            clipBehavior: Clip.hardEdge,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Card(
color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             GroupInfoScreen(
                    //               model: model,
                    //             )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Row(
                      children: [

                        Icon(
                          Icons.group_rounded,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                            child: Text(
                          '${model.name}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        )),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Card(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 5.0,
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.delete_outline,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
