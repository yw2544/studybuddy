//
//  ProfileVC.swift
//  Study buddy
//
//  Created by yue on 12/1/23.
//


import UIKit

//create a protocol
protocol UpdateTextDelegate: AnyObject {
    func updateText(newName: String)
}

class ProfileVC: UIViewController, UpdateTextDelegate {
    func updateText(newName: String) {
        self.name = newName
    }
    
    
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
    private var college: String = ""
    private var major: String = ""
    private var birthday: String = ""
    private var year: String = ""
    private var sex: String = ""
    
    // MARK: - viewDidLoad and init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile Setup"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.hc.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.backgroundColor = UIColor.hc.rose
        view.backgroundColor = UIColor.white
        setupProfileImageView()
        setupNameText()
        setupNameTextBox()
        setupCollegeText()
        setupCollegeTextBox()
        setupMajorText()
        setupMajorTextBox()
        setupBirthdayText()
        setupBirthdayTextBox()
        setupYearText()
        setupYearTextBox()
        setupSexText()
        setupSexTextBox()
        setupNextButton()
        
        self.nextButton.addTarget(self, action: #selector(ConfirmProfile), for:.touchUpInside)
        
        
    }
    
    init(name: String, college: String, major: String, birthday: String, year: String, sex: String){
        self.name = name
        self.college = college
        self.major = major
        self.birthday = birthday
        self.year = year
        self.sex = sex
        //self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set Up Views
    private func setupProfileImageView(){
        profileImageView.image = UIImage(named:"profile.pic")
        profileImageView.layer.cornerRadius = 100
        profileImageView.layer.masksToBounds = true
        
        view.addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor ,constant:40),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 200),
            profileImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setupNameText(){
        nameText.text = "Name"
        nameText.font = UIFont.systemFont(ofSize: 15,weight:.medium)
        nameText.textColor = UIColor.hc.black
        view.addSubview(nameText)
        nameText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:28),
            nameText.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 30),
            nameText.heightAnchor.constraint(equalToConstant: 25)
        
        ])
    }
    
    private func setupNameTextBox(){
        nameTextBox.text = ""
                
        nameTextBox.font = UIFont.systemFont(ofSize: 15)
        nameTextBox.layer.borderWidth=2
        nameTextBox.layer.borderColor=UIColor.hc.rose.cgColor
        nameTextBox.layer.cornerRadius = 8
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: nameTextBox.frame.size.height))
        nameTextBox.leftView = leftPaddingView
        nameTextBox.leftViewMode = .always

        view.addSubview(nameTextBox)
        nameTextBox.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
          
            nameTextBox.topAnchor.constraint(equalTo: nameText.bottomAnchor, constant: 4),
            nameTextBox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameTextBox.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            nameTextBox.heightAnchor.constraint(equalToConstant: 48)
        ])

    }
    
    
    private func setupCollegeText (){
        collegeText.text = "College"
        collegeText.font = UIFont.systemFont(ofSize: 15,weight:.medium)
        collegeText.textColor = UIColor.hc.black
        view.addSubview(collegeText)
        collegeText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collegeText.heightAnchor.constraint(equalToConstant: 20),
            collegeText.topAnchor.constraint(equalTo: nameTextBox.bottomAnchor, constant: 24),
            collegeText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:28)
           ])
                   
               }
    
    private func setupCollegeTextBox(){
        collegeTextBox.text = ""
                
        collegeTextBox.font = UIFont.systemFont(ofSize: 15)
        collegeTextBox.layer.borderWidth=2
        collegeTextBox.layer.borderColor=UIColor.hc.rose.cgColor
        collegeTextBox.layer.cornerRadius = 8
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: collegeTextBox.frame.size.height))
        collegeTextBox.leftView = leftPaddingView
        collegeTextBox.leftViewMode = .always

        view.addSubview(collegeTextBox)
        collegeTextBox.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
          
            collegeTextBox.topAnchor.constraint(equalTo: collegeText.bottomAnchor, constant: 4),
            collegeTextBox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collegeTextBox.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collegeTextBox.heightAnchor.constraint(equalToConstant: 48)
        ])

    }

    private func setupMajorText(){
        majorText.text = "Major"
        majorText.font = UIFont.systemFont(ofSize: 15,weight:.medium)
        majorText.textColor = UIColor.hc.black
        view.addSubview(majorText)
        majorText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            majorText.heightAnchor.constraint(equalToConstant: 20),
            majorText.topAnchor.constraint(equalTo: collegeTextBox.bottomAnchor, constant: 24),
            majorText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:32)

        ])
    }
    
    
    private func  setupMajorTextBox(){
        majorTextBox.text = major
        majorTextBox.font = UIFont.systemFont(ofSize: 15)
        majorTextBox.layer.cornerRadius = 8
        majorTextBox.layer.borderWidth=2
        majorTextBox.layer.borderColor=UIColor.hc.rose.cgColor
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: majorTextBox.frame.size.height))
        majorTextBox.leftView = leftPaddingView
        majorTextBox.leftViewMode = .always
        view.addSubview(majorTextBox)
        majorTextBox.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            majorTextBox.topAnchor.constraint(equalTo: majorText.bottomAnchor, constant: 4),
            majorTextBox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            majorTextBox.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            majorTextBox.heightAnchor.constraint(equalToConstant: 48)
                ])

        
    }
    
    
    private func setupBirthdayText(){
        birthdayText.text = "Birthday"
        birthdayText.font = UIFont.systemFont(ofSize: 15,weight:.medium)
        birthdayText.textColor = UIColor.hc.black
        view.addSubview(birthdayText)
        birthdayText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            birthdayText.heightAnchor.constraint(equalToConstant: 20),
            birthdayText.topAnchor.constraint(equalTo: majorTextBox.bottomAnchor, constant: 24),
            birthdayText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:32)

        ])
    }
    
    
    private func  setupBirthdayTextBox(){
        birthdayTextBox.text = ""
        birthdayTextBox.font = UIFont.systemFont(ofSize: 15)
        birthdayTextBox.layer.cornerRadius = 8
        birthdayTextBox.layer.borderWidth=2
        birthdayTextBox.layer.borderColor=UIColor.hc.rose.cgColor
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: birthdayTextBox.frame.size.height))
        birthdayTextBox.leftView = leftPaddingView
        birthdayTextBox.leftViewMode = .always
        view.addSubview(birthdayTextBox)
        birthdayTextBox.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            birthdayTextBox.topAnchor.constraint(equalTo: birthdayText.bottomAnchor, constant: 4),
            birthdayTextBox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            birthdayTextBox.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -230),
            birthdayTextBox.heightAnchor.constraint(equalToConstant: 48)
                ])

        
    }
    
    
    private func setupYearText(){
        yearText.text = "Year"
        yearText.font = UIFont.systemFont(ofSize: 15,weight:.medium)
        yearText.textColor = UIColor.hc.black
        view.addSubview(yearText)
        yearText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            yearText.heightAnchor.constraint(equalToConstant: 20),
            yearText.topAnchor.constraint(equalTo: majorTextBox.bottomAnchor, constant: 24),
            yearText.leadingAnchor.constraint(equalTo: birthdayText.trailingAnchor, constant:80)

        ])
    }
    
    
    private func  setupYearTextBox(){
        yearTextBox.text = ""
        yearTextBox.font = UIFont.systemFont(ofSize: 15)
        yearTextBox.layer.cornerRadius = 8
        yearTextBox.layer.borderWidth=2
        yearTextBox.layer.borderColor=UIColor.hc.rose.cgColor
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: yearTextBox.frame.size.height))
        yearTextBox.leftView = leftPaddingView
        yearTextBox.leftViewMode = .always
        view.addSubview(yearTextBox)
        yearTextBox.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            yearTextBox.topAnchor.constraint(equalTo: yearText.bottomAnchor, constant: 4),
            yearTextBox.leadingAnchor.constraint(equalTo: birthdayTextBox.trailingAnchor, constant: 10),
            yearTextBox.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            yearTextBox.heightAnchor.constraint(equalToConstant: 48)
                ])
        
    }
    
    
    private func setupSexText(){
        sexText.text = "F/M"
        sexText.font = UIFont.systemFont(ofSize: 15,weight:.medium)
        sexText.textColor = UIColor.hc.black
        view.addSubview(sexText)
        sexText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sexText.heightAnchor.constraint(equalToConstant: 20),
            sexText.topAnchor.constraint(equalTo: majorTextBox.bottomAnchor, constant: 24),
            sexText.leadingAnchor.constraint(equalTo: yearText.trailingAnchor, constant:110)

        ])
    }
    
    
    private func  setupSexTextBox(){
        sexTextBox.text = ""
        sexTextBox.font = UIFont.systemFont(ofSize: 15)
        sexTextBox.layer.cornerRadius = 8
        sexTextBox.layer.borderWidth=2
        sexTextBox.layer.borderColor=UIColor.hc.rose.cgColor
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: sexTextBox.frame.size.height))
        sexTextBox.leftView = leftPaddingView
        sexTextBox.leftViewMode = .always
        view.addSubview(sexTextBox)
        sexTextBox.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sexTextBox.topAnchor.constraint(equalTo: sexText.bottomAnchor, constant: 4),
            sexTextBox.leadingAnchor.constraint(equalTo: yearTextBox.trailingAnchor, constant: 15),
            sexTextBox.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            sexTextBox.heightAnchor.constraint(equalToConstant: 48)
                ])

        
    }
    
    private func setupNextButton(){
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.hc.white, for: .normal)
        nextButton.backgroundColor = .hc.rose
        nextButton.layer.cornerRadius = 16
        nextButton.addTarget(self, action: #selector(ConfirmProfile), for: .touchUpInside)
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
   

    
    
    @objc private func ConfirmProfile(){
        //TODO: Push ViewControllerTwo
        let nametext = nameTextBox.text ?? ""

        
        let viewController2 = Studybuddy.ConfirmProfile(name: nametext, delegate: self)
        navigationController?.pushViewController(viewController2, animated: true)
       

    }
}


