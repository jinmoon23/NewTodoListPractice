//
//  TodoTableViewCell.swift
//  TodoListPractice
//
//  Created by 최진문 on 2024/05/02.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    static let identifier = "TodoTableViewCell"
    
    @IBOutlet var todoLabel: UILabel!
    
    @IBOutlet var idLabel: UILabel!
    
    @IBOutlet var `switch`: UISwitch!
    
    var onToggle: ((Bool) -> Void)?
    
    @IBAction func toggleSwitch(_ sender: UISwitch) {
//        if `switch`.isOn {
//            TodoModel.todoSources[`switch`.tag].completed = true
//        } else {
//            TodoModel.todoSources[`switch`.tag].completed = false
//        }
        onToggle?(sender.isOn)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        print(idLabel.text)
        // Configure the view for the selected state
        
    }
    
    func configureUI(todo: TodoModel) {
        
        `switch`.isOn = todo.completed
        
        idLabel.text = String(todo.id)
        
        if todo.completed == true {
            todoLabel.attributedText = todo.todo.strikeThrough()
        } else {
            todoLabel.attributedText = NSAttributedString(string: todo.todo)
        }
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        todoLabel.attributedText = nil
    }
}

//#Preview {
//  ViewController()
//}
