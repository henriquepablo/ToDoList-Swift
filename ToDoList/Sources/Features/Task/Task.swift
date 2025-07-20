//
//  Task.swift
//  ToDoList
//
//  Created by pablo henrique on 13/07/25.
//

import Foundation

struct Task {
    let id: UUID
    var title: String
    var isDone: Bool

    init(title: String, isDone: Bool = false) {
        self.id = UUID()
        self.title = title
        self.isDone = isDone
    }
}
