//
//  ChildViewController.swift
//  CompactController
//
//  Created by Margarita Slesareva on 13.02.2024.
//

import UIKit

private enum Metrics {
    static let spacing: CGFloat = 8
}

final class ChildViewController: UIViewController {
    
    private let heightSegmentedControl = UISegmentedControl()
    private let closeButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubViews()
        addConstraints()
        configureViews()
    }
    
    private func addSubViews() {
        [heightSegmentedControl, closeButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            heightSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            heightSegmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            
            closeButton.centerYAnchor.constraint(equalTo: heightSegmentedControl.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.spacing),
        ])
    }
    
    private func configureViews() {
        view.backgroundColor = .systemBackground
        
        heightSegmentedControl.insertSegment(withTitle: "280", at: 0, animated: true)
        heightSegmentedControl.insertSegment(withTitle: "150", at: 1, animated: true)
        heightSegmentedControl.selectedSegmentIndex = 0
        
        closeButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        closeButton.tintColor = .systemGray4
    }
}
