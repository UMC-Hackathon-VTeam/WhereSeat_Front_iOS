//
//  HomeViewModel.swift
//  WhereSeat_iOS
//
//  Created by 드즈 on 2023/07/03.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var stadium: [StadiumModel] = [
        StadiumModel(name: "고척 스타디움", image: "a"), StadiumModel(name: "서울 잠실 야구장", image: "b"), StadiumModel(name: "광주KIA챔피언스 필드", image: "c"), StadiumModel(name: "대구 삼성 라이온즈 파크", image: "d"), StadiumModel(name: "부산사직야구장", image: "a")
    ]
}
