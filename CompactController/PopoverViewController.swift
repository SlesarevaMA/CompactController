//
//  PopoverViewController.swift
//  CompactController
//
//  Created by Margarita Slesareva on 13.02.2024.
//

import UIKit

private enum Metrics {
    static let horizontalSpacing: CGFloat = 8
    static let verticalSpacing: CGFloat = 20

    static let closeButtonHeight: CGFloat = 30
    
    static let closeButtonBackgroundColor: UIColor = .systemGray5
    static let closeButtonTintColor: UIColor = .gray
}

final class PopoverViewController: UIViewController {
    
    var segmentedControlDelegate: SegmentedControlDelegate?
    
    private var viewIsLayedOutFirstTime = false

    private let heightSegmentedControl = UISegmentedControl()
    private let closeButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubViews()
        addConstraints()
        configureViews()
        configurePopover()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        guard !viewIsLayedOutFirstTime else {
            return
        }
        
        closeButton.layer.cornerRadius = closeButton.frame.height / 2

        viewIsLayedOutFirstTime = true
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
            heightSegmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: Metrics.verticalSpacing),
            
            closeButton.centerYAnchor.constraint(equalTo: heightSegmentedControl.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.horizontalSpacing),
            closeButton.heightAnchor.constraint(equalToConstant: Metrics.closeButtonHeight),
            closeButton.widthAnchor.constraint(equalTo: closeButton.heightAnchor)
        ])
    }
    
    private func configureViews() {
        view.backgroundColor = .systemBackground
        
        heightSegmentedControl.insertSegment(withTitle: "280", at: 0, animated: true)
        heightSegmentedControl.insertSegment(withTitle: "150", at: 1, animated: true)
        heightSegmentedControl.selectedSegmentIndex = 0
        heightSegmentedControl.addTarget(self, action: #selector(heightSegmentedControlTapped), for: .valueChanged)
        
        closeButton.setImage(UIImage(systemName: "xmark")?.withRenderingMode(.alwaysTemplate), for: .normal)
        closeButton.tintColor = Metrics.closeButtonTintColor
        closeButton.backgroundColor = Metrics.closeButtonBackgroundColor
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    
    private func configurePopover() {
        popoverPresentationController?.delegate = self
    }
    
    @objc private func heightSegmentedControlTapped() {
        segmentedControlDelegate?.valueChanged(index: heightSegmentedControl.selectedSegmentIndex)
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
}

extension PopoverViewController: UIPopoverPresentationControllerDelegate {

    func adaptivePresentationStyle(
        for controller: UIPresentationController,
        traitCollection: UITraitCollection
    ) -> UIModalPresentationStyle {
        return .none
    }
}
