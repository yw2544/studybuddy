//
//  ViewController.swift
//  Study buddy
//
//  Created by yue on 11/29/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let pagetitleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Explore"
        view.backgroundColor = UIColor.hc.rose
       setupPagetitleLabel()
        
        // Setup ScrollableViewController
        let scrollableViewController = ScrollableViewController()
        addChild(scrollableViewController)
        view.addSubview(scrollableViewController.view)
        setupScrollableViewControllerConstraints(scrollableViewController.view)
        scrollableViewController.didMove(toParent: self)
        
        // Setup FilterScrollableViewController
        //        let filterViewController = FilterScrollableViewController()
        //        addChild(filterViewController)
        //        view.addSubview(filterViewController.view)
        //        setupFilterScrollableViewControllerConstraints(filterViewController.view)
        //        filterViewController.didMove(toParent: self)
    }
    
    private func setupPagetitleLabel() {
        pagetitleLabel.text = "Explore"
        pagetitleLabel.textColor = UIColor.white
        pagetitleLabel.backgroundColor = UIColor.hc.rose
        
        pagetitleLabel.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        view.addSubview(pagetitleLabel)
        pagetitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pagetitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            pagetitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
        ])
    }
    
    private func setupScrollableViewControllerConstraints(_ scrollView: UIView) {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo:view.bottomAnchor,constant: 0)
        ])
    }
}
