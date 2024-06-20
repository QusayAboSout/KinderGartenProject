import 'package:frontend/Reposetories/AuthReposetory.dart';
import 'package:frontend/controller/guardian_controller.dart';
import 'package:frontend/core/services/ApiService.dart';
import 'package:frontend/core/services/AuthService.dart';
import 'package:frontend/core/services/child_card_services.dart';
import 'package:frontend/core/services/class_service.dart';
import 'package:frontend/core/services/class_subjects_services.dart';
import 'package:frontend/core/services/general_evaluation_services.dart';
import 'package:frontend/core/services/gurdian_services.dart';
import 'package:frontend/core/services/post_services.dart';
import 'package:frontend/core/services/progress_evaluation_services.dart';
import 'package:frontend/core/services/section_services.dart';
import 'package:frontend/core/services/student_services.dart';
import 'package:frontend/core/services/subject_service.dart';
import 'package:frontend/core/services/teacher_services.dart';
import 'package:frontend/core/services/unit_services.dart';
import 'package:frontend/core/services/user_services.dart';
import 'package:frontend/model/gurdian.dart';
import 'package:frontend/view/screen/subject/subjects.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

setupLocator() {
  locator.registerSingleton<ApiService>(ApiService());
  locator.registerSingleton<AuthService>(AuthService());
  locator.registerSingleton<AuthReposetory>(AuthReposetory());
  locator.registerSingleton<ChildCardServices>(ChildCardServices());
  locator.registerSingleton<StudentServices>(StudentServices());
  locator.registerSingleton<TeacherServices>(TeacherServices());
  locator.registerSingleton<ClassServices>(ClassServices());
  locator.registerSingleton<UserServices>(UserServices());
  locator.registerSingleton<SubjectServices>(SubjectServices());
  locator.registerSingleton<UnitServices>(UnitServices());
  locator.registerSingleton<ClassSubjectsServices>(ClassSubjectsServices());
  locator.registerSingleton<ProgressEvaluationServices>(
      ProgressEvaluationServices());
  locator.registerSingleton<PostServices>(PostServices());
  locator.registerSingleton<GeneralEvaluationServices>(
      GeneralEvaluationServices());
  locator.registerSingleton<GuardianServices>(GuardianServices());
  locator.registerSingleton<SectionServices>(SectionServices());
}
