import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/features/blog/presentation/widgets/blog_editor.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddNewBlogpage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (contexy) => const AddNewBlogpage(),
      );
  const AddNewBlogpage({super.key});

  @override
  State<AddNewBlogpage> createState() => _AddNewBlogpageState();
}

class _AddNewBlogpageState extends State<AddNewBlogpage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  List<String> selectedTopics = [];

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.done)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              DottedBorder(
                strokeCap: StrokeCap.round,
                borderType: BorderType.RRect,
                radius: const Radius.circular(10),
                color: AppPallete.borderColor,
                dashPattern: const [10, 4],
                child: Container(
                  color: AppPallete.backgroundColor,
                  height: 150,
                  width: double.infinity,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.folder_open,
                        size: 40,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Select your image",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    'Technology',
                    'Business',
                    'Programming',
                    'Entertainment',
                  ]
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: GestureDetector(
                            onTap: () {
                              if (selectedTopics.contains(item)) {
                                selectedTopics.remove(item);
                                setState(() {});
                              } else {
                                selectedTopics.add(item);
                                setState(() {});
                              }
                            },
                            child: Chip(
                              side: selectedTopics.contains(item)
                                  ? null
                                  : const BorderSide(
                                      color: AppPallete.borderColor),
                              label: Text(item),
                              color: selectedTopics.contains(item)
                                  ? const WidgetStatePropertyAll(
                                      AppPallete.gradient1)
                                  : null,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BlogEditor(
                controller: titleController,
                hintText: 'Blog title',
              ),
              const SizedBox(
                height: 10,
              ),
              BlogEditor(
                controller: contentController,
                hintText: 'Blog content',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
