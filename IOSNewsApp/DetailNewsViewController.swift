//
//  DetailNewsViewController.swift
//  IOSNewsApp
//
//  Created by MacBook on 10.04.2022.
//
import UIKit
import Alamofire
import SwiftyJSON



class DetailNewsViewController: UIViewController {
    var curNews: DetailedNewsData!
    var deligate: TableViewController?
    
    @IBOutlet weak var newsTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTitle?.text=curNews.title
        descr?.text=curNews.description
        author?.text=curNews.author
        pubDate?.text=curNews.p_date
        jlink?.text=curNews.link
        image.load(urlString: curNews.image)
    }
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var jlink: UILabel!
    @IBOutlet weak var descr: UITextView!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var pubDate: UILabel!
}
    
extension UIImageView{
    func load(urlString : String){
        guard let url = URL(string: urlString)
        else{
            return
        }
        DispatchQueue.global().async{[weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async{
                        self?.image=image
                    }
                }
            }
            
        }
    }
    
}
