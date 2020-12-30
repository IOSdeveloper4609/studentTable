//
//  StudentTableViewController.swift
//  StudentTable
//
//  Created by Азат Киракосян on 27.11.2020.
//

import UIKit

struct StudentModel {
    
    var floor: String?
    var rating: String?
}

// MARK: - StudentTableViewController

final class TableViewController: UIViewController,UISearchResultsUpdating {
   
    // MARK: - Private properties
    
    var studentModel = StudentModel()
    private let myTableView = UITableView()
    private let identifire = "Cell"
    private let filtresImage = UIImage(named: "custom" )
    public var URl = String()
    private var studentsArray = [
        
        TableModel(nameStudent: "Диана ", lastNameStudent: "Киракосян", floorStudent: "женский", ratingStudent: "6.4", socialNetwork: "https://vk.com/id43603871" ),
        TableModel(nameStudent: "Айк", lastNameStudent: "Саркисян", floorStudent: "мужской", ratingStudent: "7.2", socialNetwork: "https://vk.com/id257096999" ),
        TableModel(nameStudent: "Бениамин", lastNameStudent: "Саркисян", floorStudent: "мужской", ratingStudent: "7.8", socialNetwork: "https://vk.com/beniamiiin"),
        TableModel(nameStudent: "Андрей", lastNameStudent: "Еремин", floorStudent: "мужской", ratingStudent: "7.0", socialNetwork: "https://vk.com/id67162897" ),
        TableModel(nameStudent: "Виолетта ", lastNameStudent: "Черепанова", floorStudent: "женский", ratingStudent: "7.1", socialNetwork: "https://vk.com/ponos_korov" ),
        TableModel(nameStudent: "Михаил", lastNameStudent: "Ратов", floorStudent: "мужской", ratingStudent: "7.2", socialNetwork: "https://vk.com/m.ratov" ),
        TableModel(nameStudent: "Диана", lastNameStudent: "Соколова", floorStudent: "женский", ratingStudent: "6.4", socialNetwork: nil ),
        TableModel(nameStudent: "Кирилл ", lastNameStudent: "Иванушкин", floorStudent: "мужской", ratingStudent: "5.7", socialNetwork: "https://vk.com/id264894860" ),
        TableModel(nameStudent: "Максим", lastNameStudent: "Мамонтов", floorStudent: "мужской", ratingStudent: "7.2", socialNetwork: "https://vk.com/netudoma45" ),
        TableModel(nameStudent: "Юлия", lastNameStudent: "Козлова", floorStudent: "женский", ratingStudent: "6.8", socialNetwork: nil ),
        TableModel(nameStudent: "Виктория ", lastNameStudent: "Мулюкина", floorStudent: "женский", ratingStudent: "6.1", socialNetwork: nil ),
        TableModel(nameStudent: "Азат", lastNameStudent: "Киракосян", floorStudent: "мужской", ratingStudent: "6.1", socialNetwork: "https://vk.com/id548842345" ),
        TableModel(nameStudent: "Мария", lastNameStudent: "Бондарь", floorStudent: "женский", ratingStudent: "6.7", socialNetwork: "https://vk.com/marybondar1"),
        TableModel(nameStudent: "Екатерина", lastNameStudent: "Скалон", floorStudent: "женский", ratingStudent: "6.6", socialNetwork: "https://vk.com/ekaterinaskalon" ),
        TableModel(nameStudent: "Евгения ", lastNameStudent: "Кузьмина", floorStudent: "женский", ratingStudent: "6.5", socialNetwork: nil ),
        TableModel(nameStudent: "Анна ", lastNameStudent: "Бутова", floorStudent: "женский", ratingStudent: "6.2", socialNetwork: nil ),
        TableModel(nameStudent: "Алексей ", lastNameStudent: "Скутаренко", floorStudent: "мужской", ratingStudent: "6.0", socialNetwork: "https://vk.com/id26955116" )
       
    ]
    
    private var filteredStudents = [TableModel]()
    private let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        sortedArrayStudents()
        greateTableView()
        addBarButtonItem()
        filtresBarButtonItem()
        filtresBarButtonItem()
        navigationItem.title = "Список студентов"
        createSearchBar()
        navigationController?.navigationBar.barTintColor = .systemGray5
     
    }
    
   private func sortedArrayStudents() {
        
        filteredStudents = studentsArray.sorted { (firstStudent,secondStudent) -> Bool in
            
            return firstStudent.lastNameStudent < secondStudent.lastNameStudent
        }
    }
    
    private func createSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        myTableView.tableHeaderView = searchController.searchBar
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchValue = searchController.searchBar.text?.lowercased() ?? ""
        
        if searchValue.isEmpty {
            filteredStudents = studentsArray
        } else {
            filteredStudents = studentsArray.filter {
                $0.nameStudent.lowercased().hasPrefix(searchValue) ||
                    $0.lastNameStudent.lowercased().hasPrefix(searchValue) ||
                    $0.floorStudent.lowercased().hasPrefix(searchValue)
            }
        }
        
        myTableView.reloadData()
    }
   
    private func addBarButtonItem() {
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(image: .add, style: .done, target: self, action: #selector(addActionBarButtonItem)),UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(addActionBarButtonItem))]
        
    }
    
    @objc func addActionBarButtonItem() {
        
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
            
            if name.count != 0 && lastName.count != 0 && floor.count != 0 && rating.count != 0   {
                
                let  newStudent = TableModel(nameStudent: name , lastNameStudent: lastName, floorStudent: floor, ratingStudent: rating, socialNetwork: nil)
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
    
    private func filtresBarButtonItem() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: filtresImage, style: .done, target: self, action: #selector(filtresActionBarButtonItem))
        
    }
    
    @objc func filtresActionBarButtonItem() {
        
        let filtredTable = CustomizationTable(studentModel: studentModel)
        filtredTable.modalPresentationStyle = .popover
        filtredTable.delegate = self
        navigationController?.pushViewController(filtredTable, animated: true)
        
        
    }
    
    private func greateTableView() {
        
        myTableView.rowHeight = 200
        myTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: identifire)
        view.addSubview(myTableView)
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.delegate = self
        myTableView.dataSource = self
        
        myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        myTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    
}


extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredStudents.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath) as! CustomTableViewCell
        cell.setupWithModel(model: filteredStudents[indexPath.row])
        return cell
        
    }
    
    
    
     func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        
        return .delete
    }
    
    
     func  tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            filteredStudents.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let URl = filteredStudents[indexPath.row].socialNetwork
        let socialVC = SocialNetworking()
        
        if let results = URl  {
           
            socialVC.url = results
            navigationController?.pushViewController(socialVC, animated: true)
        } else {
            
            let alertController = UIAlertController(title: "у данного студента нету социальных сетей", message: "", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "ок", style: .cancel, handler: nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}


extension TableViewController: CustomizationTableDelegate {
    func sortStudent(model: StudentModel) {
        studentModel = model
    }
}


