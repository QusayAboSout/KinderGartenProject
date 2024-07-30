import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/controller/homeController.dart';
import 'package:frontend/controller/post_controller.dart';
import 'package:frontend/controller/user_controller.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/core/class/custom_alert_dialog.dart';
import 'package:frontend/core/services/session.dart';
import 'package:frontend/model/Posts.dart';
import 'package:frontend/view/screen/home/childCard/qustions.dart';
import 'package:frontend/view/screen/home/drawer.dart';
import 'package:frontend/view/screen/home/notification.dart';
import 'package:frontend/view/screen/home/student/my_students.dart';
import 'package:frontend/view/screen/home/student/students.dart';
import 'package:frontend/view/screen/home/user_profile.dart';
import 'package:frontend/view/screen/teachers/my_class_students.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

// homefast

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final HomeController controller = Get.find<HomeController>();
  final _formKey = GlobalKey<FormBuilderState>();

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: controller,
      builder: (controller) => Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: AppColors.BACKGROUND_COLOR,
          title: const Center(
            child: Text(
              '__________',
              style: TextStyle(color: AppColors.LIGHT_TEXT),
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: AppColors.LIGHT_TEXT,
            ),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          actions: [
            if (Session.user?.role != "student")
              IconButton(
                icon: const Icon(
                  Icons.person_add,
                  color: AppColors.LIGHT_TEXT,
                ),
                onPressed: () {
                  Get.to(() => const childCardForm());
                },
              ),
            GetBuilder<HomeController>(builder: (HomeController controller) {
              return IconButton(
                icon: const Icon(
                  Icons.notifications,
                  color: AppColors.LIGHT_TEXT,
                ),
                onPressed: () {
                  controller.showNotificationPage();
                },
              );
            }),
          ],
        ),
        drawer: CustomDrawer(),
        bottomNavigationBar: BottomAppBar(
          color: AppColors.CREMIZON,
          // color: const Color(0xFFFFD0D6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GetBuilder<HomeController>(builder: (HomeController controller) {
                return IconButton(
                  icon: const Icon(
                    Icons.home,
                    color: AppColors.LIGHT_TEXT,
                  ),
                  onPressed: () {
                    controller.showHomePage();
                  },
                );
              }),
              GetBuilder<HomeController>(builder: (HomeController controller) {
                return IconButton(
                  icon: const Icon(
                    Icons.location_history_rounded,
                    color: AppColors.LIGHT_TEXT,
                  ),
                  onPressed: () {
                    controller.showFormsPage();
                  },
                );
              }),
              const SizedBox(width: 64), // Empty space for the center button
              GetBuilder<HomeController>(builder: (HomeController controller) {
                return IconButton(
                  icon: const Icon(Icons.notifications, color: AppColors.LIGHT_TEXT),
                  onPressed: () {
                    controller.showNotificationPage();
                  },
                );
              }),
              GetBuilder<HomeController>(builder: (HomeController controller) {
                return IconButton(
                  icon: const Icon(
                    Icons.account_circle,
                    color: AppColors.LIGHT_TEXT,
                  ),
                  onPressed: () {
                    controller.showUserProfilePage();
                  },
                );
              }),
            ],
          ),
        ),
        body: IndexedStack(
          index: controller.stIndex(),
          children: [
            HomePageContent(),
            Session.user?.role == 'student'
                ? MyStudents()
                : Session.user?.role == 'admin'
                    ? StudentListPage()
                    : const MyClassStudents(),
            NotificationPage(),
            const UserProfilePage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              if (Session.user?.role == 'student') {
                Get.to(() => const childCardForm());
              } else {
                showDialog(
                  context: context,
                  builder: ((context) {
                    return CustomAlertDialog2(
                      buttonText: 'نشر',
                      bodyText: 'الوصف...',
                      headText: 'إنشاء منشور',
                      widget: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // if (headText != null) const SizedBox(height: 8),
                          Form(
                            key: _formKey,
                            child: FormBuilderTextField(
                              controller: myController,
                              name: 'postInfo',
                              decoration: const InputDecoration(
                                  labelText: 'وصف المنشور...',
                                  labelStyle: TextStyle(color: Colors.grey)),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () async {
                        if (myController.text.isEmpty) {
                        } else {
                          final Map<String, dynamic> postValue =
                              <String, dynamic>{};
                          PostDto obj = PostDto();
                          obj.description = myController.text;
                          obj.userID = Session.user?.id;
                          obj.postDate = DateTime.now();
                          postValue.addAll(obj.toJson());
                          await controller.addPost(postValue);
                          myController.clear();
                          Get.back();
                          Get.back();
                        }
                      },
                    );
                  }),
                );
              }
            },
            child: Session.user?.role != 'admin'
                ? const Icon(
                    Icons.person_add,
                    color: AppColors.SECONDARY_COLOR,
                  )
                : const Icon(
                    Icons.add,
                    color: AppColors.SECONDARY_COLOR,
                  )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  HomePageContent({super.key});

  final PostController postController = Get.put(PostController());
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.BACKGROUND_COLOR,
        child: GetBuilder<PostController>(
            id: 'postHome',
            builder: (controller) {
              return ListView.builder(
                itemCount: controller.posts.length,
                itemBuilder: (context, index) {
                  var item = controller.posts[index];
                  String? postDescription = item.description;
                  bool isLongPost = postDescription!.length > 50;
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
                            child: ListTile(
                              leading: const CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/images/pic1.jpg'),
                              ),
                              title: Row(
                                children: [
                                  Text(
                                    '${item.user?.name}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: GestureDetector(
                                onTap: () {
                                  if (isLongPost) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                            'وصف المنشور',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    AppColors.SECONDARY_COLOR),
                                          ),
                                          content: Text(
                                            postDescription,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text(
                                                'إغلاق',
                                                style: TextStyle(
                                                  color: AppColors.LIGHT_TEXT,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                                child: Text(
                                  isLongPost
                                      ? '${postDescription.substring(0, 60)}...'
                                      : postDescription,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                              trailing: Session.user?.role == 'admin'
                                  ? PopupMenuButton<String>(
                                      onSelected: (String value) {
                                        print('Selected option: $value');
                                      },
                                      itemBuilder: (BuildContext context) {
                                        return <PopupMenuEntry<String>>[
                                          PopupMenuItem<String>(
                                            value: 'delete',
                                            child: const Text('حذف'),
                                            onTap: () {
                                              controller.deletePost(item.id);
                                            },
                                          ),
                                        ];
                                      },
                                    )
                                  : null,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              );
            }),
      ),
    );
  }
}
