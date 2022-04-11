//
//  ViewController.swift
//  IOSNewsApp
//
//  Created by MacBook on 10.04.2022.
//

import UIKit
import Alamofire
import SwiftyJSON



var newsDatas = [NewsData]()
var detailedNewsDatas = [DetailedNewsData]()


class ViewController: UIViewController {
    
    @IBOutlet weak var labelNews: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        getNewsData()
//        myTable.delegate = self
//        myTable.dataSource = self
        labelNews.text="Newses"
//        print(newsDatas.count)
//        self.myTable.reloadData()
        
    }
    
    @IBAction func goNewses(_ sender: Any) {
//        print(newsDatas[0].author)
        for item in newsDatas{
            print(item.author)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func getNewsData(){
        
        AF.request("https://newsapi.org/v2/top-headlines?country=us&apiKey=96983db1075641f283b65aff6d422cff", method: .get).responseJSON { [self]
            (response) in
            
            var value: Any!
            switch response.result {
                    case .success(let val):
                        value = val
                    case .failure(let error):
                        print(error)
                        return
//                        completion(nil)
                    }
                let json = JSON(value)
                
                for item in json["articles"].arrayValue {
                    var newsData = NewsData(title: item["title"].stringValue, p_date: item["publishedAt"].stringValue, author: item["author"].stringValue)
                    var detailedNewsData = DetailedNewsData(title: item["title"].stringValue, p_date: item["publishedAt"].stringValue, author: item["author"].stringValue, image: item["urlToImage"].stringValue, description: item["description"].stringValue, link: item["url"].stringValue
                    )
                    
                    newsDatas.append(newsData)
                    detailedNewsDatas.append(detailedNewsData)

                }
//            for item in newsDatas{
//                print(item.author)
//            }
//            print(newsDatas.count)
        }
    }
}
