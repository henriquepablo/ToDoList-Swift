//
//  TodoView.swift
//  ToDoList
//
//  Created by pablo henrique on 06/07/25.
//

import Foundation
import UIKit


class TodoView: UIView {
    
    private let HeaderView: UIView = {
        let header = UIView()
        header.backgroundColor = Colors.gray700
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    private let LogoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Logo")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let PlusImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Plus")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    public let InputTodo: UITextField = {
        let input = UITextField()
        input.attributedPlaceholder = NSAttributedString(
            string: "Adicione uma nova tarefa",
            attributes: [
                .foregroundColor: Colors.gray300
            ]
        )
        input.textColor = Colors.gray100
        input.font = UIFont.boldSystemFont(ofSize: 16)
        input.borderStyle = .none
        input.layer.cornerRadius = 6
        input.backgroundColor = Colors.gray500
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        input.leftView = paddingView
        input.leftViewMode = .always
        
        input.addTarget(self, action: #selector(handleEditingDidBegin), for: .editingDidBegin)
        input.addTarget(self, action: #selector(handleEditingDidEnd), for: .editingDidEnd)

        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
        
    public let AddTodo: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = Colors.blueDark
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let LabelCreated: UILabel = {
        let label = UILabel()
        label.text = "Criadas"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = Colors.blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let LabelFinish: UILabel = {
        let label = UILabel()
        label.text = "Concluídas"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = Colors.purple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let LabelCreatedCount: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = Colors.gray200
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ContainerCountCreated: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray400
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public let LabelFinishCount: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = Colors.gray200
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ContainerCountFinish: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray400
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = Colors.gray600
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let TopBorder: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray400
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let ContainerEmptyList: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let ClipboardImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Clipboard")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let MessageStrong: UILabel = {
        let label = UILabel()
        label.text = "Você ainda não tem tarefas cadastradas"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = Colors.gray300
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let MessageWeak: UILabel = {
        let label = UILabel()
        label.text = "Crie tarefas e organize seus itens a fazer"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = Colors.gray300
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    private func setupUI() {
        self.backgroundColor = Colors.gray600
        
        addSubview(HeaderView)
        HeaderView.addSubview(LogoImageView)
        addSubview(InputTodo)
        addSubview(AddTodo)
        AddTodo.addSubview(PlusImageView)
        addSubview(LabelCreated)
        addSubview(ContainerCountCreated)
        ContainerCountCreated.addSubview(LabelCreatedCount)
        addSubview(ContainerCountFinish)
        ContainerCountFinish.addSubview(LabelFinishCount)
        addSubview(LabelFinish)
        addSubview(ContainerEmptyList)
        ContainerEmptyList.addSubview(TopBorder)
        ContainerEmptyList.addSubview(ClipboardImage)
        ContainerEmptyList.addSubview(MessageStrong)
        ContainerEmptyList.addSubview(MessageWeak)
        addSubview(tableView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            HeaderView.topAnchor.constraint(equalTo: self.topAnchor),
            HeaderView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            HeaderView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            HeaderView.heightAnchor.constraint(equalToConstant: 200),
            
            LogoImageView.centerXAnchor.constraint(equalTo: HeaderView.centerXAnchor),
            LogoImageView.centerYAnchor.constraint(equalTo: HeaderView.centerYAnchor, constant: 20),
            LogoImageView.widthAnchor.constraint(equalToConstant: 110),
            LogoImageView.heightAnchor.constraint(equalToConstant: 32),
            
            InputTodo.topAnchor.constraint(equalTo: LogoImageView.bottomAnchor, constant: 40),
            InputTodo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            InputTodo.heightAnchor.constraint(equalToConstant: 52),
            
            AddTodo.topAnchor.constraint(equalTo: LogoImageView.bottomAnchor, constant: 40),
            AddTodo.leadingAnchor.constraint(equalTo: InputTodo.trailingAnchor, constant: 4),
            AddTodo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            AddTodo.heightAnchor.constraint(equalToConstant: 52),
            AddTodo.widthAnchor.constraint(equalToConstant: 52),
            
            PlusImageView.centerXAnchor.constraint(equalTo: AddTodo.centerXAnchor),
            PlusImageView.centerYAnchor.constraint(equalTo: AddTodo.centerYAnchor),
            
            LabelCreated.topAnchor.constraint(equalTo: InputTodo.bottomAnchor, constant: 33),
            LabelCreated.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            
            ContainerCountCreated.topAnchor.constraint(equalTo: InputTodo.bottomAnchor, constant: 33),
            ContainerCountCreated.leadingAnchor.constraint(equalTo: LabelCreated.trailingAnchor, constant: 8),
            ContainerCountCreated.widthAnchor.constraint(equalToConstant: 25),
            ContainerCountCreated.heightAnchor.constraint(equalToConstant: 19),
            
            LabelCreatedCount.centerXAnchor.constraint(equalTo: ContainerCountCreated.centerXAnchor),
            LabelCreatedCount.centerYAnchor.constraint(equalTo: ContainerCountCreated.centerYAnchor),
            
            ContainerCountFinish.topAnchor.constraint(equalTo: InputTodo.bottomAnchor, constant: 33),
            ContainerCountFinish.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            ContainerCountFinish.widthAnchor.constraint(equalToConstant: 25),
            ContainerCountFinish.heightAnchor.constraint(equalToConstant: 19),

            LabelFinishCount.centerXAnchor.constraint(equalTo: ContainerCountFinish.centerXAnchor),
            LabelFinishCount.centerYAnchor.constraint(equalTo: ContainerCountFinish.centerYAnchor),
            
            LabelFinish.topAnchor.constraint(equalTo: InputTodo.bottomAnchor, constant: 33),
            LabelFinish.trailingAnchor.constraint(equalTo: ContainerCountFinish.leadingAnchor, constant: -8),
            
            ContainerEmptyList.topAnchor.constraint(equalTo: LabelFinish.bottomAnchor, constant: 20),
            ContainerEmptyList.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 33),
            ContainerEmptyList.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -33),
            ContainerEmptyList.heightAnchor.constraint(equalToConstant: 208),
            
            TopBorder.topAnchor.constraint(equalTo: ContainerEmptyList.topAnchor),
            TopBorder.leadingAnchor.constraint(equalTo: ContainerEmptyList.leadingAnchor),
            TopBorder.trailingAnchor.constraint(equalTo: ContainerEmptyList.trailingAnchor),
            TopBorder.heightAnchor.constraint(equalToConstant: 1),
            
            ClipboardImage.centerXAnchor.constraint(equalTo: ContainerEmptyList.centerXAnchor),
            ClipboardImage.centerYAnchor.constraint(equalTo: ContainerEmptyList.centerYAnchor),
            
            MessageStrong.topAnchor.constraint(equalTo: ClipboardImage.bottomAnchor, constant: 16),
            MessageStrong.leadingAnchor.constraint(equalTo: ContainerEmptyList.leadingAnchor, constant: 30),
            MessageStrong.trailingAnchor.constraint(equalTo: ContainerEmptyList.trailingAnchor, constant: -20),
            
            MessageWeak.topAnchor.constraint(equalTo: MessageStrong.bottomAnchor, constant: 1),
            MessageWeak.leadingAnchor.constraint(equalTo: ContainerEmptyList.leadingAnchor, constant: 35),
            MessageWeak.trailingAnchor.constraint(equalTo: ContainerEmptyList.trailingAnchor, constant: -20),
            
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            tableView.topAnchor.constraint(equalTo: TopBorder.bottomAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    @objc private func handleEditingDidBegin() {
        InputTodo.layer.borderColor = Colors.purpleDark.cgColor
        InputTodo.layer.borderWidth = 1
        
    }

    @objc private func handleEditingDidEnd() {
        InputTodo.layer.borderColor = .none
        InputTodo.layer.borderWidth = 0
    }
}
