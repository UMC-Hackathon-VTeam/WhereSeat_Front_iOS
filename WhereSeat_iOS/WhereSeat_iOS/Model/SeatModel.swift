//
//  SeatModel.swift
//  WhereSeat_iOS
//
//  Created by 드즈 on 2023/07/04.
//

import Foundation

struct SeatModel: Identifiable, Hashable {
    var id: UUID = UUID()
    let seat: String
}
