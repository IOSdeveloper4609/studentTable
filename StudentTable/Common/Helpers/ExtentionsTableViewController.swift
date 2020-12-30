//
//  ExtentionsTableViewController.swift
//  StudentTable
//
//  Created by Азат Киракосян on 18.12.2020.
//

import UIKit


// MARK: - UITableViewDataSours

extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let contextEdit = UIContextualAction(style: .normal, title: "Edit") { (action, _, _) in
            let alert = UIAlertController(title: "Редактирование студента", message: "", preferredStyle: .alert)
            
            var secondNameTextField : UITextField!
            var nameTextField : UITextField!
            var genderTextField : UITextField!
            var ratingTextField : UITextField!
            
            alert.addAction(UIAlertAction( title: "Сохранить", style: .default, handler: { (updateAction) in
                
                guard let text = secondNameTextField.text, !text.isEmpty else { return }
                guard let nameText = nameTextField.text, !nameText.isEmpty else { return }
                guard let genderText = genderTextField.text, !genderText.isEmpty else { return }
                guard let ratingText = ratingTextField.text, !ratingText.isEmpty else { return }
                
                self.filteredStudents[indexPath.row].lastNameStudent = text
                self.filteredStudents[indexPath.row].nameStudent = nameText
                self.filteredStudents[indexPath.row].genderStudent = genderText
                self.filteredStudents[indexPath.row].ratingStudent = Int(ratingText) ?? 0
                self.myTableView.reloadRows(at: [indexPath], with: .fade)
            }))
            
            alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
            alert.addTextField { (tf) in
                
                nameTextField = tf
                tf.text = self.filteredStudents[indexPath.row].nameStudent
                nameTextField.borderStyle = .roundedRect
            }
            alert.addTextField { (tf) in
                
                secondNameTextField = tf
                secondNameTextField.text = self.filteredStudents[indexPath.row].lastNameStudent
                secondNameTextField.borderStyle = .roundedRect
            }
            alert.addTextField { (tf) in
                
                genderTextField = tf
                genderTextField.text =  self.filteredStudents[indexPath.row].genderStudent
                genderTextField.borderStyle = .roundedRect
            }
            alert.addTextField { (tf) in
                
                ratingTextField = tf
                ratingTextField.text = String(self.filteredStudents[indexPath.row].ratingStudent)
                ratingTextField.borderStyle = .roundedRect
            }
            self.present(alert, animated: true)
        }
        contextEdit.backgroundColor = .green
        contextEdit.image = UIImage(named: "edit")
        
        let contextDelete = UIContextualAction(style: .normal, title: "Delete") { (action, _, _) in
            self.filteredStudents.remove(at: indexPath.row)
            self.myTableView.deleteRows(at: [indexPath], with: .left)
            self.myTableView.reloadData()
        }
        contextDelete.backgroundColor = .red
        contextDelete.image = UIImage(named: "delete")
        let swipeActions = UISwipeActionsConfiguration(actions: [contextDelete, contextEdit])
        swipeActions.performsFirstActionWithFullSwipe = false
        return swipeActions
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath) as! CustomCell
        cell.setupWithModel(model: filteredStudents[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let URl = filteredStudents[indexPath.row].socialNetwork
        let socialVC = SocialNetworking()
        
        if let results = URl  {
            socialVC.url = results
            navigationController?.pushViewController(socialVC, animated: true)
        } else {
            let alertController = UIAlertController(title: "у данного студента нету социальных сетей", message: "", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "ок", style: .cancel, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }
    }
}

// MARK: - UITableViewDelegate

extension TableViewController: UITableViewDelegate { }

// MARK: - UISearchResultsUpdating

extension TableViewController: UISearchResultsUpdating {
     func updateSearchResults(for searchController: UISearchController) {
        let searchValue = searchController.searchBar.text?.lowercased() ?? ""
        if searchValue.isEmpty {
            filteredStudents = Constants.studentsArray.sorted {$0.lastNameStudent < $1.lastNameStudent}
        } else {
            filteredStudents = Constants.studentsArray.filter {
                $0.nameStudent.lowercased().hasPrefix(searchValue) ||
                    $0.lastNameStudent.lowercased().hasPrefix(searchValue) ||
                    $0.genderStudent.lowercased().hasPrefix(searchValue)
            }
        }
        myTableView.reloadData()
    }
}
