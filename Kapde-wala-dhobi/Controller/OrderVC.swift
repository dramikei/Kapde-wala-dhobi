//
//  OrderVC.swift
//  Kapde-wala-dhobi
//
//  Created by Raghav Vashisht on 18/06/20.
//  Copyright © 2020 Raghav Vashisht. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

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
        } else if order.status.lowercased() == "approved" {
            rejectBtn.isHidden = true
            approveBtn.isHidden = true
        } else {
            completeBtn.isHidden = true
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
    

    @IBAction func approveBtnPressed(_ sender: UIButton) {
        let param: [String: String] = [
            "enrolment": order.enrolment
        ]
        let url = BASE_URL+APPROVE_ORDER
        print(url)
        AF.request(url, method: .post, parameters: param, encoding: JSONEncoding.default).responseJSON { response in
            let data = JSON(response.data)
            print(data)
            if data["status"] == "success" {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func completeBtnPressed(_ sender: UIButton) {
        let param: [String: String] = [
            "enrolment": order.enrolment
        ]
        AF.request(BASE_URL+COMPLETE_ORDER, method: .post, parameters: param, encoding: JSONEncoding.default).responseJSON { response in
            let data = JSON(response.data)
            print(data)
            if data["status"] == "success" {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    @IBAction func rejectBtnPressed(_ sender: UIButton) {
        let param: [String: String] = [
            "enrolment": order.enrolment
        ]
        AF.request(BASE_URL+REJECT_ORDER, method: .post, parameters: param).response { response in
            let data = JSON(response.data)
            print(data)
            if data["status"] == "success" {
                self.navigationController?.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    public func setOrder(_ order: Order) {
        self.order = order
    }
    
}
