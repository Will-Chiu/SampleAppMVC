//
//  ViewController.swift
//  SampleAppMVC
//
//  Created by Will Chiu on 5/1/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var toDoModel = ToDoModel()
    let toDoView = ToDoView()

    override func viewDidLoad() {
        super.viewDidLoad()
        toDoModel.delegate = self
        toDoView.deleglate = self
        toDoView.toDoTableView.dataSource = self
        toDoView.frame = self.view.bounds
        view.addSubview(toDoView)
    }

}


// MARK: -
extension ViewController: ModelDelegate {
    func modelUpdated() {
        toDoView.toDoTableView.reloadData()
    }
}


//MARK: -
extension ViewController: ViewDelegate {
    func eventUpdate(event: String) {
        if !event.isEmpty {
            toDoModel.addEvent(event: event)
        }
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoModel.toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventTableViewCell", for: indexPath)
        cell.textLabel?.text = String(indexPath.row + 1) + ". " + toDoModel.toDoList[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            toDoModel.deleteEvent(index: indexPath.row)
        }
    }
    
}
