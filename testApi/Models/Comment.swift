//
//  Comment.swift
//  testApi
//
//  Created by Lakhlifi Essaddiq on 4/14/21.
//

import UIKit

class Comment: NSObject {

    
    let id : Int
    let postId : Int
    let name : String
    let email : String
    let body : String
    
    internal init(id: Int, postId: Int, name: String, email: String, body: String) {
        self.id = id
        self.postId = postId
        self.name = name
        self.email = email
        self.body = body
    }
    

}
