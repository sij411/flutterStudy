import 'package:flutter/material.dart';
import 'package:webtoon_app/services/api_service.dart';
import 'package:webtoon_app/models/webtoon_detail_model.dart';

import '../models/webtoon_episode_model.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumbnail, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumbnail,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  // init webtoon future in a safe way

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        elevation: 10,
        shadowColor: Colors.grey[300],
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: widget.id,
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
                    widget.thumbnail,
                    headers: const {
                      "User-Agent":
                          "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36"
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
