import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../components/components.dart';
import '../components/oday_recipe_list_view.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {
  //1
  final mockservice = MockFooderlichService();
  ExploreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // 1
    return FutureBuilder(
        // 2
        future: mockservice.getExploreData(),
        // 3
        builder: (context, AsyncSnapshot<ExploreData> snapshot) {
          // 4
          if (snapshot.connectionState == ConnectionState.done) {
            // 5
            return ListView(
// 6
              scrollDirection: Axis.vertical,
              children: [
                // 7
                TodayRecipListView(recipes: snapshot.data?.todayRecipes ?? []),
                // 8
                const SizedBox(height: 16),
                // 9
                FriendPostListView(
                    friendPosts: snapshot.data?.friendPosts ?? []),
              ],
            );
          } else {
            // 10
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
