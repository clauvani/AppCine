//
//  PeliculaBC.swift
//  AppCine
//
//  Created by B303-24 on 31/10/16.
//  Copyright © 2016 B303-24. All rights reserved.
//

import UIKit

class PeliculaBC: NSObject
{
    class func listarPeliculas(conCompletion completion : @escaping(_ arrayPeliculas : NSMutableArray) -> Void) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let arrayPeliculas = NSMutableArray(array: PeliculaDALC.listarTodasLasPeliculas(conContexto: appDelegate.persistentContainer.viewContext))
        completion(arrayPeliculas.count == 0 ? NSMutableArray() : arrayPeliculas)
    }
}
