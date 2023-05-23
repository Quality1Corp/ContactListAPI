//
//  DetailContactViewController.swift
//  ContactListAPI
//
//  Created by MikhaiL on 22.05.2023.
//

import UIKit
import AlamofireImage

final class DetailContactViewController: UIViewController {
    
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var fullNameLabel: UILabel!
    
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setValues(with: user)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        userImageView.layer.cornerRadius = userImageView.bounds.height / 2
    }
    
    private func setValues(with user: User) {
        fullNameLabel.text = "\(user.name.first) \(user.name.last)"
        genderLabel.text = "Gender - \(user.gender)"
        emailLabel.text = "My email address is \(user.email)"
        phoneNumberLabel.text = "My phone number is \(user.phone)"
        
        guard let imageURL = URL(string: user.picture.large) else { return }
        userImageView.af.setImage(withURL: imageURL)
    }
}
