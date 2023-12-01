//
//  PostController.swift
//  Study buddy
//
//  Created by yue on 11/30/23.
//

import UIKit

class PostController: UIViewController {
    
    // MARK: - Properties (view)
    var library: Library?
    private var collectionView: UICollectionView!
    
    // MARK: - Properties (data)
  
    var posts: [Post] = []
   
   
    private let refreshControl = UIRefreshControl()
        
    // MARK: - viewDidLoad
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Posts"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = UIColor.hc.rose
        
        setupCollectionView()
        getRoster()
        
        self.refreshControl.endRefreshing()
        
    }
    
    // MARK: - Set Up Views
    @objc private func getRoster() {
            NetworkManager.shared.fetchRoster { [weak self] posts in
                DispatchQueue.main.async {
                    guard let self = self else { return }
                    self.posts = posts.filter { $0.library == self.library?.name }
                    
                    self.collectionView.reloadData()
                    self.refreshControl.endRefreshing() // End refreshing after data is fetched
                }
            }
        }
   
   
   
//    private func filterPosts() {
//            // Assuming library is set by this point
//            posts = Post.dummyposts.
//            collectionView.reloadData()
//        }
    private func setupCollectionView() {
        
        
        let padding: CGFloat = 24   // Use this constant when configuring constraints
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = padding
        flowLayout.itemSize = CGSize(width: view.bounds.width - (padding * 2), height: 216) 
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.hc.rose
        collectionView.register(NewpostCell.self, forCellWithReuseIdentifier:NewpostCell.reuse)
        collectionView.register(PostpoolCell.self,forCellWithReuseIdentifier: PostpoolCell.reuse)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
//        refreshControl.addTarget(self, action: #selector(getRoster), for: .valueChanged)
//        collectionView.refreshControl = refreshControl
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

// MARK: - UICollectionViewDelegate

extension PostController: UICollectionViewDelegate {
    
    
}

// MARK: - UICollectionViewDataSource

extension PostController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return 1}
        else{
            return posts.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if indexPath.section == 0{
//            let dequeuedCell = collectionView.dequeueReusableCell(withReuseIdentifier: NewpostCell.reuse, for: indexPath)
//            guard let cellOne = dequeuedCell as? NewpostCell else {
//                fatalError("Wrong cell type for section 0. Expected CellTypeOne")
//            }
//            
//            return cellOne}
        if indexPath.section == 0 {
               let dequeuedCell = collectionView.dequeueReusableCell(withReuseIdentifier: NewpostCell.reuse, for: indexPath)
               guard let cellOne = dequeuedCell as? NewpostCell else {
                   fatalError("Wrong cell type for section 0. Expected NewpostCell")
               }
               cellOne.delegate = self
               return cellOne
           }
        
        else{
            let dequeuedCell = collectionView.dequeueReusableCell(withReuseIdentifier: PostpoolCell.reuse, for: indexPath)
            
            guard let cellTwo = dequeuedCell as? PostpoolCell else {
                fatalError("Wrong cell type for section 0. Expected CellTypeTwo")
            }
            
            // configure your CellTypeTwo
            let post = posts[indexPath.row]
            
//            if post.library == library?.name {
//                        cellTwo.configure(post: post)
//                    } else {
//                        // Handle the case where the post does not belong to the specified library
//                        cellTwo.isHidden = true // or any other handling as per your design
//                    }
//                    return cellTwo
            cellTwo.configure(post: post)
            return cellTwo
        }
        
    }
    // TODO: Return the cells for each section
    // HINT: Use `indexPath.section` with an if statement
    
  
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // TODO: Return the number of sections in this table view
        
        return 2 // Replace this line
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // TODO: Return the inset for the spacing between the two sections
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 24, right: 0)
        
    }
}
    


// MARK: - UICollectionViewDelegateFlowLayout

extension PostController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // TODO: Return the size for each cell per section
        // HINT: Use `indexPath.section` with an if statement
        if indexPath.section == 0{
            let width = collectionView.frame.width - 48
            let height : CGFloat = 162
            return CGSize(width: width, height: height)
        }
        else{
            let width = collectionView.frame.width - 48
            let height :CGFloat = 216
            return CGSize(width: width, height: height)
        }
    }
    
}

extension PostController: NewpostCellDelegate {
    func didTapCreatePost(withMessage message: String) {
        guard let libraryName = library?.name else {
            showAlert(message: "Library not set")
            return
        }

        // Create a new Post instance with a placeholder ID and the current time
        // Assuming the server will assign the correct ID
        let currentTime = ISO8601DateFormatter().string(from: Date())
        let newPost = Post(id: 0, time: currentTime, message: message, library: libraryName)
        NetworkManager.shared.addToRoster(for: newPost.library, post: newPost) { [weak self] post in
            DispatchQueue.main.async {
                // Assuming the server returns the new post with the correct ID
                self?.posts.append(post)
                self?.collectionView.reloadData()
                self?.showAlert(message: "Post created successfully")

                // Scroll to the new post
                let indexPath = IndexPath(item: (self?.posts.count ?? 1) - 1, section: 1) // Adjust section if needed
                self?.collectionView.scrollToItem(at: indexPath, at: .bottom, animated: true)
            }
        }
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

