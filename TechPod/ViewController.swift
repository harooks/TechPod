//
//  ViewController.swift
//  TechPod
//
//  Created by Haruko Okada on 9/4/20.
//  Copyright © 2020 Haruko Okada. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //Storyboardで扱うtableviewの宣言
    @IBOutlet weak var table: UITableView!
    
    var songNameArray: [String] = []
    var fileNameArray: [String] = []
    var imageNameArray: [String] = []
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
         super.viewDidLoad()
         
        table.dataSource = self  //テーブルビューのデータソースメソッドは view controllerのクラスの中にかく
        table.delegate = self //テーブルビューのデリゲートメッそ度はview controllerのクラスの中にかく
        
        songNameArray = ["カノン", "エリーゼのために", "G線上のアリア"]
        fileNameArray = ["cannon", "elise", "aria"]
        imageNameArray = ["Beethoven.jpg", "Pachelbel.jpg", "Bach.jpg"]
                
     }

    //セルの数の設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songNameArray.count
    }
    
    //ID付きのセルの取得して、同じIDのセルに"テスト"と表記する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = songNameArray[indexPath.row]
        
        cell?.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        return cell!
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(songNameArray[indexPath.row]) が選ばれました")
        
        //音楽ファイルの設定
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "mp3")!)
        
        //再生の準備
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        
        //Play music
        audioPlayer.play()
    }
 

}

