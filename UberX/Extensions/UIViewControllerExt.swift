//
//  UIViewControllerExt.swift
//  UberX
//
//  Created by pop on 7/5/20.
//  Copyright © 2020 pop. All rights reserved.
//

import UIKit

extension UIViewController{
    func shouldPresentLoadingView(_ status:Bool){
        var fadeView:UIView?
        if status == true{
            fadeView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
            fadeView?.backgroundColor = UIColor.black
            fadeView?.alpha = 0
            fadeView?.tag = 99
            let spinner = UIActivityIndicatorView()
            spinner.color = UIColor.white
            spinner.style = .whiteLarge
            spinner.center = view.center
            view.addSubview(fadeView!)
            fadeView!.addSubview(spinner)
            spinner.startAnimating()
            fadeView?.fadeTo(alphavalue: 0.7, duration: 0.2)
            
            
        }else{
            for subview in view.subviews{
                if subview.tag == 99{
                    UIView.animate(withDuration: 0.2, animations: {
                        subview.alpha = 0.0
                    }) { (finished) in
                        subview.removeFromSuperview()
                    }
                }
            }
        }
        
    }
}
