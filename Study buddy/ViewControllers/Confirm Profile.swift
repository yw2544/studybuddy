//
//  Confirm Profile.swift
//  Study buddy
//
//  Created by yue on 12/1/23.
//

import Foundation

import UIKit

class ConfirmProfile: UIViewController {
    
    // MARK: - Properties (view)
    private let profileImageView = UIImageView()
    private let nameText = UILabel()
    private let nameTextBox = UITextField()
    private let collegeText = UILabel()
    private let collegeTextBox = UITextField()
    private let majorText = UILabel()
    private let majorTextBox = UITextField()
    private let birthdayText = UILabel()
    private let birthdayTextBox = UITextField()
    private let yearText = UILabel()
    private let yearTextBox = UITextField()
    private let sexText = UILabel()
    private let sexTextBox = UITextField()
    private let nextButton = UIButton()
    
    // MARK: - Properties (data)
    private var name: String = ""
    weak var delegate: UpdateTextDelegate?
    
    // MARK: - viewDidLoad and init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.hc.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.backgroundColor = UIColor.hc.rose
        view.backgroundColor = UIColor.white
        setupProfileImageView()
        setupLabel()
        setupNextButton()
        
//        self.nextButton.addTarget(self, action: #selector(ViewController()), for:.touchUpInside)
        
        
    }
    
    init(name: String, delegate: UpdateTextDelegate){
        self.name = name
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set Up Views
    private func setupProfileImageView(){
        profileImageView.image = UIImage(named:"profile.pic")
        profileImageView.layer.cornerRadius = 110
        profileImageView.layer.masksToBounds = true
        
        view.addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            profileImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 220),
            profileImageView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    private func setupLabel(){
        nameText.text = self.name
        nameText.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        nameText.textColor = UIColor.black
        
        view.addSubview(nameText)
        
        nameText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameText.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant:16),
            nameText.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
        
    private func setupNextButton(){
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.hc.white, for: .normal)
        nextButton.backgroundColor = .hc.rose
        nextButton.layer.cornerRadius = 16
        nextButton.addTarget(self, action: #selector(nextpage), for: .touchUpInside)
        view.addSubview(nextButton)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            nextButton.heightAnchor.constraint(equalToConstant: 53)
            ])
            
        }
    
    
    @objc private func nextpage(){
        //TODO: Push ViewControllerTwo
        let viewController2 = ViewController()
        navigationController?.pushViewController(viewController2, animated: true)


    }
    }

//extension ProfileVC: UpdateTextDelegate {
//    func updateText(newName: String){
//        nameText.text = newName
//    }

//}
