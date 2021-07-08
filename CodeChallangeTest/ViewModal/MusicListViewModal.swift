//
//  MusicListViewModal.swift
//  CodeChallangeTest
//
//  Created by Vibhash Kumar on 08/07/21.
//

import Foundation


struct MusicListViewModal
{
   
    func getMusicList(completionHandler :@escaping(_ result : [MusicListDataModel]?)-> Void ){
        
           
        let musicResource = MusicListResource()
        musicResource.getMusicList { (getMusicListApiResponse) in
            if ((getMusicListApiResponse?.results ?? []).count>0){
                DispatchQueue.main.async{
                _ = completionHandler(getMusicListApiResponse?.results)
                }
            }
           
        }
        
    }
    
    
}
