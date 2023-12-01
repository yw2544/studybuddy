//
//  PostpoolCell.swift
//  Study buddy
//
//  Created by yue on 11/30/23.
//

import Foundation
import UIKit

class PostpoolCell:UICollectionViewCell {
    
    // MARK: - Properties (view)
    private let namelabel = UILabel()
    private let postbody = UILabel()
    private let timelabel = UILabel()
  
   
    // MARK: - Properties (data)
    var post: Post?
    private let postName = "Anonymous"
    static let reuse = "PostCellReuse"


    
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        layer.cornerRadius = 16
            // Call helper functions
        
        setupnamelabel()
        setuptimelabel()
        setuppostbody()
        
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //`configure` function (do not make private)
    func configure(post: Post) {
        self.post = post
        postbody.text = post.message
        
        timelabel.text = post.time
       
        
        }
    
   
    
    
    
    // MARK: - Set Up Views
    
    
    private func setupnamelabel() {
        
        namelabel.text = postName
        namelabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        namelabel.layer.cornerRadius = 16
        namelabel.textColor = UIColor.hc.textGrey
   
        contentView.addSubview(namelabel)
        namelabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            namelabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant:24),
            namelabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
        
        ])
        }
    
    private func setuptimelabel() {
        
        timelabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        timelabel.textColor = UIColor.hc.textGrey
        contentView.addSubview(timelabel)
        timelabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            timelabel.topAnchor.constraint(equalTo: namelabel.bottomAnchor, constant:0),
            timelabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
        
        ])
        }
    
    private func setuppostbody() {
      
        postbody.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        postbody.textColor = UIColor.black
  
        contentView.addSubview(postbody)
        postbody.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            postbody.topAnchor.constraint(equalTo: timelabel.bottomAnchor, constant:16),
            postbody.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            postbody.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            postbody.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            postbody.heightAnchor.constraint(equalToConstant:  48)
        ])
        }
    
    
    
    }
    
    

    
    
    
    // MARK: - Button Helpers
    
    
    
    
    
    


