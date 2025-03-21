// To parse this JSON data, do
//
//     final homeCaro = homeCaroFromJson(jsonString);

import 'dart:convert';

HomeCaro homeCaroFromJson(String str) => HomeCaro.fromJson(json.decode(str));

String homeCaroToJson(HomeCaro data) => json.encode(data.toJson());

class HomeCaro {
    String? title;
    String? img;
    String? btntext;

    HomeCaro({
        this.title,
        this.img,
        this.btntext,
    });

    factory HomeCaro.fromJson(Map<String, dynamic> json) => HomeCaro(
        title: json["title"],
        img: json["img"],
        btntext: json["btntext"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "img": img,
        "btntext": btntext,
    };
}
