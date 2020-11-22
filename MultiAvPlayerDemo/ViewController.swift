//
//  ViewController.swift
//  MultiAvPlayerDemo
//
//  Created by lisyunn on 2020/11/21.
//

import AVFoundation
import AVKit
import UIKit

class ViewController: UIViewController {
    
    var playerLayer: AVPlayerLayer!
    var playerLayer1: AVPlayerLayer!
    var playerLayer2: AVPlayerLayer!
    var playerLayer3: AVPlayerLayer!
    var playerLayer4: AVPlayerLayer!
    
    let mainVideoWidth = 16 * 16
    let mainVideoHeight = 9 * 16
    let sideVideoWidth = 16 * 12
    let sideVideoHeight = 9 * 12
    let marginX = 40
    let marginY = 40
    let borderWidth = 2
    
    var minXAngle1: CGFloat = 0.0
    var maxXAngle1: CGFloat = 0.0
    var minYAngle1: CGFloat = 0.0
    var maxYAngle1: CGFloat = 0.0
    var minXAngle2: CGFloat = 0.0
    var maxXAngle2: CGFloat = 0.0
    var minYAngle2: CGFloat = 0.0
    var maxYAngle2: CGFloat = 0.0
    var minXAngle3: CGFloat = 0.0
    var maxXAngle3: CGFloat = 0.0
    var minYAngle3: CGFloat = 0.0
    var maxYAngle3: CGFloat = 0.0
    var minXAngle4: CGFloat = 0.0
    var maxXAngle4: CGFloat = 0.0
    var minYAngle4: CGFloat = 0.0
    var maxYAngle4: CGFloat = 0.0
    
    let selectView1 = UIView()
    let selectView2 = UIView()
    let selectView3 = UIView()
    let selectView4 = UIView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // 動画ファイルのURLを取得
        let url = URL(string:"https://bitmovin-a.akamaihd.net/content/art-of-motion_drm/m3u8s/11331.m3u8")
        
        print("width : \(self.view.bounds.size.width)")
        print("height : \(self.view.bounds.size.height)")
        
        /// プレイヤーを用意
        let player = AVPlayer(url: url!)

        /// 各レイヤーにプレイヤーを関連付ける
        /// 全てプレイヤー
        playerLayer = AVPlayerLayer(player: player)
        playerLayer1 = AVPlayerLayer(player: player)
        playerLayer2 = AVPlayerLayer(player: player)
        playerLayer3 = AVPlayerLayer(player: player)
        playerLayer4 = AVPlayerLayer(player: player)
        
        let screenWidth = self.view.bounds.size.width;
        let screenHeight = self.view.bounds.size.height;

        /// 各レイヤーの位置・サイズをつけ貼り付け
        playerLayer.frame = CGRect(x: Int(screenWidth / 2) - mainVideoWidth / 2, y: Int(screenHeight / 2 ) - mainVideoHeight / 2, width: mainVideoWidth, height: mainVideoHeight)
        
        playerLayer1.frame = CGRect(x:marginX, y:marginY, width:sideVideoWidth, height:sideVideoHeight)
        selectView1.frame = CGRect(x:marginX -  borderWidth , y:marginY - borderWidth, width:sideVideoWidth + borderWidth  * 2, height:sideVideoHeight + borderWidth * 2)
        selectView1.layer.borderColor = UIColor.red.cgColor
        selectView1.layer.borderWidth = CGFloat(borderWidth)
        self.view.addSubview(selectView1)
        selectView1.isHidden = true
         minXAngle1 = playerLayer1.position.x - CGFloat(sideVideoWidth / 2);
         maxXAngle1 = playerLayer1.position.x + CGFloat(sideVideoWidth / 2);
         minYAngle1 = playerLayer1.position.y - CGFloat(sideVideoHeight / 2);
         maxYAngle1 = playerLayer1.position.y + CGFloat(sideVideoHeight / 2);
        
        playerLayer2.frame = CGRect(x:marginX, y:Int(screenHeight) - sideVideoHeight - marginY, width:sideVideoWidth, height:sideVideoHeight)
        selectView2.frame = CGRect(x:marginX - borderWidth, y:Int(screenHeight) - sideVideoHeight - marginY - borderWidth, width:sideVideoWidth + borderWidth * 2, height:sideVideoHeight + borderWidth * 2)
        selectView2.layer.borderColor = UIColor.red.cgColor
        selectView2.layer.borderWidth = CGFloat(borderWidth)
        self.view.addSubview(selectView2)
        selectView2.isHidden = true
         minXAngle2 = playerLayer2.position.x - CGFloat(sideVideoWidth / 2);
         maxXAngle2 = playerLayer2.position.x + CGFloat(sideVideoWidth / 2);
         minYAngle2 = playerLayer2.position.y - CGFloat(sideVideoHeight / 2);
         maxYAngle2 = playerLayer2.position.y + CGFloat(sideVideoHeight / 2);
        
