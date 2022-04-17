import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:tutor_app/src/models/models.dart';

class CoursePresentation extends StatelessWidget {
  const CoursePresentation({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFC2D1E5),
            offset: Offset(0, -1),
            blurRadius: 11,
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image(
                  image: course.image,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 14),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  course.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.04,
                  ),
                ),
              ),
              SizedBox(height: 23),
              Padding(
                padding: EdgeInsets.only(left: 23),
                child: Row(
                  children: [
                    iconWithText(Icons.star_rounded, course.rating.toString()),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 20,
            bottom: 89,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(360),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFC2D1E5).withOpacity(0.7),
                    offset: Offset(0, -1),
                    blurRadius: 11,
                  ),
                ],
              ),
              child: Center(
                child: LikeButton(
                  likeBuilder: (bool isLiked) {
                    return Padding(
                      padding: EdgeInsets.only(top: 1.3, left: 2.75),
                      child: Icon(
                        Icons.favorite_rounded,
                        color: isLiked ? Color(0xFFFE793D) : Colors.grey,
                        size: 28,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            right: 30,
            bottom: 24,
            child: Text(
              "${course.lessonsCount} " +
                  rightLessonsCountName(course.lessonsCount),
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.04,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String rightLessonsCountName(int count) {
    switch (count) {
      case 1:
        return "урок";
      case 2:
        return "урока";
      default:
        return "уроков";
    }
  }

  Widget iconWithText(IconData icon, String text) => Row(
        children: [
          Icon(
            icon,
            color: Color(0xFF878787),
            size: 15,
          ),
          SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
              color: Color(0xFF878787),
              fontSize: 7,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      );
}
