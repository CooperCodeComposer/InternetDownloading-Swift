//
//  ViewController.swift
//  InternetDownloading-SwiftIB
//
//  Created by Alistair Cooper on 5/23/16.
//  Copyright © 2016 Alistair Cooper. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var activityIndicator1: UIActivityIndicatorView!
    
    var downloadTask: NSURLSessionDownloadTask!
    var backgroundSession: NSURLSession!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator1.startAnimating()
        
        // start network pinwheel
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        let url = NSURL(string: "https://s3-us-west-2.amazonaws.com/uclaiosclass/acPiano.jpg")!
        let session = NSURLSession.sharedSession()  // NOTE sharedSession is for basic requests
        
        let downloadTask = session.dataTaskWithURL(url) { data, response, error in
            if data == nil {
                print("\(error)")
                
            } else {
                dispatch_async(dispatch_get_main_queue()) {
                    self.imageView1.image = UIImage(data: data!)
                    self.imageView1.contentMode = UIViewContentMode.ScaleAspectFit
                    
                    UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                    
                    self.activityIndicator1.stopAnimating()
                }
                
                
            }
            
        }
        
        downloadTask.resume()

        

        
    
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

