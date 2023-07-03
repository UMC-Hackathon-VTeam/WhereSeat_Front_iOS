//
//  LoginViewController.swift
//  WhereSeat_iOS
//
//  Created by 정호진 on 2023/07/04.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet weak var newBtn: UIButton!
    @IBOutlet weak var pw: UITextField!
    @IBOutlet weak var id: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newBtn.layer.borderWidth = 1
        newBtn.layer.cornerRadius = 15
        newBtn.layer.borderColor = CGColor.init(red: 0, green: 1, blue: 1, alpha: 1)
    }
    
    @IBAction func clickedLogin(_ sender: Any) {
        
    }
    
    @IBAction func clickedNew(_ sender: Any) {
        
    }
    
}

extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == id {
            textField.resignFirstResponder()
            pw.becomeFirstResponder()
        } else {
            textField.becomeFirstResponder()
            pw.resignFirstResponder()
        }
        return true
    }
    
}
