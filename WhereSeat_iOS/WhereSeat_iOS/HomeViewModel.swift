//
//  HomeViewModel.swift
//  WhereSeat_iOS
//
//  Created by 드즈 on 2023/07/03.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var stadium: [Stadium] = [
        Stadium(name: "고척 스타디움", image: "a"), Stadium(name: "서울 잠실 야구장", image: "b"), Stadium(name: "광주KIA챔피언스 필드", image: "c"), Stadium(name: "대구 삼성 라이온즈 파크", image: "d"), Stadium(name: "부산사직야구장", image: "a")
    ]
    
    
    
    
}
