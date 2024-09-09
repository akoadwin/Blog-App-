import 'package:blog_app/core/common/widgets/loader.dart';
import 'package:blog_app/core/utils/show_snackbar.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_app/features/blog/presentation/pages/add_new_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogPage extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (contexy) => const BlogPage(),
      );
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          showSnackbar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Loader();
        }
        return Scaffold(
          appBar: AppBar(
            title: const Center(child: Text("Blog App")),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context, AddNewBlogpage.route());
                  },
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
