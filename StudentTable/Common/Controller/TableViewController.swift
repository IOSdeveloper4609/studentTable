//
//  StudentTableViewController.swift
//  StudentTable
//
//  Created by Азат Киракосян on 27.11.2020.
//

import UIKit


// MARK: - StudentTableViewController

final class TableViewController: UIViewController {
    
    // MARK: - Public properties
    
    let myTableView = UITableView()
    var filteredStudents = Constants.studentsArray.sorted {$0.lastNameStudent < $1.lastNameStudent}
    let identifire = "Cell"
   
    
    
    // MARK: - Private properties
    
    private let filtresImage = UIImage(named: "custom")
    private let searchController = UISearchController(searchResultsController: nil)
    private var studentChoice = StudentModel()
    
    
    
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greateTableView()
        addBarButtonItem()
        filtresBarButtonItem()
        createSearchBar()
        setupNaviBar()
    }
    
    // MARK: - Private methods
    
    private func sortedStudents() {
        if studentChoice.gender != nil {
            filteredStudents = Constants.studentsArray.filter { $0.genderStudent == studentChoice.gender }
            self.myTableView.reloadData()
        }
        else if studentChoice.rating != nil {
            filteredStudents = Constants.studentsArray.filter { $0.ratingStudent > 8 }
            self.myTableView.reloadData()
        }
    }
   
    private func setupNaviBar() {
        navigationItem.title = "Список студентов"
        navigationController?.navigationBar.barTintColor = .systemGray5
    }

    private func createSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        myTableView.tableHeaderView = searchController.searchBar
        
    }
    
    private func addBarButtonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add, style: .done, target: self, action: #selector(addActionBarButtonItem))
    }
    
    private func filtresBarButtonItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: filtresImage, style: .done, target: self, action: #selector(filtresActionBarButtonItem))
    }
    
    private func greateTableView() {
        myTableView.rowHeight = 200.0
        myTableView.register(CustomCell.self, forCellReuseIdentifier: identifire)
        view.addSubview(myTableView)
        
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.delegate = self
        myTableView.dataSource = self
        
        myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        myTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    // MARK: - Selectors
    
    @objc private func addActionBarButtonItem() {
        addStudentAlert()
    }
    
    @objc func filtresActionBarButtonItem() {
        let controller = CustomizationTable()
        let controllerNav = UINavigationController(rootViewController: controller)
        controller.studentDelegate = self
        self.navigationController?.present(controllerNav, animated: true, completion: nil)

    }
}

// MARK: - CustomizationTableDelegate

extension TableViewController : CustomizationTableDelegate {
    func sortStudent(model: StudentModel) {
        
        studentChoice = model
        sortedStudents()
    }
}
