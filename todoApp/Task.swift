//
//  Task.swift
//  todoApp
//
//  Created by 이준형 on 4/12/19.
//  Copyright © 2019 com.leejunhyung. All rights reserved.
//

import Foundation

class Task {
	var name = ""
	var checked = false
	
	convenience init(name: String) {
		self.init()
		self.name = name
	}
}
