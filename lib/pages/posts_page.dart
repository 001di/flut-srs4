import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';
import '../models/get_posts.dart';
import '../post/bloc/post_bloc.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  List<Posts> posts = [];
  late PostBloc postBloc;

  @override
  void initState() {
    postBloc = PostBloc();
    postBloc.add(GetPostEvent());
    super.initState();
  }

  @override
  void dispose() {
    postBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts API (BLoC)"),
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: BlocBuilder<PostBloc, PostState>(
        bloc: postBloc,
        builder: (context, state) {
          if (state is LoadingPostState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is FetchedPostsState) {
            posts = state.posts;
            return buildBody();
          }
          return const Center(
            child: Text("Some Error"),
          );
        },
      ),
    );
  }

  Widget buildBody() {
    return ListView.separated(
      padding: EdgeInsets.all(16.r),
      itemCount: posts.length,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final item = posts[index];
        return Container(
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: 4.r,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                item.body,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}