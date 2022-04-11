//
//  TableViewController.swift
//  IOSNewsApp
//
//  Created by MacBook on 10.04.2022.
//

import UIKit
import Alamofire
import SwiftyJSON

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var newsTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsDatas.count;
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsCell = newsTableView.dequeueReusableCell(withIdentifier: "newsId", for: indexPath) as! NewsCell
//        newsCell.author.text="asdfa1"
//        newsCell.title.text="asdfa2"
//        newsCell.published.text="asdfa3"
        newsCell.author.text=newsDatas[indexPath.row].author
        newsCell.title.text=newsDatas[indexPath.row].title
        newsCell.published.text=newsDatas[indexPath.row].p_date
        return newsCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsVC = self.storyboard!.instantiateViewController(withIdentifier: "DetVC") as! DetailNewsViewController
//        detailedVC.deligate=self
//        detailedVC.curNews=detailedNewsDatas[indexPath.row]
//
//        let hotTableVC = self.storyboard!.instantiateViewController(withIdentifier: "HotTableVC") as! HotTableView
//        self.navigationController?.pushViewController(hotTableVC, animated: true)
        
//        self.navigationController?.pushViewController(detailedVC, animated: true)
        
//        let newsVC = DetailNewsViewController()
        newsVC.deligate=self
        newsVC.curNews=detailedNewsDatas[indexPath.row]
//        let resultViewController = storyBoard.instantiateViewControllerWithIdentifier("ViewController") as! ViewController

               navigationController?.pushViewController(newsVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.delegate=self
        newsTableView.dataSource=self
        print("HEEE")
        print(newsDatas.count)
    }
}
