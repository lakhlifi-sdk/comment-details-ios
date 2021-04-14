//
//  DetailsViewController.swift
//  testApi
//
//  Created by Lakhlifi Essaddiq on 4/14/21.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var body: UILabel!
    
    var comment : Comment?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        if let comment = comment{
            self.email.text = comment.email
            self.name.text = comment.name
            self.body.text = comment.body
        }
    }
    

   
}
