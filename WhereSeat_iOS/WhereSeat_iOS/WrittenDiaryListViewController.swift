//
//  WrittenDiaryListViewController.swift
//  WhereSeat_iOS
//
//  Created by 정호진 on 2023/07/03.
//

import UIKit

class WrittenDiaryListViewController: UIViewController {
    var selectDate: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = selectDate
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }

}
