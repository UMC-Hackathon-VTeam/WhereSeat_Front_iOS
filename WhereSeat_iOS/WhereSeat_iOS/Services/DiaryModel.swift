//
//  DiaryModel.swift
//  WhereSeat_iOS
//
//  Created by 정호진 on 2023/07/04.
//

import Foundation

struct DiaryModel: Codable{
    let image: String?
    let visitedAt: String
    let comment: String?
    let description: String?
}
