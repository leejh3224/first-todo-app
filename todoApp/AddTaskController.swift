//
//  AddTaskController.swift
//  todoApp
//
//  Created by 이준형 on 4/12/19.
//  Copyright © 2019 com.leejunhyung. All rights reserved.
//

import UIKit

protocol AddTask {
	func addTask(name: String)
}

class AddTaskController: UIViewController {

	@IBOutlet weak var taskNameField: UITextField!
	@IBAction func onClickAddButton(_ sender: Any) {
		_addTask(text: taskNameField.text!)
	}
	@IBAction func keyboardReturn(_ sender: Any) {
		_addTask(text: taskNameField.text!)
	}
	
	var delegate: AddTask?

	override func viewDidLoad() {
		super.viewDidLoad()
		self.taskNameField.delegate = self
	}
	
	private func _addTask(text: String) {
		if text != "" {
			delegate?.addTask(name: taskNameField.text!)
			navigationController?.popViewController(animated: true)
			taskNameField.text = ""
		}
	}
}

extension AddTaskController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		if textField == taskNameField {
			textField.resignFirstResponder()
			return false
		}
		return true
	}
}
