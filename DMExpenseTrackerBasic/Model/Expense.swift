//
//  Expense.swift
//  DMExpenseTrackerBasic
//
//  Created by David Ruvinskiy on 3/27/23.
//

import Foundation

struct Expense{
    var title: String
    var category: String
    var amount: Double
    
    static func calculateTotalSpent(expenses: [Expense]) -> Double  {
        var expensesTotal: Double = 0.0
        for amount in expenses {
            let x = amount.amount
            expensesTotal += x
        }
        return expensesTotal
    }
    
    static func getExpensesByCategory(expenses: [Expense]) -> [String: [Expense]] {
        var expenseCategorys: [String: [Expense]] = [:]
        for expense in expenses {
            if expenseCategorys[expense.category] == nil {
                expenseCategorys[expense.category] = []
            }
            expenseCategorys[expense.category]!.append(expense)
        }
        return expenseCategorys
    }
}
