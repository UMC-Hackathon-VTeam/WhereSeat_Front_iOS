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
        StadiumModel(name: "고척 스타디움", image: "TestImage"), StadiumModel(name: "", image: ""), StadiumModel(name: "", image: ""), StadiumModel(name: "", image: ""), StadiumModel(name: "", image: ""), StadiumModel(name: "", image: ""), StadiumModel(name: "", image: ""), StadiumModel(name: "", image: ""), StadiumModel(name: "", image: ""), StadiumModel(name: "", image: ""), StadiumModel(name: "", image: ""), StadiumModel(name: "", image: ""), StadiumModel(name: "", image: "")
    ]
}
