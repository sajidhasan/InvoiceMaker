//
//  Business.swift
//  InvoiceMaker
//
//  Created by Sajid Hasan on 21/6/20.
//  Copyright © 2020 Sajidd. All rights reserved.
//

import Foundation


class Business {
    var businessName: String
    var businessAddress : String
    var businessCity: String
    var businessCountry: String
    
    init(name: String, address: String, city: String, country: String) {
        self.businessName = name
        self.businessAddress = address
        self.businessCity = city
        self.businessCountry = country
    }
}
