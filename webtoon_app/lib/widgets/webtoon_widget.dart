import 'package:flutter/material.dart';
import 'package:webtoon_app/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  // 웹툰 썸네일, 제목을 담은 카드 포스터
  // 누르면 상세 페이지로 넘어가는 효과 부여
  final String title, thumbnail, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumbnail,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 화면 전환 애니메이션 효과 + 위젯을 보여줌 => 다른 화면으로 넘어가는 듯한 효과
        // 상태가 없어도 애니메이션 효과 있음
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                title: title,
                thumbnail: thumbnail,
                id: id,
              ),
              fullscreenDialog: true,
            ));
      },
      child: Column(
        children: [
          // 태그를 공유하는 Hero 위젯으로 넘어갈 때 애니메이션 효과
          Hero(
            tag: id, // webtoon's id is a tag only poster
            child: Container(
              width: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(10, 10),
                      color: Colors.black.withOpacity(0.5),
                    )
                  ]),
              child: Image.network(
                thumbnail,
                headers: const {
                  "User-Agent":
                      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36"
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
