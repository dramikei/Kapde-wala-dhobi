//
//  Order.swift
//  Kapde-wala-dhobi
//
//  Created by Raghav Vashisht on 18/06/20.
//  Copyright © 2020 Raghav Vashisht. All rights reserved.
//

import Foundation

class Order {
    let id: Int
    let status: String
    let enrolment:String
    let date: String
    
    init(id: Int, status: String, enrolment: String, date: String ) {
        self.id = id
        self.status = status
        self.enrolment = enrolment
        self.date = date
    }
}
