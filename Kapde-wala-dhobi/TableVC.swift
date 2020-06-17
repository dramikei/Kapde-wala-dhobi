//
//  TableVC.swift
//  Kapde-wala-dhobi
//
//  Created by Raghav Vashisht on 18/06/20.
//  Copyright © 2020 Raghav Vashisht. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    private var loadAll: Bool = false
    private var orders:[Order] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let url: String
//        print("loadAll is: \(loadAll)")
        if loadAll {
            url = "http://kapde-wala.herokuapp.com/dhobi/all"
        } else {
            url = "http://kapde-wala.herokuapp.com/dhobi/"
        }
        AF.request(url).response { response in
            guard let data = response.data else { return }
            let json = JSON(data)
//            print(json)
            let ordersArray = json["orders"].arrayValue
            for i in 0..<ordersArray.count {
                self.extractDataFrom(ordersArray[i])
            }
            self.tableView.reloadData()
        }
        
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return orders.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as? TableCell else { return UITableViewCell() }
        cell.idLabel.text = String(orders[indexPath.row].id)
        cell.dateLabel.text = orders[indexPath.row].date
        cell.enrollLabel.text = orders[indexPath.row].enrolment
        cell.statusLabel.text = orders[indexPath.row].status
        return cell
    }
    
    public func setLoadAll() {
        self.loadAll = true
    }
    
    func extractDataFrom(_ data: JSON) {
        let order = Order(id: data["id"].intValue, status: data["order_status"].stringValue, enrolment: data["enrol_id"].stringValue, date: data["updatedAt"].stringValue)
        orders.append(order)
    }
    

 

}
