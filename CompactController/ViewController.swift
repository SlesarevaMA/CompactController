//
//  ViewController.swift
//  CompactController
//
//  Created by Margarita Slesareva on 13.02.2024.
//

import UIKit

private enum Metrics {
    static let popoverWidth: CGFloat = 300
    static let popoverHieght: CGFloat = 280
    static let presentButtonTitleColor: UIColor = .systemBlue
    static let shadowColor: UIColor = .systemGray5
    static let shadowRadius: CGFloat = 10
    static let shadowOpacity: Float = 0.8
}

final class ViewController: UIViewController {
    
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
        presentButton.setTitleColor(Metrics.presentButtonTitleColor, for: .normal)
        presentButton.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
    }
    
    @objc private func presentButtonTapped() {
        let popoverController = PopoverViewController()
        popoverController.modalPresentationStyle = .popover
        popoverController.preferredContentSize = CGSize(width: Metrics.popoverWidth, height: Metrics.popoverHieght)
        popoverController.popoverPresentationController?.sourceView = presentButton
        popoverController.loadViewIfNeeded()
        
        present(popoverController, animated: true)
    }
}
