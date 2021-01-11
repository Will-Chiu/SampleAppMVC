//
//  EventInputView.swift
//  SampleAppMVC
//
//  Created by Will Chiu on 5/1/2021.
//

import UIKit

protocol ViewDelegate: class {
    func eventUpdate(event: String)
}


class ToDoView: UIView, UITableViewDelegate {
    
    weak var deleglate: ViewDelegate?
    
    let color1 = UIColor(red: 241/255, green: 250/255, blue: 238/255, alpha: 1)
    let color2 = UIColor(red: 168/255, green: 218/255, blue: 220/255, alpha: 1)
    let color3 = UIColor(red: 0/255, green: 175/255, blue: 185/255, alpha: 1)
    let color4 = UIColor(red: 29/255, green: 53/255, blue: 87/255, alpha: 1)
    
    lazy var newEventLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "New Event"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = color4
        label.textAlignment = .left
        return label
    }()

    lazy var eventInputTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Event detail..."
        textField.textColor = color4
        textField.tintColor = color2
        textField.clearButtonMode = .always
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        return textField
    }()

    lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(tappedUpdateButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add New Event", for: .normal)
        button.setTitleColor(color1, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = color3
        button.layer.cornerRadius = 10
        button.layer.shadowColor = color4.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowOpacity = 0.5
        return button
    }()
    
    lazy var toDoListLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "To Do List"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = color4
        label.textAlignment = .left
        return label
    }()
    
    lazy var toDoTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "eventTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = color2
        tableView.layer.cornerRadius = 10
        tableView.clipsToBounds = true
        return tableView
    }()
    
    // MARK: -
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        toDoTableView.delegate = self
        addSubview(newEventLabel)
        addSubview(eventInputTextField)
        addSubview(addButton)
        addSubview(toDoListLabel)
        addSubview(toDoTableView)
        updateUIView()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    func updateUIView() {
        self.backgroundColor = color1
        
        let newEventLabelConstraints = [
            newEventLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            newEventLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            newEventLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            newEventLabel.heightAnchor.constraint(equalToConstant: 20)
        ]
        NSLayoutConstraint.activate(newEventLabelConstraints)
        
        
        let inputTextFieldConstraints = [
            eventInputTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            eventInputTextField.topAnchor.constraint(equalTo: newEventLabel.bottomAnchor, constant: 8),
            eventInputTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            eventInputTextField.heightAnchor.constraint(equalToConstant: 40)
        ]
        NSLayoutConstraint.activate(inputTextFieldConstraints)
        
        let updateButtonConstraints = [
            addButton.topAnchor.constraint(equalTo: eventInputTextField.bottomAnchor, constant: 32),
            addButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            addButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            addButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        NSLayoutConstraint.activate(updateButtonConstraints)
        
        let toDoListLabelConstraints = [
            toDoListLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            toDoListLabel.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 48),
            toDoListLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            toDoListLabel.heightAnchor.constraint(equalToConstant: 20)
        ]
        NSLayoutConstraint.activate(toDoListLabelConstraints)
        
        let toDoTableViewConstraints = [
            toDoTableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            toDoTableView.topAnchor.constraint(equalTo: toDoListLabel.bottomAnchor, constant: 8),
            toDoTableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            toDoTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40)
        ]
        NSLayoutConstraint.activate(toDoTableViewConstraints)

    }
    
    // MARK: -
    @objc func tappedUpdateButton(_ sender: UIButton) {
        guard let eventString = eventInputTextField.text else { return }
        eventInputTextField.text = ""
        deleglate?.eventUpdate(event: eventString)
    }

}

