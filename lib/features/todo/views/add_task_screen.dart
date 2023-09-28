import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/core/common/widgets/filled_field.dart';
import 'package:todoapp/core/common/widgets/round_button.dart';
import 'package:todoapp/core/common/widgets/white_space.dart';
import 'package:todoapp/core/res/colors.dart';
import 'package:todoapp/features/todo/views/app/task_date_provider.dart';

class AddTaskScreen extends HookConsumerWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final titleController = useTextEditingController();
    final descController = useTextEditingController();
    final hintStyle = GoogleFonts.poppins(
        fontSize: 18, color: Colours.lightGrey, fontWeight: FontWeight.w600);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            children: [
              const WhiteSpace(
                height: 20,
              ),
              FilledField(
                controller: titleController,
                hintText: 'Add Title',
                style: hintStyle,
              ),
              const WhiteSpace(
                height: 20,
              ),
              FilledField(
                controller: descController,
                hintText: 'Add Description',
                style: hintStyle,
              ),
              const WhiteSpace(
                height: 20,
              ),
              RoundButton(
                text: 'Set date',
                backgroundColour: Colours.lightGrey,
                borderColour: Colours.light,
                onPressed: () {
                  DatePicker.showDatePicker(
                    context,
                    minTime: DateTime.now(),
                    maxTime: DateTime(DateTime.now().year + 1),
                    theme: DatePickerTheme(
                      doneStyle: GoogleFonts.poppins(
                          fontSize: 16, color: Colours.green),

                    ),
                    onConfirm:(date){
                      ref.read(taskDateProvider.notifier).changeDate(date);

                    }
                  );
                },
              ),
              const WhiteSpace(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: RoundButton(
                    text: 'Start Time',
                    backgroundColour: Colours.lightGrey,
                    borderColour: Colours.light,
                    onPressed: () {},
                  )),
                  WhiteSpace(
                    width: 10.w,
                  ),
                  Expanded(
                    child: RoundButton(
                      text: 'End Time',
                      backgroundColour: Colours.darkGrey,
                      borderColour: Colours.light,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const WhiteSpace(
                height: 20,
              ),
              RoundButton(
                text: 'Submit',
                backgroundColour: Colours.green,
                borderColour: Colours.light,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
