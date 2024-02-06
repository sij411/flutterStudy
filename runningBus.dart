/* 
 * 버스 운행
오늘은 간단한 Dart 문제를 준비해 봤습니다.

시티01번 버스는 버스 3대로 운행하며, 버스는 각각 3분 간격으로 출발합니다. 

편의상 출발 순서에 따라 각 버스를 1호, 2호, 3호로 칭하겠습니다. 

버스의 정거장은 다음과 같으며, 각 정거장 사이를 이동하는 데는 1분이 소요됩니다. 종점에 도착한 버스는 더 이상 운행하지 않습니다.

기점 - 재래시장 - 시청 - 호텔 - 중앙역 - 하늘정원 - 푸른빌라 - 종점

다음 예시와 같이 버스가 정류장에 도착했을 때 print하는 코드를 작성해 봅시다.

예:
1호 - 기점 출발
1호 - 재래시장 도착
1호 - 시청 도착
1호 - 호텔 도착 / 2호 - 기점 출발
1호 - 중앙역 도착 / 2호 - 재래시장 도착
...

 * */

/**
 * ## announcement -> manage it via enum class 
 * t= 0 bus no.1 start at the garage
 * t = 1 arrive at the second bus stop
 * 
 * ## currently running 
 * timezone : t = x : x, x + 3, x + 6
 * 1호 t = t
 * 2 t + 
 타임존이 x라면 1호는 x, 2호는 x + 3, 3호는 x + 6
 버스 별로 상태를 현재 도착한 정거장을 출력하게 하자. 
 일단 버스 1대부터 출발시켜 보자.
 
 */

enum BusStop {
  garage(time: 0, name: "기점"),
  traditionalMarket(time: 1, name: "재래시장"),
  cityHall(time: 2, name: "시청"),
  hotel(time: 3, name: "호텔"),
  centralStation(time: 4, name: "중앙역"),
  skyGarden(time: 5, name: "하늘정원"),
  blueApartment(time: 6, name: "푸른빌라"),
  finalStation(time: 7, name: "종점"),
  noStation(time: -1, name: "차고");

  const BusStop({
    required this.name,
    required this.time,
  });

  final String name;
  final int time;

  String get leave => "$name 출발";

  String get arrive => "$name 도착";

  static BusStop? getBusStopAtTime(int time) {
    for (BusStop stop in BusStop.values) {
      if (stop.time == time) {
        return stop;
      }
    }
    return noStation;
  }
}

class Bus {
  final int id;
  int time;

  Bus({
    required this.id,
    required this.time,
  });

  String get location {
    var stop = BusStop.getBusStopAtTime(time);
    String currentStop = stop == null ? BusStop.garage.leave : stop.arrive;

    return "$id호 - $currentStop";
  }
}

void main() {
  List<Bus> buses = [
    Bus(id: 1, time: 0),
    Bus(id: 2, time: -3),
    Bus(id: 3, time: -6),
  ];
  while (buses[0].time < 8 || buses[1].time < 8 || buses[2].time < 8) {
    List<String> announcements = [];
    buses.forEach((bus) {
      bus.time++;
      if (bus.time >= 0 && bus.time <= 7) {
        announcements.add(bus.location);
      }
    });
    print(announcements.join(' / '));
    print("\n");
  }
}
