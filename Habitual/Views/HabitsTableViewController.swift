//
//  MainViewController.swift
//  Habitual
//
//  Created by Henry Calderon on 2/20/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class HabitsTableViewController: UITableViewController {
    
    var habits: [Habit] = [
        Habit(title: "Go to bed before 10pm", image: Habit.Images.book),
        Habit(title: "Drink 8 Glasses of Water", image: Habit.Images.book),
        Habit(title: "Commit Today", image: Habit.Images.book),
        Habit(title: "Stand up every Hour", image: Habit.Images.book)
    ]
    
    
    var names: [String] = ["Alan", "Braus", "Adriana", "Mitchell", "Dani", "Jess", "Dan", "Meredith", "Dan", "Milad"]
    // return the number of rows for the given section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    // return the UITableViewCell for the given indexPath
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if let dequeueCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = dequeueCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        let habit = habits[indexPath.row]
        cell.textLabel?.text = habit.title
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()

        // Do any additional setup after loading the view.
    }
    
}

extension HabitsTableViewController{
    func setupNavBar(){
        title = "Habitual"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pressAddHabit(_:)))
    }
    
    @objc func pressAddHabit(_ sender: UIBarButtonItem){
        names.insert("Hello World!", at: 0)
        let topIndexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [topIndexPath], with: .automatic)
    }
}
