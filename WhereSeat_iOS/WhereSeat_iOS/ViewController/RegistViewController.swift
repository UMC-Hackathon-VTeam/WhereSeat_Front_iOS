//
//  CreateNewViewController.swift
//  WhereSeat_iOS
//
//  Created by 정호진 on 2023/07/04.
//

import UIKit

class RegistViewController: UIViewController {
    @IBOutlet weak var pw: UITextField!
    @IBOutlet weak var id: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clickedDone(_ sender: Any) {
        dismiss(animated: false)
    }
}
