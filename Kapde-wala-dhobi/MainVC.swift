//
//  ViewController.swift
//  Kapde-wala-dhobi
//
//  Created by Raghav Vashisht on 17/06/20.
//  Copyright © 2020 Raghav Vashisht. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pendingOrderPressed(_ sender: UIButton) {
        let newViewController = TableVC()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    @IBAction func OrderHistoryPressed(_ sender: UIButton) {
        let newViewController = TableVC()
        newViewController.setLoadAll()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}

