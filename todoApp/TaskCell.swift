//
//  TaskCell.swift
//  todoApp
//
//  Created by 이준형 on 4/12/19.
//  Copyright © 2019 com.leejunhyung. All rights reserved.
//

import UIKit

protocol ChangeCheckboxImage {
	func changeCheckboxImage(checked: Bool, index: Int)
}

class TaskCell: UITableViewCell {
	@IBOutlet weak var checkbox: UIButton!
	@IBAction func checkboxAction(_ sender: Any) {
		if tasks![index!].checked {
			delegate?.changeCheckboxImage(checked: false, index: index!)
		} else {
			delegate?.changeCheckboxImage(checked: true, index: index!)
		}
	}
	@IBOutlet weak var taskLabel: UILabel!
	
	var delegate: ChangeCheckboxImage?
	var index: Int?
	var tasks: [Task]?
}
