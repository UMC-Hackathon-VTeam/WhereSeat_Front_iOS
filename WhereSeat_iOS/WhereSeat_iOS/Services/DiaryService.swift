//
//  DiaryService.swift
//  WhereSeat_iOS
//
//  Created by 정호진 on 2023/07/04.
//

import Foundation
import Alamofire

final class DiaryService{
    
    func getWrittenDiaryList( completion: @escaping ([String]) -> ()){
//        let url = 
        print("hi")
        completion(["2023-07-10","2023-07-11","2023-07-13"])
    }
    
}
