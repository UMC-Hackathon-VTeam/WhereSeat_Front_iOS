//
//  Review.swift
//  WhereSeat_iOS
//
//  Created by Phil on 2023/07/03.
//

import Foundation

struct Review : Identifiable {
    let id = UUID()
    let image : String
    let score : Double
    let area : String
    let seat : String
    let content : String
    let userName : String
    let date : Date
}
