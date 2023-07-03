//
//  WrittenDiaryListViewController.swift
//  WhereSeat_iOS
//
//  Created by 정호진 on 2023/07/03.
//

import UIKit

class WrittenDiaryListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }

}
