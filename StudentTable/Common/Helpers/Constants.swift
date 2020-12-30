//
//  CustomizationTable.swift
//  StudentTable
//
//  Created by Азат Киракосян on 28.11.2020.
//

import UIKit

// MARK: - Constants

extension TableViewController {
    
    enum Constants {
        
        static var studentsArray = [
            Student(nameStudent: "Диана ", lastNameStudent: "Киракосян", genderStudent: Gender.woman.rawValue, ratingStudent: 9, socialNetwork: "https://vk.com/id43603871" ),
            Student(nameStudent: "Айк", lastNameStudent: "Саркисян", genderStudent: Gender.men.rawValue, ratingStudent: 8, socialNetwork: "https://vk.com/id257096999" ),
            Student(nameStudent: "Бениамин", lastNameStudent: "Саркисян", genderStudent: Gender.men.rawValue, ratingStudent: 7, socialNetwork: "https://vk.com/beniamiiin"),
            Student(nameStudent: "Андрей", lastNameStudent: "Еремин", genderStudent: Gender.men.rawValue, ratingStudent: 10, socialNetwork: "https://vk.com/id67162897" ),
            Student(nameStudent: "Виолетта ", lastNameStudent: "Черепанова", genderStudent: Gender.woman.rawValue, ratingStudent: 8, socialNetwork: "https://vk.com/ponos_korov" ),
            Student(nameStudent: "Михаил", lastNameStudent: "Ратов", genderStudent: Gender.men.rawValue, ratingStudent: 9, socialNetwork: "https://vk.com/m.ratov" ),
            Student(nameStudent: "Диана", lastNameStudent: "Соколова", genderStudent: Gender.woman.rawValue, ratingStudent: 6, socialNetwork: nil ),
            Student(nameStudent: "Кирилл ", lastNameStudent: "Иванушкин", genderStudent: Gender.men.rawValue, ratingStudent: 5, socialNetwork: "https://vk.com/id264894860" ),
            Student(nameStudent: "Максим", lastNameStudent: "Мамонтов", genderStudent:Gender.men.rawValue, ratingStudent: 9, socialNetwork: "https://vk.com/netudoma45" ),
            Student(nameStudent: "Юлия", lastNameStudent: "Козлова", genderStudent: Gender.woman.rawValue, ratingStudent: 9, socialNetwork: nil ),
            Student(nameStudent: "Виктория ", lastNameStudent: "Мулюкина", genderStudent: Gender.woman.rawValue, ratingStudent: 4, socialNetwork: nil ),
            Student(nameStudent: "Азат", lastNameStudent: "Киракосян", genderStudent: Gender.men.rawValue, ratingStudent: 8, socialNetwork: "https://vk.com/id548842345" ),
            Student(nameStudent: "Мария", lastNameStudent: "Бондарь", genderStudent: Gender.woman.rawValue, ratingStudent: 6, socialNetwork: "https://vk.com/marybondar1"),
            Student(nameStudent: "Екатерина", lastNameStudent: "Скалон", genderStudent: Gender.woman.rawValue, ratingStudent: 10, socialNetwork: "https://vk.com/ekaterinaskalon" ),
            Student(nameStudent: "Евгения ", lastNameStudent: "Кузьмина", genderStudent: Gender.woman.rawValue, ratingStudent: 7, socialNetwork: nil ),
            Student(nameStudent: "Анна ", lastNameStudent: "Бутова", genderStudent: Gender.woman.rawValue, ratingStudent: 6, socialNetwork: nil ),
            Student(nameStudent: "Алексей ", lastNameStudent: "Скутаренко", genderStudent: Gender.men.rawValue, ratingStudent: 8, socialNetwork: "https://vk.com/id26955116" )]
    }
    
    enum Gender: String {
        case men = "мужской"
        case woman = "женский"
    }
}

