//
//  CustomTableViewCell.swift
//  StudentTable
//
//  Created by Азат Киракосян on 27.11.2020.
//

import UIKit

class CustomCell: UITableViewCell {

    private let editButton = UIButton()
    private let nameLabel = UILabel()
    private let lastNameLabel = UILabel()
    private let floorLabel = UILabel()
    private let ratingLabel = UILabel()
    private let cosialNetworkLabel = UILabel()
    
    private let nameLabelPlaseholder = UILabel()
    private let lastNamelabelPlaseholder = UILabel()
    private let floorLabelPlaseholder = UILabel()
    private let ratingLabelPlaseholder = UILabel()
    
    
    
    override init(style: CustomCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(lastNameLabel)
        contentView.addSubview(floorLabel)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(nameLabelPlaseholder)
        contentView.addSubview(lastNamelabelPlaseholder)
        contentView.addSubview(floorLabelPlaseholder)
        contentView.addSubview(ratingLabelPlaseholder)
        contentView.addSubview(cosialNetworkLabel)
        contentView.addSubview(editButton)
        
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
        floorLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabelPlaseholder.translatesAutoresizingMaskIntoConstraints = false
        lastNamelabelPlaseholder.translatesAutoresizingMaskIntoConstraints = false
        floorLabelPlaseholder.translatesAutoresizingMaskIntoConstraints = false
        ratingLabelPlaseholder.translatesAutoresizingMaskIntoConstraints = false
        cosialNetworkLabel.translatesAutoresizingMaskIntoConstraints = false
        editButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -175).isActive = true
        nameLabel.font = nameLabel.font.withSize(20)
        nameLabel.shadowColor = .lightGray
        nameLabel.shadowOffset = CGSize(width: -1.5, height: -1.5)
        nameLabel.textColor = .black
        
        
        lastNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15).isActive = true
        lastNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        lastNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -175).isActive = true
        lastNameLabel.font = lastNameLabel.font.withSize(20)
        lastNameLabel.shadowColor = .lightGray
        lastNameLabel.shadowOffset = CGSize(width: -1.5, height: -1.5)
        lastNameLabel.textColor = .black
        
        
        
        
        floorLabel.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor, constant: 15).isActive = true
        floorLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        floorLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -175).isActive = true
        floorLabel.font = floorLabel.font.withSize(20)
        floorLabel.shadowColor = .lightGray
        floorLabel.shadowOffset = CGSize(width: -1.5, height: -1.5)
        floorLabel.textColor = .black
        
        
        
        ratingLabel.topAnchor.constraint(equalTo: floorLabel.bottomAnchor, constant: 15).isActive = true
        ratingLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        ratingLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -175).isActive = true
        ratingLabel.shadowColor = .lightGray
        ratingLabel.shadowOffset = CGSize(width: -1.5, height: -1.5)
        ratingLabel.textColor = .black

        
        cosialNetworkLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 15).isActive = true
        cosialNetworkLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        cosialNetworkLabel.font = cosialNetworkLabel.font.withSize(20)
        cosialNetworkLabel.shadowColor = .lightGray
        cosialNetworkLabel.shadowOffset = CGSize(width: -1.5, height: -1.5)
        cosialNetworkLabel.textColor = .black
        cosialNetworkLabel.text = " соц.сети"
      
        
        
        
        nameLabelPlaseholder.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 19).isActive = true
        nameLabelPlaseholder.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        nameLabelPlaseholder.font = nameLabelPlaseholder.font.withSize(15)
        nameLabelPlaseholder.text = "имя студента"
        nameLabelPlaseholder.alpha = 0.2
        
        
        lastNamelabelPlaseholder.topAnchor.constraint(equalTo: nameLabelPlaseholder.bottomAnchor, constant: 20).isActive = true
        lastNamelabelPlaseholder.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        lastNamelabelPlaseholder.font = lastNamelabelPlaseholder.font.withSize(15)
        lastNamelabelPlaseholder.text = "фамилия студента"
        lastNamelabelPlaseholder.alpha = 0.2
        
        
        floorLabelPlaseholder.topAnchor.constraint(equalTo: lastNamelabelPlaseholder.bottomAnchor, constant: 20).isActive = true
        floorLabelPlaseholder.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        floorLabelPlaseholder.font = floorLabelPlaseholder.font.withSize(15)
        floorLabelPlaseholder.text = "пол студента"
        floorLabelPlaseholder.alpha = 0.2
        
        
        ratingLabelPlaseholder.topAnchor.constraint(equalTo: floorLabelPlaseholder.bottomAnchor, constant: 20).isActive = true
        ratingLabelPlaseholder.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        ratingLabelPlaseholder.font = ratingLabelPlaseholder.font.withSize(15)
        ratingLabelPlaseholder.text = "рейтинг студента"
        ratingLabelPlaseholder.alpha = 0.2
        
        
        editButton.topAnchor.constraint(equalTo: ratingLabelPlaseholder.bottomAnchor, constant: 13).isActive = true
        editButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        editButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        editButton.setTitle("редактировать", for: .normal)
        editButton.setTitleColor(.systemBlue, for: .normal)
        
        
        
        
        
       
}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
   public func setupWithModel(model: Student) {
       
        nameLabel.text = model.nameStudent
        lastNameLabel.text = model.lastNameStudent
        floorLabel.text = model.floorStudent
        ratingLabel.text = model.ratingStudent
        
       
    }

}
