//
//  FeedViewController.swift
//  Parstagram
//
//  Created by Nafeeur on 10/10/21.
//

import UIKit
import Parse

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    var posts = [PFObject]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                tableView.delegate = self
                tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Posts")
               query.includeKeys(["author"])
               query.limit = 20
       
        
        query.findObjectsInBackground { (posts, error) in
                    if posts != nil {
                        self.posts = posts!
                        self.tableView.reloadData()
                    } else {
                        print("error")
                    }
        
        
    }
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        
        let post = posts[indexPath.row]
        
        let user = post["author"] as! PFUser
        
        cell.usernameLabel.text = user.username
        cell.captionLabel.text = post["caption"] as! String
        
        return cell;
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    }
