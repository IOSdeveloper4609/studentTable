//
//  CustomizationTable.swift
//  StudentTable
//
//  Created by Азат Киракосян on 28.11.2020.
//

import UIKit





// MARK: - CustomizationTable

 class CustomizationTable: UIViewController {
    
    // MARK: - Lazy properties
   
   lazy var saveBarBtn = UIBarButtonItem(title: "Сохранить",style: .done, target: self, action: #selector(save))
   lazy var cancelBarBtn = UIBarButtonItem(title: "Отмена", style: .done, target: self, action: #selector(cancel))
    
    // MARK: - Public properties
    
    var studentChoice = StudentModel()
    var studentDelegate : CustomizationTableDelegate?
    
    // MARK: - Private properties
    
     let womanSwitch = UISwitch()
     let menSwitch = UISwitch()
     let ratingSwitch = UISwitch()
     let womanLabel = UILabel()
     let menLabel = UILabel()
     let ratingLabel = UILabel()
   
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createWomanSwitch()
        createMenSwitch()
        createRatingSwitch()
        createWomanLabel()
        createMenLabel()
        createRatingLabel()
        setupNaviBar()
       
    }
    
    // MARK: - Private methods
    
    private func sortedSwitch() {
        if ratingSwitch.isOn {
            studentChoice.rating = 0
            studentChoice.gender = nil
        } else if menSwitch.isOn {
            studentChoice.gender = "женский"
            studentChoice.rating = nil
        } else if womanSwitch.isOn {
            studentChoice.gender = "мужской"
            studentChoice.rating = nil
        }
    }
    
    
    private  func setupNaviBar() {
        navigationItem.title = "Настройки"
        view.backgroundColor = .systemGray6
        self.navigationItem.rightBarButtonItem = saveBarBtn
        self.navigationItem.leftBarButtonItem = cancelBarBtn
        
    }
    
    private func createRatingLabel() {
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.text = "Показать только отличников"
        ratingLabel.font = ratingLabel.font.withSize(22)
        self.view.addSubview(ratingLabel)
        
        ratingLabel.topAnchor.constraint(equalTo: menLabel.bottomAnchor, constant: 62).isActive = true
        ratingLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
    }
    
    private  func createMenLabel() {
        menLabel.translatesAutoresizingMaskIntoConstraints = false
        menLabel.text = "Показать только мальчиков"
        menLabel.font = menLabel.font.withSize(22)
        self.view.addSubview(menLabel)
        
        menLabel.topAnchor.constraint(equalTo: womanLabel.bottomAnchor, constant: 62).isActive = true
        menLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
    }
    
    
    private func createWomanLabel() {
        womanLabel.translatesAutoresizingMaskIntoConstraints = false
        womanLabel.text = "Показать только девочек"
        womanLabel.font = womanLabel.font.withSize(22)
        self.view.addSubview(womanLabel)
        
        womanLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 155).isActive = true
        womanLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
    }
    
    private func createWomanSwitch() {
        womanSwitch.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(womanSwitch)
        womanSwitch.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        womanSwitch.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
    }
    
    private func createMenSwitch() {
        menSwitch.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(menSwitch)
        
        menSwitch.topAnchor.constraint(equalTo: womanSwitch.bottomAnchor, constant: 60).isActive = true
        menSwitch.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
    }
    
    private func createRatingSwitch() {
        ratingSwitch.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(ratingSwitch)
        
        ratingSwitch.topAnchor.constraint(equalTo: menSwitch.bottomAnchor, constant: 60).isActive = true
        ratingSwitch.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
    }
    
    // MARK: - Selectors
    
     @objc private func save() {
        sortedSwitch()
        studentDelegate?.sortStudent(model: studentChoice)
        self.dismiss(animated: true, completion: nil)
    }
    
   
    @objc private func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    
}
