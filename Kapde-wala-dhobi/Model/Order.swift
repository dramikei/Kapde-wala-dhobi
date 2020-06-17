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
    let status: String, enrolment:String, updatedDate: String, createdDate: String
    let pajamaCount: Int, pantCount: Int, bedsheetCount: Int, shirtCount: Int, tshirtCount: Int, towelCount: Int, jeansCount: Int
    init(id: Int, status: String, enrolment: String, createdDate: String, updatedDate: String, pajamaCount: Int, pantCount: Int, bedsheetCount: Int, shirtCount: Int, tshirtCount: Int, towelCount: Int, jeansCount: Int) {
        self.id = id
        self.status = status
        self.enrolment = enrolment
        self.updatedDate = updatedDate
        self.pajamaCount = pajamaCount
        self.pantCount = pantCount
        self.bedsheetCount = bedsheetCount
        self.shirtCount = shirtCount
        self.tshirtCount = tshirtCount
        self.towelCount = towelCount
        self.jeansCount = jeansCount
        self.createdDate = createdDate
    }
}

