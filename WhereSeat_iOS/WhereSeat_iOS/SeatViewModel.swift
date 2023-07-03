//
//  SeatViewModel.swift
//  WhereSeat_iOS
//
//  Created by 드즈 on 2023/07/04.
//

import Foundation
import Combine

class SeatViewModel: ObservableObject {
    @Published var seat: [SeatModel] = [
        SeatModel(seat: "R.d-club"), SeatModel(seat: "씨모스석"), SeatModel(seat: "2층 테이블석"), SeatModel(seat: "블루석"), SeatModel(seat: ""), SeatModel(seat: ""), SeatModel(seat: ""), SeatModel(seat: ""), SeatModel(seat: ""), SeatModel(seat: ""), SeatModel(seat: ""), SeatModel(seat: "")
    ]
}
