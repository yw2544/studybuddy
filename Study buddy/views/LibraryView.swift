//
//  LibraryView.swift
//  Study buddy
//
//  Created by yue on 11/30/23.
//

import Foundation
import UIKit


class ScrollableViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - Properties (view)
    private var collectionView: UICollectionView!
    
    // MARK: - Properties (data)
    private var libraries = Library.dummylibraries
    private let refreshControl = UIRefreshControl()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Libraries"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = UIColor.hc.rose
        
        setupCollectionView()
        setupRefreshControl()
        collectionView.delegate = self
    }
    
    var alwaysBounceVertical = true
    
    // MARK: - Set Up Views
    private func setupCollectionView() {
        let padding: CGFloat = 24
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = padding
        
        // Calculate item size for two columns
        let itemWidth = (view.bounds.width - (padding * 3)) / 2
        flowLayout.itemSize = CGSize(width: itemWidth, height: 216)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.hc.rose
        
        collectionView.register(LibraryCell.self, forCellWithReuseIdentifier: LibraryCell.reuse)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.alwaysBounceVertical = true
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupRefreshControl() {
        // Configure Refresh Control
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        collectionView.refreshControl = refreshControl
    }

    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return libraries.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LibraryCell.reuse, for: indexPath) as? LibraryCell else {
            fatalError("Unable to dequeue LibraryCell")
        }
        cell.configure(library: libraries[indexPath.row])
        return cell
    }
    
    @objc private func refreshData(_ sender: UIRefreshControl) {
        // TODO: Update your data source
        // getRoster()
        
        // End the refreshing
        DispatchQueue.main.async {
            sender.endRefreshing()
        }
    }

//     MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedLibrary = libraries[indexPath.row]
        let detailedViewController = PostController()
        detailedViewController.library = selectedLibrary
        
        navigationController?.pushViewController(detailedViewController, animated: true)

    }
}

   



