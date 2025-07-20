//
//  TaskCell.swift
//  ToDoList
//
//  Created by pablo henrique on 13/07/25.
//

import UIKit

class TaskCell: UITableViewCell {

    let checkbox = UIButton(type: .system)
    let titleLabel = UILabel()
    let deleteButton = UIButton(type: .system)

    var onToggleDone: (() -> Void)?
    var onDelete: (() -> Void)?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        backgroundColor = .clear
        selectionStyle = .none

        // Container visual com borda e cantos
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = UIColor(white: 1.0, alpha: 0.05)
        container.layer.cornerRadius = 8
        contentView.addSubview(container)

        container.addSubview(checkbox)
        container.addSubview(titleLabel)
        container.addSubview(deleteButton)

        checkbox.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false

        // Estilização
        checkbox.tintColor = .systemBlue
        deleteButton.tintColor = .gray
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 16)

        // Ícones
        deleteButton.setImage(UIImage(systemName: "trash"), for: .normal)

        // Ações
        checkbox.addTarget(self, action: #selector(didTapCheckbox), for: .touchUpInside)
        deleteButton.addTarget(self, action: #selector(didTapDelete), for: .touchUpInside)

        // Layout
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            checkbox.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            checkbox.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 12),
            checkbox.widthAnchor.constraint(equalToConstant: 24),
            checkbox.heightAnchor.constraint(equalToConstant: 24),

            deleteButton.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            deleteButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -12),
            deleteButton.widthAnchor.constraint(equalToConstant: 24),
            deleteButton.heightAnchor.constraint(equalToConstant: 24),

            titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 12),
            titleLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -12),
            titleLabel.leadingAnchor.constraint(equalTo: checkbox.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor, constant: -12)
        ])
    }

    func configure(with task: Task) {
        titleLabel.text = task.title
        let config = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)

        if task.isDone {
            checkbox.setImage(UIImage(systemName: "checkmark.circle.fill", withConfiguration: config), for: .normal)
            checkbox.tintColor = .systemPurple

            // Estilo de concluído
            let attributeString = NSMutableAttributedString(string: task.title)
            attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            titleLabel.attributedText = attributeString
            titleLabel.textColor = .gray
        } else {
            checkbox.setImage(UIImage(systemName: "circle", withConfiguration: config), for: .normal)
            checkbox.tintColor = .systemBlue

            // Estilo normal
            titleLabel.attributedText = nil
            titleLabel.text = task.title
            titleLabel.textColor = .white
        }
    }

    @objc private func didTapCheckbox() {
        onToggleDone?()
    }

    @objc private func didTapDelete() {
        onDelete?()
    }
}
