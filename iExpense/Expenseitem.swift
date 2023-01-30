//
//  Expenseitem.swift
//  iExpense
//
//  Created by Yashraj jadhav on 23/01/23.
//

import Foundation

struct ExpenseItem : Identifiable , Codable {
    var id = UUID()
    let name : String
    let type : String
    let amount : Double
    
}
