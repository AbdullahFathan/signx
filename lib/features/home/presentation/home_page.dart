import 'package:flutter/material.dart';
import 'package:signx/config/theme/resources/app_color.dart';
import 'package:signx/features/home/presentation/widgets/filter_dropdown.dart';

class HomePage extends StatelessWidget {
  static const String route = "/home";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(
            bottom: 16,
            top: 32,
            left: 16,
            right: 16,
          ),
          children: [
            Text(
              "Selamat datang, Fathan",
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontSize: 22),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 10),
              child: Text(
                "Today Artikel",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontSize: 16),
              ),
            ),
            FilterDropdown(),
            ListView.separated(
              itemCount: 12,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(40),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          height: 100,
                          width: double.infinity,
                          child: Image.network(
                            "https://media.istockphoto.com/id/1369150014/id/vektor/breaking-news-dengan-latar-belakang-peta-dunia-vektor.jpg?s=1024x1024&w=is&k=20&c=mrMmxoc-ocwb9OYoSTeJn6q8bKBI4c7acrITCIyzgfA=",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12,
                          right: 12,
                          left: 12,
                          bottom: 5,
                        ),
                        child: Text(
                          "Trump administration concedes father from El Salvador was mistakenly deported and sent to mega prison ",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 12,
                          left: 12,
                          bottom: 5,
                        ),
                        child: Text(
                          "Publish: 21/06/2025",
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
