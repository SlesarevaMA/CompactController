//
//  ViewController.swift
//  CompactController
//
//  Created by Margarita Slesareva on 13.02.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    private var childViewController: UIViewController?
    private let presentButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(presentButton)
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
        presentButton.setTitle("Present", for: .normal)
        presentButton.setTitleColor(.systemBlue, for: .normal)
        presentButton.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
    }
    
    @objc private func presentButtonTapped() {
//        if childViewController == nil {
//            
//        }
        
        
        present(ChildViewController(), animated: true)
        
//        addChild(viewController)
    }
}
