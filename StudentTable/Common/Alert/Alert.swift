//
//  Alert.swift
//  StudentTable
//
//  Created by Азат Киракосян on 21.12.2020.
//

import UIKit

// MARK: - TableViewController

extension  TableViewController {
    
    // MARK: - Public methods
    
    func addStudentAlert() {
        let alertController = UIAlertController(title: "Добавление нового студента", message: "для добавления студента введите данные", preferredStyle: .alert)
        
        alertController.addTextField { (nameStudent) in
            nameStudent.placeholder = "имя студента "
            nameStudent.clearButtonMode = .always
            nameStudent.borderStyle = .roundedRect
        }
        
        alertController.addTextField { (lastNameStudent) in
            lastNameStudent.placeholder = " фамилия студента "
            lastNameStudent.clearButtonMode = .always
            lastNameStudent.borderStyle = .roundedRect
        }
        
        alertController.addTextField { (floorStudent) in
            floorStudent.placeholder = "пол студента "
            floorStudent.clearButtonMode = .always
            floorStudent.borderStyle = .roundedRect
        }
        
        alertController.addTextField { (ratingStudent) in
            ratingStudent.placeholder = " рейтинг студента "
            ratingStudent.clearButtonMode = .always
            ratingStudent.borderStyle = .roundedRect
        }
        
        let canselButton = UIAlertAction(title: "отмена", style: .default, handler: nil)
        let addButton = UIAlertAction(title: "добавить", style: .cancel) { (_) in
            
            guard let  name = alertController.textFields?[0].text else  { return }
            guard let  lastName  = alertController.textFields?[1].text else { return }
            guard let floor = alertController.textFields?[2].text else { return }
            guard let rating = alertController.textFields?[3].text else { return }
            
            if name.count != 0 && lastName.count != 0 && floor.count != 0 && rating.count != 0  {
                let  newStudent = Student(nameStudent: name , lastNameStudent: lastName, genderStudent: floor, ratingStudent: Int(rating) ?? 0, socialNetwork: nil)
                self.filteredStudents.insert(newStudent, at: 0)
                self.myTableView.reloadData()
                
            } else {
                let errorController = UIAlertController(title: " Для добавления нового студента заполните все поля", message: nil, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "ОК", style: .cancel, handler: nil)
                errorController.addAction(okAction)
                self.present(errorController, animated: true, completion: nil)
            }
        }
        
        alertController.addAction(canselButton)
        alertController.addAction(addButton)
        present(alertController, animated: true, completion: nil)
    }
}