        playerLayer3.frame = CGRect(x:Int(screenWidth) - sideVideoWidth - marginX, y:marginY, width:sideVideoWidth, height:sideVideoHeight)
        selectView3.frame = CGRect(x:Int(screenWidth) - sideVideoWidth - marginX - borderWidth, y:marginY - borderWidth, width:sideVideoWidth + borderWidth * 2, height:sideVideoHeight + borderWidth * 2)
        selectView3.layer.borderColor = UIColor.red.cgColor
        selectView3.layer.borderWidth = CGFloat(borderWidth)
        self.view.addSubview(selectView3)
        selectView3.isHidden = true
         minXAngle3 = playerLayer3.position.x - CGFloat(sideVideoWidth / 2);
         maxXAngle3 = playerLayer3.position.x + CGFloat(sideVideoWidth / 2);
         minYAngle3 = playerLayer3.position.y - CGFloat(sideVideoHeight / 2);
         maxYAngle3 = playerLayer3.position.y + CGFloat(sideVideoHeight / 2);
        
        playerLayer4.frame = CGRect(x:Int(screenWidth) - sideVideoWidth - marginX, y:Int(screenHeight) - sideVideoHeight - marginY, width:sideVideoWidth, height:sideVideoHeight)
        selectView4.frame = CGRect(x:Int(screenWidth) - sideVideoWidth - marginX - borderWidth, y:Int(screenHeight) - sideVideoHeight - marginY - borderWidth, width:sideVideoWidth + borderWidth * 2, height:sideVideoHeight + borderWidth * 2)
        selectView4.layer.borderColor = UIColor.red.cgColor
        selectView4.layer.borderWidth = CGFloat(borderWidth)
        self.view.addSubview(selectView4)
        selectView4.isHidden = true
         minXAngle4 = playerLayer4.position.x - CGFloat(sideVideoWidth / 2);
         maxXAngle4 = playerLayer4.position.x + CGFloat(sideVideoWidth / 2);
         minYAngle4 = playerLayer4.position.y - CGFloat(sideVideoHeight / 2);
         maxYAngle4 = playerLayer4.position.y + CGFloat(sideVideoHeight / 2);
        
        
        playerLayer1.setSideAngle(1, marginX, marginY, screenWidth, screenHeight, videoWidth: sideVideoWidth, videoHeight: sideVideoHeight)
        
        playerLayer2.setSideAngle(2, marginX, marginY, screenWidth, screenHeight, videoWidth: sideVideoWidth, videoHeight: sideVideoHeight)
        playerLayer3.setSideAngle(3, marginX, marginY, screenWidth, screenHeight, videoWidth: sideVideoWidth, videoHeight: sideVideoHeight)
        playerLayer4.setSideAngle(4, marginX, marginY, screenWidth, screenHeight, videoWidth: sideVideoWidth, videoHeight: sideVideoHeight)
        
        self.view.layer.addSublayer(playerLayer)
        self.view.layer.addSublayer(playerLayer1)
        self.view.layer.addSublayer(playerLayer2)
        self.view.layer.addSublayer(playerLayer3)
        self.view.layer.addSublayer(playerLayer4)

        player.play()
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
       //最初の画面呼び出しで画面を右横画面に変更させる。
       UIDevice.current.setValue(3, forKey: "orientation")
       return .landscapeRight
    }

     // 画面を自動で回転させるかを決定する。
     override var shouldAutorotate: Bool {
        //画面が縦だった場合は回転させない
       if(UIDevice.current.orientation.rawValue == 1){
            return false
      }
        else{
            return true
      }
    }
    
    //タッチをした時
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let screenWidth = self.view.bounds.size.width;
        let screenHeight = self.view.bounds.size.height;

        selectView1.isHidden = true
        selectView2.isHidden = true
        selectView3.isHidden = true
        selectView4.isHidden = true
        
        //タッチを取得
        let point = touches.first?.location(in: self.view)
        

        if(point!.x > minXAngle1 && point!.x < maxXAngle1 && point!.y > minYAngle1 && point!.y < maxYAngle1) {
            playerLayer.setMainAngle(1, screenWidth, screenHeight, videoWidth: mainVideoWidth, videoHeight: mainVideoHeight)
            selectView1.isHidden = false
            return
            
        }

        if(point!.x > minXAngle2 && point!.x < maxXAngle2 && point!.y > minYAngle2 && point!.y < maxYAngle2) {
            playerLayer.setMainAngle(2, screenWidth, screenHeight, videoWidth: mainVideoWidth, videoHeight: mainVideoHeight)
            selectView2.isHidden = false
            return
        }

        if(point!.x > minXAngle3 && point!.x < maxXAngle3 && point!.y > minYAngle3 && point!.y < maxYAngle3) {
            playerLayer.setMainAngle(3, screenWidth, screenHeight, videoWidth: mainVideoWidth, videoHeight: mainVideoHeight)
            selectView3.isHidden = false
            return
        }

        if(point!.x > minXAngle4 && point!.x < maxXAngle4 && point!.y > minYAngle4 && point!.y < maxYAngle4) {
            playerLayer.setMainAngle(4, screenWidth, screenHeight, videoWidth: mainVideoWidth, videoHeight: mainVideoHeight)
            selectView4.isHidden = false
            return
        }
        
        playerLayer.setMainAngle(0, screenWidth, screenHeight, videoWidth: mainVideoWidth, videoHeight: mainVideoHeight)
    }
    
}

