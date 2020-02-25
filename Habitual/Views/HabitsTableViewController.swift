//
//  MainViewController.swift
//  Habitual
//
//  Created by Henry Calderon on 2/20/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class HabitsTableViewController: UITableViewController {
    private var persistence = PersistenceLayer()
    
    var habits: [Habit] = [
        Habit(title: "Go to bed before 10pm", image: Habit.Images.book),
        Habit(title: "Drink 8 Glasses of Water", image: Habit.Images.book),
        Habit(title: "Commit Today", image: Habit.Images.book),
        Habit(title: "Stand up every Hour", image: Habit.Images.book)
    ]
    
    
    var names: [String] = ["Alan", "Braus", "Adriana", "Mitchell", "Dani", "Jess", "Dan", "Meredith", "Dan", "Milad"]
    
//MARK: Cell configuration==========
    // return the number of rows for the given section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persistence.habits.count
    }
    
    // return the UITableViewCell for the given indexPath
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell( withIdentifier: HabitTableViewCell.identifier, for: indexPath) as! HabitTableViewCell
       let habit = persistence.habits[indexPath.row]
      cell.configure(habit)
      return cell
    }
    
//MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        
        tableView.register(
                    HabitTableViewCell.nib,
                    forCellReuseIdentifier: HabitTableViewCell.identifier
        )
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)

           persistence.setNeedsToReloadHabits()
           tableView.reloadData()
    }

    
}

//MARK: Habit Table View Controller extension
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
