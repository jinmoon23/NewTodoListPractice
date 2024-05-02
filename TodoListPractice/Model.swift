//
//  Model.swift
//  TodoListPractice
//
//  Created by 최진문 on 2024/05/02.
//

import Foundation
import UIKit

class TodoModel {
    
    static var lastId = 0
    static func nextId() -> Int {
        lastId += 1
        return lastId
    }
    
    var id: Int
    var todo: String
    var completed: Bool
    
    init(todo: String, completed: Bool, id: Int) {
        self.todo = todo
        self.completed = completed
        self.id = TodoModel.nextId()
    }
    
    static var todoSources: [TodoModel] = [
        TodoModel(todo: "안녕하세요!", completed: false, id: lastId),
        TodoModel(todo: "TodoList를 추가하려면", completed: false, id: TodoModel.lastId),
        TodoModel(todo: "우측 상단 '추가하기' 버튼을 눌러주세요!", completed: false, id: TodoModel.lastId)
    ]
  
}

extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
    func removeStrikethrough() -> NSAttributedString {
           let attributeString = NSMutableAttributedString(string: self)
           attributeString.removeStrikethrough()
           return attributeString
       }
}

extension NSMutableAttributedString {
    func removeStrikethrough() {
        removeAttribute(NSAttributedString.Key.strikethroughStyle, range: NSMakeRange(0, length))
    }
}
