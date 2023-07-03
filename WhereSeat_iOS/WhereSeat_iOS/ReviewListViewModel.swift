//
//  ReviewListViewModel.swift
//  WhereSeat_iOS
//
//  Created by Phil on 2023/07/03.
//

import Combine
import Foundation

class ReviewListViewModel : ObservableObject {
    @Published var reviewList : [Review] = [Review(image: "Review", score: 4.0, area: "블루석", seat: "11구역 a열 1석", content: "잘 보이는 자리라 좋아여. 다음에 또 오고 싶어요", userName: "user 1", date: Date()), Review(image: "q", score: 2.0, area: "레드석", seat: "12구역 a열 1석", content: "별로입니다.", userName: "user 2", date: Date()),  Review(image: "w", score: 5.0, area: "레드석", seat: "10구역 a열 3석", content: "너무 좋아요.", userName: "user 4", date: Date()),  Review(image: "e", score: 4.0, area: "레드석", seat: "13구역 a열 5석", content: "그냥 그래요.", userName: "user 5", date: Date()),  Review(image: "Review", score: 3.0, area: "레드석", seat: "12구역 a열 1석", content: "생각보다 잘 안보입니다.", userName: "user 2", date: Date())]

}
