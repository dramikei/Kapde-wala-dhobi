//
//  TableVC.swift
//  Kapde-wala-dhobi
//
//  Created by Raghav Vashisht on 18/06/20.
//  Copyright © 2020 Raghav Vashisht. All rights reserved.
//

import UIKit

class TableVC: UITableViewController {
    private var loadAll: Bool = false
    private var orders:[Order] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as? TableCell else { return UITableViewCell() }
        
        return cell
    }
    
    public func setLoadAll() {
        self.loadAll = true
    }
    

 

}
