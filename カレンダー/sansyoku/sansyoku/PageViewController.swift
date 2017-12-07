//
//  PageViewController.swift
//  sansyoku
//
//  Created by tsit.st2 on 2017/10/31.
//  Copyright © 2017年 Hiroaki Ota. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers([getFirst()], direction: .forward, animated: true, completion: nil)
        self.dataSource = self
        
    }
    
    func getFirst() -> FirstViewController {
        return storyboard!.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
    }
    func getSecond() -> SecondViewController {
        return storyboard!.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
    }
    func getThird() -> ThirdViewController{
        return storyboard!.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
    }
}

extension PageViewController : UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: ThirdViewController.self) {
            // 3 -> 2
            return getSecond()
        } else if viewController.isKind(of: SecondViewController.self) {
            // 2 -> 1
            return getFirst()
        }else{
            // 1 -> end of the road
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: FirstViewController.self) {
            // 1 -> 2
            return getSecond()
        } else if viewController.isKind(of: SecondViewController.self) {
            // 2 -> 3
            return getThird()
        }else{
            // 3 -> end of the road
            return nil
        }
    }
}