extension AVPlayerLayer {
    
    func setMainAngle(_ angleId: Int, _ screenWidth: CGFloat, _ screenHeight: CGFloat, videoWidth: Int, videoHeight: Int) {
        print("touched angle \(angleId)")
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        // change layer properties that you don't want to animate
        switch angleId {
        case 0:
            self.frame = CGRect(x:Int(screenWidth / 2) - videoWidth / 2, y:Int(screenHeight / 2 ) - videoHeight / 2, width:videoWidth, height:videoHeight)
            let playerLayerRect = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height)
            // Cuts rectangle inside layer,
            self.mask(withRect: playerLayerRect)
        case 1:
            self.frame = CGRect(x:Int(screenWidth / 2) - videoWidth / 2, y:Int(screenHeight / 2 ) - videoHeight / 2, width:videoWidth * 2, height:videoHeight * 2)
            let playerLayerRect = CGRect(x: 0, y: 0, width: self.bounds.size.width / 2 , height: self.bounds.size.height / 2)
            // Cuts rectangle inside layer,
            self.mask(withRect: playerLayerRect)
        case 2:
            self.frame = CGRect(x:Int(screenWidth / 2) - videoWidth / 2, y:Int(screenHeight / 2 ) - 3 * videoHeight / 2, width:videoWidth * 2, height:videoHeight * 2)
            let playerLayerRect = CGRect(x: 0, y: self.bounds.size.height / 2, width: self.bounds.size.width / 2 , height: self.bounds.size.height / 2)
            // Cuts rectangle inside layer,
            self.mask(withRect: playerLayerRect)
        case 3:
            self.frame = CGRect(x:Int(screenWidth / 2) - 3 * videoWidth / 2, y:Int(screenHeight / 2 ) - videoHeight / 2, width:videoWidth * 2, height:videoHeight * 2)
            let playerLayerRect = CGRect(x: self.bounds.size.width / 2, y: 0, width: self.bounds.size.width / 2 , height: self.bounds.size.height / 2)
            // Cuts rectangle inside layer,
            self.mask(withRect: playerLayerRect)
        case 4:
            self.frame = CGRect(x:Int(screenWidth / 2) - 3 * videoWidth / 2, y:Int(screenHeight / 2 ) - 3 * videoHeight / 2, width:videoWidth * 2, height:videoHeight * 2)
           let playerLayerRect = CGRect(x: self.bounds.size.width / 2, y: self.bounds.size.height / 2, width: self.bounds.size.width / 2 , height: self.bounds.size.height / 2)
            // Cuts rectangle inside layer,
            self.mask(withRect: playerLayerRect)
        default: break
        }
        CATransaction.commit()
    }
    
    func setSideAngle(_ angleId: Int, _ marginX: Int, _ marginY: Int, _ screenWidth: CGFloat, _ screenHeight: CGFloat, videoWidth: Int, videoHeight: Int) {
        switch angleId {
        case 1:
            self.frame = CGRect(x:marginX, y:marginY, width:videoWidth * 2, height:videoHeight * 2)
            let playerLayerRect = CGRect(x: 0, y: 0, width: self.bounds.size.width / 2 , height: self.bounds.size.height / 2)
            // Cuts rectangle inside layer,
            self.mask(withRect: playerLayerRect)
        case 2:
            self.frame = CGRect(x:marginX, y:Int(screenHeight) - videoHeight * 2 - marginY, width:videoWidth * 2, height:videoHeight * 2)
            let playerLayerRect = CGRect(x: 0, y: self.bounds.size.height / 2, width: self.bounds.size.width / 2 , height: self.bounds.size.height / 2)
            // Cuts rectangle inside layer,
            self.mask(withRect: playerLayerRect)
        case 3:
            self.frame = CGRect(x:Int(screenWidth) - videoWidth * 2 - marginX, y:marginY, width:videoWidth * 2, height:videoHeight * 2)
            let playerLayerRect = CGRect(x: self.bounds.size.width / 2, y: 0, width: self.bounds.size.width / 2 , height: self.bounds.size.height / 2)
            // Cuts rectangle inside layer,
            self.mask(withRect: playerLayerRect)
        case 4:
            self.frame = CGRect(x:Int(screenWidth) - videoWidth * 2 - marginX, y:Int(screenHeight) - videoHeight * 2 - marginY, width:videoWidth * 2, height:videoHeight * 2)
           let playerLayerRect = CGRect(x: self.bounds.size.width / 2, y: self.bounds.size.height / 2, width: self.bounds.size.width / 2 , height: self.bounds.size.height / 2)
            // Cuts rectangle inside layer,
            self.mask(withRect: playerLayerRect)
        default: break
        }
    }
    
    func mask(withRect rect: CGRect) {
        let path = UIBezierPath(rect: rect)
        let maskLayer = CAShapeLayer()

        maskLayer.path = path.cgPath
        self.mask = maskLayer
        //self.transform = CATransform3DMakeScale(2, 2, 1);
    }
    
}

