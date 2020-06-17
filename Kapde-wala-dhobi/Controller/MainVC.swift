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
        navigationController?.navigationBar.topItem?.title = "Kapde Wala"
    }

    @IBAction func pendingOrderPressed(_ sender: UIButton) {
        let newViewController = storyboard!.instantiateViewController(withIdentifier: "tableVCID") as! TableVC
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    @IBAction func OrderHistoryPressed(_ sender: UIButton) {
        let newViewController = storyboard!.instantiateViewController(withIdentifier: "tableVCID") as! TableVC
        newViewController.setLoadAll()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}

