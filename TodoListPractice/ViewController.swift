//
//  ViewController.swift
//  TodoListPractice
//
//  Created by 최진문 on 2024/05/02.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    
    @IBOutlet var tableView: UITableView!
    
     func reloadTableView() {
        tableView.reloadData()
    }
    
    @IBAction func addTodoCell(_ sender: Any) {
        let alert = UIAlertController(title: "할 일 추가", message: "", preferredStyle: .alert)
               let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
               let add = UIAlertAction(title: "추가", style: .default) {(_) in
                   if let title = alert.textFields?[0].text {
                       let todo = TodoModel(todo: title, completed: false, id: TodoModel.lastId)
                       TodoModel.todoSources.append(todo)
                       self.tableView.reloadData() // 테이블 뷰를 새로고침함 -> 안하면 추가 안됨
                   }
               }
               alert.addAction(cancel)
               alert.addAction(add)
               alert.addTextField(configurationHandler: { (tf) in
                   tf.placeholder = "할 일을 입력해주세요"
               })
               
               self.present(alert, animated: false)
    }
    
    func configureUI() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: TodoTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: TodoTableViewCell.identifier)
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoModel.todoSources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoTableViewCell.identifier, for: indexPath) as? TodoTableViewCell else { return UITableViewCell() }
        
        cell.onToggle = { [weak self] isOn in
            TodoModel.todoSources[indexPath.row].completed = isOn
            self?.tableView.reloadData()
        }
        cell.configureUI(todo: TodoModel.todoSources[indexPath.row])
//        cell.`switch`.tag = indexPath.row
        
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
            if editingStyle == .delete {
                
                TodoModel.todoSources.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                
            } else if editingStyle == .insert {
                
            }
        }
}

//#Preview {
//  ViewController()
//}
