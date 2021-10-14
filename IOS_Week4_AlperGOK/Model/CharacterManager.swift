//
//  CharacterManager.swift
//  IOS_Week4_AlperGOK
//
//  Created by Alper Gok on 12.10.2021.
//
import UIKit
class CharacterManager {
    
    var character = [CharacterData]()
    func parseJSON(complete: @escaping () -> ()) {
        guard let url = URL(string: "https://api.opendota.com/api/heroStats")else{return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error == nil {
                do {
                    self.character = try JSONDecoder().decode([CharacterData].self, from: data!)
                    print(data!)
                    DispatchQueue.main.async {
                        complete()
                    }
                }catch {
                    print("error")
                }
            }
        } .resume()
    }
    
    
    
    
    
}
