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
        Stadium(name: "", image: "TestImage"), Stadium(name: "", image: ""), Stadium(name: "", image: ""), Stadium(name: "", image: ""), Stadium(name: "", image: ""), Stadium(name: "", image: ""), Stadium(name: "", image: ""), Stadium(name: "", image: ""), Stadium(name: "", image: ""), Stadium(name: "", image: ""), Stadium(name: "", image: ""), Stadium(name: "", image: ""), Stadium(name: "", image: "")
    ]
}
