//
//  RedViewController.swift
//  sansyoku
//
//  Created by tsit.st2 on 2018/02/08.
//  Copyright © 2018年 Hiroaki Ota. All rights reserved.
//

import UIKit

class RedViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
 {
    //AppDelegateのuserDefaultsを使用するために必要
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet weak var redTableView: UITableView!
    @IBOutlet weak var redTensuLabel: UILabel!
    
    let image1 = UIImage(named: "illustlist/pig_0.png")
    let image2 = UIImage(named: "illustlist/cow_0.png")
    let image3 = UIImage(named: "illustlist/chicken_0.png")
    let image4 = UIImage(named: "illustlist/egg_0.png")
    let image5 = UIImage(named: "illustlist/fish_0.png")
    let image6 = UIImage(named: "illustlist/shrimp_0.png")
    let image7 = UIImage(named: "illustlist/octopus_0.png")
    let image8 = UIImage(named: "illustlist/squid_0.png")
    
    let redLabelArray = ["豚","牛","鶏","卵","魚","海老","蛸","烏賊"]
    let redImageArray = [
        "illustlist/pig_0.png",
        "illustlist/cow_0.png",
        "illustlist/chicken_0.png",
        "illustlist/egg_0.png",
        "illustlist/fish_0.png",
        "illustlist/shrimp_0.png",
        "illustlist/octopus_0.png",
        "illustlist/squid_0.png"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibDefault:UINib = UINib(nibName: "RedCustomCell", bundle: nil)
        self.redTableView.register(nibDefault, forCellReuseIdentifier: "redCell")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // TableView に関する設定一覧
    // セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return redLabelArray.count
    }
    
    // セルに代入するデータの作成
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //xibファイルを元にデータ作成
        let cell = tableView.dequeueReusableCell(withIdentifier: "redCell") as? RedTableViewCell
        
        //各Cellにデータを入力
        // セルに値を設定
        cell?.redImage.image = UIImage(named: redImageArray[indexPath.row])
        cell?.redLabel.text = redLabelArray[indexPath.row]
        
        //画面の表示モードの指定とユーザ操作の無効化
        //cell!.redImage.contentMode = UIViewContentMode.scaleAspectFit
        //cell!.redLabel.isUserInteractionEnabled = false
        
        //セルのアクセサリタイプの指定とCell選択時にハイライトさせない指定
        //cell?.accessoryType = UITableViewCellAccessoryType.none
        //cell?.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell!
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
