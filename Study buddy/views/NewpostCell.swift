//
//  NewpostCell.swift
//  Study buddy
//
//  Created by yue on 11/30/23.
//

import Foundation
import UIKit

class NewpostCell: UICollectionViewCell {
    
    // MARK: - Properties (view)
    weak var delegate: NewpostCellDelegate?
    private let textField = UITextField()
    private let postButton = UIButton()
    
    
    // MARK: - Properties (data)
    
    static let reuse: String = "NewpostCellReuse"
    private let postName = "Anonymous"
    

    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        layer.cornerRadius = 16
        
        setupTextField()
        setupPostButton()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set Up Views

    private func setupTextField() {
        textField.placeholder = "✏️ Write your name, specific place, etc."
        textField.font = .systemFont(ofSize: 16)
        
        contentView.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        let sidePadding: CGFloat = 24
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sidePadding),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -sidePadding),
            textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: sidePadding)
        ])
    }
    
    private func setupPostButton() {
        postButton.backgroundColor = UIColor.hc.rose
        postButton.layer.cornerRadius = 4
        postButton.setTitle("Post", for: .normal)
        postButton.setTitleColor(UIColor.white, for: .normal)
        postButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        postButton.addTarget(self, action: #selector(createPost), for: .touchUpInside)
        
        contentView.addSubview(postButton)
        postButton.translatesAutoresizingMaskIntoConstraints = false
        
        let sidePadding: CGFloat = 24
        NSLayoutConstraint.activate([
            postButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -sidePadding),
            postButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -sidePadding),
            postButton.widthAnchor.constraint(equalToConstant: 96),
            postButton.heightAnchor.constraint(equalToConstant: 32),
            postButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 32)
        ])
    }
    
    // MARK: - Button Helpers
    
    @objc private func createPost() {
        
        delegate?.didTapCreatePost(withMessage: textField.text ?? "")
    }
    
}

protocol NewpostCellDelegate: AnyObject {
    func didTapCreatePost(withMessage message: String)
}
