//
//  ViewController.swift
//  WhereSeat_iOS
//
//  Created by Phil on 2023/07/03.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    @IBSegueAction func embededSwiftUi(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: HomeView())
    }
}
