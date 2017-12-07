//
//  ViewController.swift
//  MyCalc
//
//  Created by tsit.st2 on 2017/04/14.
//  Copyright © 2017年 Hiroaki Ota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var priceFiled: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender: Any?) {
        
        //次の画面を取り出す
        let viewController = segue.destination as! PriceViewController
        
        // 金額フィールドの文字列を数値に変換する
        if let price = Int(priceFiled.text!) {
            // 数値に変換した金額を次の画面に設定する
            viewController.price = price
        }
    }
    
    @IBAction func restart(_ segue: UIStoryboardSegue) {
        priceFiled.text = "0"
    }

    @IBAction func tap1Button(_ sender: UIButton) {
        let value = priceFiled.text! + "1" //数字の1を末尾に入力
        if let price = Int(value){ //0を削除
            priceFiled.text = "\(price)" //価格フィールドに数値を反映
        }
    }
    @IBAction func tap2Button(_ sender: UIButton) {
        let value = priceFiled.text! + "2" //数字の2を末尾に入力
        if let price = Int(value){             priceFiled.text = "\(price)"
        }
    }
    @IBAction func tap3Button(_ sender: UIButton) {
        let value = priceFiled.text! + "3" //数字の3を末尾に入力
        if let price = Int(value){             priceFiled.text = "\(price)"
        }
    }
    @IBAction func tap4Button(_ sender: UIButton) {
        let value = priceFiled.text! + "4" //数字の4を末尾に入力
        if let price = Int(value){             priceFiled.text = "\(price)"
        }
    }
    @IBAction func tap5Button(_ sender: UIButton) {
        let value = priceFiled.text! + "5" //数字の5を末尾に入力
        if let price = Int(value){             priceFiled.text = "\(price)"
        }
    }
    @IBAction func tap6Button(_ sender: UIButton) {
        let value = priceFiled.text! + "6" //数字の6を末尾に入力
        if let price = Int(value){             priceFiled.text = "\(price)"
        }
    }
    @IBAction func tap7Button(_ sender: UIButton) {
        let value = priceFiled.text! + "7" //数字の7を末尾に入力
        if let price = Int(value){             priceFiled.text = "\(price)"
        }
    }
    @IBAction func tap8Button(_ sender: UIButton) {
        let value = priceFiled.text! + "8" //数字の8を末尾に入力
        if let price = Int(value){             priceFiled.text = "\(price)"
        }
    }
    @IBAction func tap9Button(_ sender: UIButton) {
        let value = priceFiled.text! + "9" //数字の9を末尾に入力
        if let price = Int(value){             priceFiled.text = "\(price)"
        }
    }
    @IBAction func tap0Button(_ sender: UIButton) {
        let value = priceFiled.text! + "0" //数字の0を末尾に入力
        if let price = Int(value){             priceFiled.text = "\(price)"
        }
    }
    @IBAction func tap00Button(_ sender: UIButton) {
        let value = priceFiled.text! + "00" //数字の00を末尾に入力
        if let price = Int(value){             priceFiled.text = "\(price)"
        }
    }
    @IBAction func tapClearButton(_ sender: UIButton) {
        priceFiled.text = "0" //0を入力しクリア
    }
}

