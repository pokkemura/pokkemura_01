//
//  PageViewController.swift
//  sansyoku
//
//  Created by tsit.st2 on 2017/10/31.
//  Copyright © 2017年 Hiroaki Ota. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers([getFirst()], direction: .Forward, animated: true, completion: nil)
        // Do any additional setup after loading the view.
    }
    
    func getFirst() -> FirstViewController {
        return storyboard!.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
