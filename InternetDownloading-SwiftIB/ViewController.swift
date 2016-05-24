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
    @IBOutlet weak var activityIndicator2: UIActivityIndicatorView!
    @IBOutlet weak var activityIndicator3: UIActivityIndicatorView!
    @IBOutlet weak var activityIndicator4: UIActivityIndicatorView!
    
    let url1 = NSURL(string: "http://ucla201602.certifiednetworks.com/slowimage.php?delay=10")!
    let url2 = NSURL(string: "https://s3-us-west-2.amazonaws.com/uclaiosclass/acPiano.jpg")!
    let url3 = NSURL(string: "https://s3-us-west-2.amazonaws.com/uclaiosclass/acTaylor.jpg")!
    let url4 = NSURL(string: "https://s3-us-west-2.amazonaws.com/uclaiosclass/acMoonSOT.jpg")!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupImageDownload(activityIndicator1, url: url1, imageView: imageView1)
        setupImageDownload(activityIndicator2, url: url2, imageView: imageView2)
        setupImageDownload(activityIndicator3, url: url3, imageView: imageView3)
        setupImageDownload(activityIndicator4, url: url4, imageView: imageView4)
        
    }
    
    func setupImageDownload(activityIndicator: UIActivityIndicatorView, url: NSURL, imageView: UIImageView)
    {
        // start activity indicator
        activityIndicator.startAnimating()
        
        let session = NSURLSession.sharedSession()  // NOTE sharedSession is for basic requests
        
        let downloadTask = session.dataTaskWithURL(url) { data, response, error in
            if data == nil {
                print("\(error)")
                
            } else {
                dispatch_async(dispatch_get_main_queue()) {
                    imageView.image = UIImage(data: data!)
                    imageView.contentMode = UIViewContentMode.ScaleAspectFit
                    
                    // stop activity indicator
                    activityIndicator.stopAnimating()
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

