import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_techer/cubit/cubit.dart';
import 'package:flutter_techer/cubit/state.dart';
import 'package:flutter_techer/models/group_model.dart';
import 'package:flutter_techer/models/student_model.dart';

class GroupInfoScreen extends StatelessWidget {
  GroupModel model;

  GroupInfoScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {

    var studentNameController = TextEditingController();
    var studentPhoneController = TextEditingController();
    var studentEmailController = TextEditingController();
    var studentPasswordController = TextEditingController();
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()..getStudent(groupId: model.id!),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit.get(context).getStudent(groupId: model.id!);
          return Scaffold(
            appBar: AppBar(
                title: Text(
                  'Group information',
                  style: TextStyle(color: Colors.green),
                ),
                centerTitle: true),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    child: Column(children: [

                      Row(
                        children: [
                          Text(
                            'Group name  : ',
                            style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${model.name}',
                            style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      
                      SizedBox(height: 10,),
                      Container(
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: (){
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
                                            'add Student',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          TextFormField(
                                            controller: studentNameController,
                                            keyboardType: TextInputType.text,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Student name is empty';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              hintText: 'Student name',
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(20.0))),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller: studentPhoneController,
                                            keyboardType: TextInputType.phone,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'phone name is empty';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              hintText: 'phone',
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(20.0))),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller: studentEmailController,
                                            keyboardType: TextInputType.emailAddress,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'email name is empty';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              hintText: 'email',
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(20.0))),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller: studentPasswordController,
                                            keyboardType: TextInputType.text,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'password name is empty';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              hintText: 'password',
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(20.0))),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional.bottomEnd,
                                            child: MaterialButton(
                                              onPressed: () {
                                                HomeCubit().setEmailStudent(name: studentNameController.text, groupId: model.id!, phone: studentPhoneController.text, studentEmail: studentEmailController.text, studentPassword: studentPasswordController.text,  groupName: model.name!);
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
                          }
                          ,color: Colors.green,child:Text(
                          'Add Student',
                          style: TextStyle(color: Colors.white),
                        ) ,),
                      )
                    ]),
                  ),
                ),

                SizedBox(height: 10,),

                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(topRight:Radius.circular(20),topLeft: Radius.circular(20))
                    ),
                    child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: [

                      Text(
                        'Students',
                        style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10,),

                      // list view
                      Expanded(
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) => itemList(
                                index: index,
                                model: HomeCubit.get(context).studentModel[index],
                                context: context),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 20.0,
                            ),
                            itemCount: HomeCubit.get(context).studentModel.length),
                      ),
                    ]),
                  ),),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget itemList(
    {required StudentModel model,
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
                  //         builder: (context) => GroupInfoScreen(
                  //           model: model,
                  //         )));
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
