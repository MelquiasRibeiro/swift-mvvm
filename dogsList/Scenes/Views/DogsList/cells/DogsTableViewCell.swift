//
//  DogsTableViewCell.swift
//  dogsList
//
//  Created by Idwall Go Dev 012 on 10/04/22.
//

import UIKit
import Kingfisher

class DogsTableViewCell: UITableViewCell {
    
    // MARK: - Properties

    static let identifier: String = "DogsTableViewCell"
   
    var dogImage:UIImageView = {
        let dogImage = UIImageView()
        dogImage.image = UIImage(named: "bulldougue")
        dogImage.translatesAutoresizingMaskIntoConstraints = false
        dogImage.contentMode = .scaleAspectFill
        dogImage.clipsToBounds =  true
        return dogImage
    }()
    
    var dogName:UILabel = {
       let dogName = UILabel()
        dogName.text = "Oliver"
        dogName.font = UIFont.boldSystemFont(ofSize: 17)
        dogName.translatesAutoresizingMaskIntoConstraints = false
        

       return dogName
    }()
    
    var dogBreed:UILabel = {
       let dogBreed = UILabel()
        dogBreed.text = "bulldougue"
        dogBreed.translatesAutoresizingMaskIntoConstraints = false

       return dogBreed
    }()
    
    // MARK: - Contructor
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Helpers
    func configureUI(){
    
        contentView.addSubview(dogImage)
        NSLayoutConstraint.activate([
            dogImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            dogImage.heightAnchor.constraint(equalToConstant: 80),
            dogImage.widthAnchor.constraint(equalToConstant: 80),
            dogImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
       

       
    let textContainer = UIStackView(arrangedSubviews: [dogName,dogBreed])
        textContainer.axis = .vertical
        textContainer.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(textContainer)
        NSLayoutConstraint.activate([
            textContainer.leadingAnchor.constraint(equalTo: self.dogImage.trailingAnchor,constant: 16),
            textContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            textContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func setup(dog:Dog){
        let dogImageUrl = URL(string: dog.dogImage)
        self.dogImage.kf.setImage(with:dogImageUrl)
        self.dogName.text = dog.dogName
        self.dogBreed.text = dog.dogBreed
    }
}
