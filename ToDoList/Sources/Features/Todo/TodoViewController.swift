//
//  TodoViewController.swift
//  ToDoList
//
//  Created by pablo henrique on 06/07/25.
//

import Foundation
import UIKit


class TodoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let contentView = TodoView()
    var tasks: [Task] = [] {
        didSet {
            updateEmptyState()
            updateCounters()
            contentView.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
        updateEmptyState()
        setup()
    }
    
    private func setup() {
        self.view.addSubview(contentView)
        self.navigationController?.navigationBar.isHidden = true
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func updateEmptyState() {
        let isEmpty = tasks.isEmpty
        contentView.tableView.isHidden = isEmpty
        contentView.ContainerEmptyList.isHidden = !isEmpty
    }
    
    func updateCounters() {
        let created = tasks.count
        let done = tasks.filter { $0.isDone }.count
        contentView.LabelCreatedCount.text = "\(created)"
        contentView.LabelFinishCount.text = "\(done)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        cell.configure(with: task)

        cell.onToggleDone = { [weak self] in
            self?.tasks[indexPath.row].isDone.toggle()
        }

        cell.onDelete = { [weak self] in
            self?.tasks.remove(at: indexPath.row)
        }

        return cell
    }
}
