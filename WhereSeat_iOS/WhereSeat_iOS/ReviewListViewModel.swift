//
//  ReviewListViewModel.swift
//  WhereSeat_iOS
//
//  Created by Phil on 2023/07/03.
//

import Combine
import Foundation

class ReviewListViewModel : ObservableObject {
    @Published var reviewList : [Review] = [Review(image: "ReviewThumb", score: 4.0, area: "블루석", seat: "11구역 a열 1석", content: "잘 보이는 자리라 좋아여", userName: "user 1", date: Date()), Review(image: "ReviewThumb", score: 3.0, area: "레드석", seat: "12구역 a열 1석", content: "별로입니다.", userName: "user 2", date: Date())]
    
}
