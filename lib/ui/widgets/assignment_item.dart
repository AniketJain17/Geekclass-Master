import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geeclass/data/model/subject_assignment.dart';
import 'package:geeclass/ui/theme/app_color.dart';
import 'package:geeclass/ui/widgets/assignment_status.dart';
import 'package:intl/intl.dart';

class AssignmentItem extends StatelessWidget {
  final SubjectAssignment assignment;

  const AssignmentItem({Key? key, required this.assignment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black12,
        border: Border.all(color: AppColor.dark, width: 1.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/assignment.svg",
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            assignment.title,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Due at ${DateFormat("MMM dd").format(assignment.dueAt)}",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    AssignmentStatus(type: assignment.type),
                  ],
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(
                    assignment.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            splashColor: AppColor.white.withOpacity(0.05),
            highlightColor: AppColor.white.withOpacity(0.15),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: AppColor.dark,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/comment.svg",
                    color: Color.fromARGB(255, 0, 0, 0),
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "Add class's comment",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
