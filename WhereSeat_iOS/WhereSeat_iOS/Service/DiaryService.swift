//
//  DiaryService.swift
//  WhereSeat_iOS
//
//  Created by 정호진 on 2023/07/04.
//

import Foundation
import Alamofire

final class DiaryService {
    static let service = DiaryService()
    private init() {}
    
    private var dataList: [DiaryModel] = []
    
    func getWrittenDiaryList( completion: @escaping ([String]) -> ()){
        var list: [String] = []
        dataList.forEach { data in
            list.append(data.visitedAt)
        }
        
        completion(list)
    }
    
    func findData(time: String, completion: @escaping (DiaryModel) -> ()){
        let model =  dataList.filter { data in
            data.visitedAt == time
        }
        
        completion(model[0])
    }
    
    func inputData(data: DiaryModel) {
        dataList.append(data)
    }
}
