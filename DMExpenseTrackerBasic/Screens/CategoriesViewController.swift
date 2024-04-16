//
//  CategoriesViewController.swift
//  DMExpenseTrackerBasic
//
//  Created by David Ruvinskiy on 3/27/23.
//

import UIKit

class CategoriesViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var categorySelectedTable: UITableView!
    
    var expenses = DataController.getExpenses()
    var expensesByCategory:  [String: [Expense]] = [:]
    var categories: [String] = []

    
    func initializeExpenseData() {
        expensesByCategory = Expense.getExpensesByCategory(expenses: expenses)
        categories = Array(expensesByCategory.keys)
    }
    
    func configureTableView() {
        categorySelectedTable.dataSource = self
        categorySelectedTable.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        initializeExpenseData()
    }
    
    @IBSegueAction func categoryPressed(_ coder: NSCoder) -> UIViewController? {
        let category = categories[categorySelectedTable.indexPathForSelectedRow!.item]
        return ExpensesViewController(
            coder: coder,
            category: category,
            expenses: expensesByCategory[category]!
        )
    }
}

extension CategoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.categoryReuseID, for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }
}
