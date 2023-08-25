//
//  Model.swift
//  MainProject
//
//  Created by Student08 on 22/08/23.
//

import Foundation

import Foundation
class Model : ObservableObject{
    @Published var data : [Usuario] =  []
    func fetch(){
        guard let url = URL(string:"http://192.168.128.240:1880/psycoduckget")else{
            return
        }
        let task = URLSession.shared.dataTask(with:url){[weak self]data,_,error in
            guard let data = data,error == nil else{
                return
            }
            
            do{
                let parsed = try JSONDecoder().decode([Usuario].self,from:data)
                DispatchQueue.main.async {
                    self?.data = parsed
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
    
    
    
    func update(usuario:Usuario){
        
        guard let url = URL(string: "http://192.168.128.240:1880/psycoduckput") else { return }
            
            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
            
            do {
                let data = try JSONEncoder().encode(usuario)
                
                print(usuario)
                
                request.httpBody = data
            } catch {
                print("Error encoding to JSON: \(error.localizedDescription)")
            }
        
            
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error deleting resource: \(error.localizedDescription)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    print("Error deleting resource: invalid response")
                    return
                }
                
                if httpResponse.statusCode == 200 {
                    print("Resource deleted successfully")
                } else {
                    print("Error deleting resource: status code \(httpResponse.statusCode)")
                }
            }
            
            task.resume()
        
        fetch()
        
    }

}

