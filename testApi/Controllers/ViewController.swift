//
//  ViewController.swift
//  testApi
//
//  Created by Lakhlifi Essaddiq on 4/14/21.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    
    @IBOutlet weak var tableView : UITableView!
    var list = ["item1", "item2", "item3"]
    
    var commentList = [Comment]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.frame = view.bounds
        // Do any additional setup after loading the view.
        self.getDataFromApi()
    }
    
    func getDataFromApi(){
        AF.request("https://jsonplaceholder.typicode.com/comments").responseJSON(completionHandler: {
            data in
            guard let dataValue  = data.value else { return }
            let json = JSON(dataValue)
            
            
            
            for (_,comment):(String, JSON) in json {
                
                guard let body = comment["body"].string,
                let id = comment["id"].int,
                let name = comment["name"].string,
                let postId = comment["postId"].int,
                let email = comment["email"].string else {
                    return
                }
                self.commentList.append(Comment(id: id, postId: postId, name: name, email: email, body: body))
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.commentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comment = self.commentList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellTableViewCell
        cell?.neme.text = "\(comment.name)"
        cell?.email.text = "\(comment.email)"
        //cell?.textLabel?.text = "\(comment.name)"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let comment = self.commentList[indexPath.row]      
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsViewController = storyBoard.instantiateViewController(withIdentifier: "detailsViewController") as! DetailsViewController
        detailsViewController.comment = comment
        navigationController?.pushViewController(detailsViewController, animated: true)
        //self.present(detailsViewController, animated: true, completion: nil)
    }
    
    

}

