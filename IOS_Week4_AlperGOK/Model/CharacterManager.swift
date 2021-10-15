//
//  CharacterManager.swift
//  IOS_Week4_AlperGOK
//
//  Created by Alper Gok on 12.10.2021.
//
import UIKit
class CharacterManager {
    
    //It should match with the API struct
    var character = [CharacterData]()
    
    //Basic networking operation 1.Create an URL , 2.Create a Session and give that Session a task, 3.Start the task
    func parseJSON(complete: @escaping () -> ()) {
        guard let url = URL(string: "https://api.opendota.com/api/heroStats")else{return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error == nil {
                do {
                    self.character = try JSONDecoder().decode([CharacterData].self, from: data!)
                    print(data!)
                    
                    //Closure works in background , we should change UI in the Main -> foreground
                    DispatchQueue.main.async {
                        complete()
                    }
                }catch {
                    print("error")
                }
            }
        } .resume() //Newly Initialized Tasks begins in suspended state, so we need to resume() it to start.
    }
    
    
    
    
    
}
