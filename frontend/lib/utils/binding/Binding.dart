import 'package:frontend/controller/class_ctrl/class_controller.dart';
import 'package:frontend/controller/class_ctrl/class_subjects_controller.dart';
import 'package:frontend/controller/class_ctrl/section_controller.dart';
import 'package:frontend/controller/general_evaluation_controller.dart';
import 'package:frontend/controller/guardian_controller.dart';
import 'package:frontend/controller/homeController.dart';
import 'package:frontend/controller/loginController.dart';
import 'package:frontend/controller/childCardController.dart';
import 'package:frontend/controller/notification_controller.dart';
import 'package:frontend/controller/post_controller.dart';
import 'package:frontend/controller/progress_evaluation_controller.dart';
import 'package:frontend/controller/signup_confirm_code_controller.dart';
import 'package:frontend/controller/singup_controller.dart';
import 'package:frontend/controller/student_ctrl/current_students_controller.dart';
import 'package:frontend/controller/student_ctrl/my_class_student_controller.dart';
import 'package:frontend/controller/student_ctrl/student_certificate.dart';
import 'package:frontend/controller/student_ctrl/students_controller.dart';
import 'package:frontend/controller/subject_controller.dart';
import 'package:frontend/controller/teacher_controller.dart';
import 'package:frontend/controller/unit_controller.dart';
import 'package:frontend/controller/user_controller.dart';
import 'package:frontend/view/screen/password/forget_password.dart';
import 'package:get/get.dart';

class AllBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SiginUpController>(() => SiginUpController(), fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<ForgetPassword>(() => const ForgetPassword(), fenix: true);
    Get.lazyPut<ChildCardController>(() => ChildCardController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<StudentController>(() => StudentController(), fenix: true);
    Get.lazyPut<TeacherController>(() => TeacherController(), fenix: true);
    Get.lazyPut<ClassController>(() => ClassController(), fenix: true);
    Get.lazyPut<UserController>(() => UserController(), fenix: true);
    Get.lazyPut<SubjectController>(() => SubjectController(), fenix: true);
    Get.lazyPut<UnitController>(() => UnitController(), fenix: true);
    Get.lazyPut<ClassSubjectsController>(() => ClassSubjectsController(),
        fenix: true);
    Get.lazyPut<CurrentStudentController>(() => CurrentStudentController(),
        fenix: true);
    Get.lazyPut<ProgressEvaluationController>(
        () => ProgressEvaluationController(),
        fenix: true);
    Get.lazyPut<PostController>(() => PostController(), fenix: true);
    Get.lazyPut<GeneralEvaluationController>(
        () => GeneralEvaluationController(),
        fenix: true);
    // Get.lazyPut<MyStudentsController>(() => MyStudentsController(),
    //     fenix: true);
    Get.lazyPut<GuardianController>(() => GuardianController(), fenix: true);
    Get.lazyPut<StudentCertificateController>(
        () => StudentCertificateController(),
        fenix: true);
    Get.lazyPut<SiginupConfirmCodeController>(
        () => SiginupConfirmCodeController(),
        fenix: true);
    Get.lazyPut<NotificationController>(() => NotificationController(),
        fenix: true);
    Get.lazyPut<MyClassStudentsController>(() => MyClassStudentsController(),
        fenix: true);
    Get.lazyPut<SectionController>(() => SectionController(),
        fenix: true);
  }
}
