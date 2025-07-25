//
//  SplashViewController.swift
//  ToDoList
//
//  Created by pablo henrique on 06/07/25.
//

import Foundation
import UIKit

class SplashViewController: UIViewController {
    
    let contentView = SplashView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let TodoViewController = TodoViewController()
            
            TodoViewController.modalTransitionStyle = .crossDissolve
            TodoViewController.modalPresentationStyle = .fullScreen
            self.present(TodoViewController, animated: true, completion: nil)
        }
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
}
