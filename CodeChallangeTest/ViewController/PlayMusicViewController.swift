//
//  PlayMusicViewController.swift
//  CodeChallangeTest
//
//  Created by Vibhash Kumar on 08/07/21.
//

import UIKit
import AVKit


class PlayMusicViewController: UIViewController {
    @IBOutlet weak var trackImageView: UIImageView!
    
    @IBOutlet weak var artistNameLbl: UILabel!
    
    @IBOutlet weak var songNameLbl: UILabel!
    
    
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var playBtn: UIButton!
    
    var musicData : MusicListDataModel?
    
    var timer: Timer?
    var audioPlayer : AVPlayer!
    
     
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        playBtn.tag = 1
        stopBtn.tag = 2
        
        songNameLbl.text = musicData?.trackName
        artistNameLbl.text = musicData?.artistName
        playBtn.addTarget(self, action: #selector(playBtnAction), for: .touchUpInside)
        stopBtn.addTarget(self, action: #selector(stopBtnAction), for: .touchUpInside)
      
        // Do any additional setup after loading the view.
    }
    

    override func viewWillDisappear(_ animated: Bool) {
    
        if audioPlayer != nil {
            audioPlayer.pause()
            audioPlayer = nil
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func playBtnAction(_sender:UIButton){
        self.playAudioFromURL()
    }
    @objc func stopBtnAction(_sender:UIButton){
        if audioPlayer != nil {
            audioPlayer.pause()
            audioPlayer = nil
        }
    }
    
    
    
    
    private func playAudioFromURL() {
        guard let url = URL(string: musicData?.previewUrl ?? "") else {
                print("error to get the mp3 file")
                return
            }
            do {
                audioPlayer =  AVPlayer(url: url)
            }
            audioPlayer?.play()
        }

}
