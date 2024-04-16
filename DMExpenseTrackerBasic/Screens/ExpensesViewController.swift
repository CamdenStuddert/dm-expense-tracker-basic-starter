//
//  ExpensesViewController.swift
//  DMExpenseTrackerBasic
//
//  Created by David Ruvinskiy on 3/28/23.
//

import UIKit

class ExpensesViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var expensesLabel: UILabel!
    @IBOutlet weak var expensesTableView: UITableView!
    
    var category: String
    var expenses: [Expense]
    
    
    init?(coder: NSCoder, category: String, expenses: [Expense]) {
        self.category = category
        self.expenses = expenses
        
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViewController() {
        let totalSpent = Expense.calculateTotalSpent(expenses: expenses)
        let decimalSpent = String(format: "%.2f", totalSpent)
        expensesLabel.text = "You spent \(decimalSpent)$ on \(category)."
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
    }
    
    func configureTableView() {
        expensesTableView.dataSource = self
        expensesTableView.delegate = self
    }
}




extension ExpensesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.expenseReuseID, for: indexPath)
        cell.textLabel?.text = expenses[indexPath.row].title
        let label = UILabel.init(frame: CGRect(x:0,y:0,width:100,height:20))
        label.text = "\(expenses[indexPath.row].amount)"
        cell.accessoryView = label
        return cell
    }
}
