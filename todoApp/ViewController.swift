//
//  ViewController.swift
//  todoApp
//
//  Created by 이준형 on 4/12/19.
//  Copyright © 2019 com.leejunhyung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	var tasks: [Task] = []

	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		addTask(name: "Hello world!")
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let viewController = segue.destination as! AddTaskController
		viewController.delegate = self
	}
}

extension ViewController: UITableViewDelegate {}

extension ViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tasks.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
		
		cell.taskLabel.text = tasks[indexPath.row].name
		
		if tasks[indexPath.row].checked {
			cell.checkbox.setBackgroundImage(UIImage(named: "icon_checkbox_checked"), for: UIControl.State.normal)
			cell.taskLabel.setStrikethrough(text: cell.taskLabel.text!)
		} else {
			cell.checkbox.setBackgroundImage(UIImage(named: "icon_checkbox_empty"), for: UIControl.State.normal)
			cell.taskLabel.unsetStrikethrough(text: cell.taskLabel.text!)
		}
		
		cell.delegate = self
		cell.index = indexPath.row
		cell.tasks = tasks
		
		return cell
	}
}

extension ViewController: AddTask {
	func addTask(name: String) {
		tasks.append(Task(name: name))
		tableView.reloadData()
	}
}

extension ViewController: ChangeCheckboxImage {
	func changeCheckboxImage(checked: Bool, index: Int) {
		tasks[index].checked = checked
		tableView.reloadData()
	}
}

