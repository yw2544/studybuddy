//
//  LibraryCell.swift
//  Study buddy
//
//  Created by yue on 11/29/23.
//

import Foundation
import UIKit


//this is each cell这个是每一个recipe的cell
class LibraryCell: UICollectionViewCell {
    
    static let reuse = "LibraryCellReuse"

    private let libraryName = UILabel()
    private let libraryPhoto = UIImageView()
    

    var library: Library?

    override init(frame: CGRect) {
        super.init(frame: frame)
            
        backgroundColor = UIColor.hc.rose // Example color
            
        setupLibraryPhoto()
        setupLibraryName()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(library: Library) {
        self.library = library
        libraryName.text = library.name
        libraryPhoto.image = UIImage(named: library.image)
    }

    // MARK: - Set Up Views
    private func setupLibraryPhoto() {
        libraryPhoto.layer.masksToBounds = true
        libraryPhoto.layer.cornerRadius = 10
        contentView.addSubview(libraryPhoto)
        libraryPhoto.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            libraryPhoto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            libraryPhoto.topAnchor.constraint(equalTo: contentView.topAnchor, constant:0),
            libraryPhoto.widthAnchor.constraint(equalToConstant: 148),
            libraryPhoto.heightAnchor.constraint(equalToConstant: 148)
        ])
    }
    
    private func setupLibraryName() {
        libraryName.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        libraryName.textColor = UIColor.white
        libraryName.numberOfLines = 0
        contentView.addSubview(libraryName)
        libraryName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            libraryName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 156),
            libraryName.widthAnchor.constraint(equalToConstant: 148),
            libraryName.heightAnchor.constraint(greaterThanOrEqualToConstant: 19)
        ])
    }
    
   
    
}


