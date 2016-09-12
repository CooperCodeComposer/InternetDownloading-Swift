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
    @IBOutlet weak var activityIndicator1: UIActivityIndicatorView!
    @IBOutlet weak var activityIndicator2: UIActivityIndicatorView!
    @IBOutlet weak var activityIndicator3: UIActivityIndicatorView!
    
    let url1 = NSURL(string: "https://s3-us-west-2.amazonaws.com/uclaiosclass/acPiano.jpg")
    let url2 = NSURL(string: "https://s3-us-west-2.amazonaws.com/uclaiosclass/acTaylor.jpg")
    let url3 = NSURL(string: "https://s3-us-west-2.amazonaws.com/uclaiosclass/acMoonSOT.jpg")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImageDownload()
        
    }
    
    func setupImageDownload() {
        
        downloadImage(activityIndicator1, url: url1) { (image: UIImage?) in
            
            guard let newImage = image else {
                print("Error: value of image was nil")
                return
            }
            
            self.imageView1.image = newImage
            self.imageView1.contentMode = UIViewContentMode.ScaleAspectFit
            
            // stop activity indicator
            self.activityIndicator1.stopAnimating()
        }
        
        downloadImage(activityIndicator2, url: url2) { (image: UIImage?) in
            
            guard let newImage = image else {
                print("Error: value of image was nil")
                return
            }
            
            self.imageView2.image = newImage
            self.imageView2.contentMode = UIViewContentMode.ScaleAspectFit
            
            // stop activity indicator
            self.activityIndicator2.stopAnimating()
        }
        
        downloadImage(activityIndicator3, url: url3) { (image: UIImage?) in
            
            guard let newImage = image else {
                print("Error: value of image was nil")
                return
            }
            
            self.imageView3.image = newImage
            self.imageView3.contentMode = UIViewContentMode.ScaleAspectFit
            
            // stop activity indicator
            self.activityIndicator3.stopAnimating()
        }
        
    }
    
    func downloadImage(activityIndicator: UIActivityIndicatorView, url: NSURL?,completionHandler: (image: UIImage?) -> Void )
    {
        // start activity indicator
        activityIndicator.startAnimating()
        
        let session = NSURLSession.sharedSession()  // NOTE sharedSession is for basic requests
        
        guard let url = url else {
            print("Error with url")
            return
        }
        
        let downloadTask = session.dataTaskWithURL(url) { data, response, error in
            if data == nil {
                print("Error downloading image: \(error)")
                completionHandler(image: nil)
                
            } else {
                let image = UIImage(data: data!)
                
                // update UI on the main thread
                dispatch_async(dispatch_get_main_queue(), {
                    completionHandler(image: image)
                })
                
            }
            
        }
        downloadTask.resume()
    }
}

