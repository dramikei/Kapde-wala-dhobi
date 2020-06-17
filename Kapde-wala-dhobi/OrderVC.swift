//
//  OrderVC.swift
//  Kapde-wala-dhobi
//
//  Created by Raghav Vashisht on 18/06/20.
//  Copyright © 2020 Raghav Vashisht. All rights reserved.
//

import UIKit

class OrderVC: UIViewController {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var enrollLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var shirtLabel: UILabel!
    @IBOutlet weak var tshirtLabel: UILabel!
    @IBOutlet weak var pajamaLabel: UILabel!
    @IBOutlet weak var jeanLabel: UILabel!
    @IBOutlet weak var pantLabel: UILabel!
    @IBOutlet weak var bedsheetLabel: UILabel!
    @IBOutlet weak var towelsLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var updatedLabel: UILabel!
    
    
    @IBOutlet weak var rejectBtn: UIButton!
    @IBOutlet weak var completeBtn: UIButton!
    @IBOutlet weak var approveBtn: UIButton!
    
    
    private var order: Order!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        completeBtn.isHidden = false
        rejectBtn.isHidden = false
        approveBtn.isHidden = false
        
        if order.status.lowercased() == "placed" {
            completeBtn.isHidden = true
        } else if order.status.lowercased() == "cancelled" || order.status.lowercased() == "rejected" {
            completeBtn.isHidden = true
            rejectBtn.isHidden = true
            approveBtn.isHidden = true
        } else {
            rejectBtn.isHidden = true
            approveBtn.isHidden = true
        }

        idLabel.text = String(order.id)
        enrollLabel.text = order.enrolment
        statusLabel.text = order.status
        shirtLabel.text =  String(order.shirtCount)
        tshirtLabel.text = String(order.tshirtCount)
        pajamaLabel.text = String(order.pajamaCount)
        jeanLabel.text = String(order.jeansCount)
        pantLabel.text = String(order.pantCount)
        bedsheetLabel.text = String(order.bedsheetCount)
        towelsLabel.text = String(order.towelCount)
        createdLabel.text = order.createdDate
        updatedLabel.text = order.updatedDate
    }
    

    @IBAction func approveBtnPressed(_ sender: Any) {
    }
    
    @IBAction func completeBtnPressed(_ sender: Any) {
    }
    @IBAction func rejectBtnPressed(_ sender: Any) {
    }
    
    public func setOrder(_ order: Order) {
        self.order = order
    }
    
}
