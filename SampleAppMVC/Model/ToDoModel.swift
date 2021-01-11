//
//  ToDoModel.swift
//  SampleAppMVC
//
//  Created by Will Chiu on 5/1/2021.
//

import Foundation

protocol ModelDelegate {
    func modelUpdated()
}

class ToDoModel {
    var toDoList = ["Go to market", "Meet friend at KingCross", "Pick delivery"] {
        didSet {
            delegate?.modelUpdated()
        }
    }
    var delegate: ModelDelegate?
    
    func addEvent(event: String) {
        toDoList.append(event)
    }
    
    func deleteEvent(index: Int) {
        toDoList.remove(at: index)
    }
    
}
