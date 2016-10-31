//
//  CDMWebModel.swift
//  Survey
//
//  Created by Kenyi Rodriguez on 8/04/16.
//  Copyright © 2016 Core Data Media. All rights reserved.
//

import UIKit


class CDMWebModel: NSObject
{
    static let CDMWebModelURLBase : NSString = "http://kenyirodriguez.com/kenyirodriguez.com/descargas"
    
    typealias ArrayInformacion = (_ arrayPeliculas : NSArray, _ arraySucursales : NSArray, _ arraHorarios : NSArray) -> Void
    
    class func leerHorarios(deArrayHorarios arrayHorarios : NSArray) -> NSArray
    {
        let arrayFinalHorarios = NSMutableArray()
        
        arrayHorarios.enumerateObjects({ (obj, idx, stop) in
            arrayFinalHorarios.add(CDMWebTranslator.translateHorarioBE(diccionario: obj as! NSDictionary))
        })
        
        return arrayFinalHorarios
    }
    
    
    class func leerSucursales(deArraySucusales arraySucursales : NSArray) -> NSArray
    {
        let arrayFinalSucursales = NSMutableArray()
        
        arraySucursales.enumerateObjects({ (obj, idx, stop) in
            arrayFinalSucursales.add(CDMWebTranslator.translateSucursalBE(diccionario: obj as! NSDictionary))
        })
        
        return arrayFinalSucursales
    }
    
    class func leerPeliculas(deArrayPeliculas arrayPeliculas : NSArray) -> NSArray
    {
        let arrayFinalPeliculas = NSMutableArray()
        
        arrayPeliculas.enumerateObjects({ (obj, idx, stop) in
            arrayFinalPeliculas.add(CDMWebTranslator.translatePeliculaBE(diccionario: obj as! NSDictionary))
        })
        
        return arrayFinalPeliculas
    }
    
    class func obtenerInformacion(conCompletion completion : @escaping ArrayInformacion)
    {
        CDMWebSender.doGETToURL(conURL: self.CDMWebModelURLBase, conPath: "peliculas.json", conParametros: nil) { (objRespuesta) in
            
            let respuestaDiccionario = objRespuesta.respuestaJSON as! NSDictionary
            let arrayPeliculasRespuesta = respuestaDiccionario["peliculas"] as! NSArray
            let arraySucursalRespuesta = respuestaDiccionario["sucursales"] as! NSArray
            let arrayHorariosRespuesta = respuestaDiccionario["cartelera"] as! NSArray
            
            let arrayPeliculasRespuestaBE = self.leerPeliculas(deArrayPeliculas: arrayPeliculasRespuesta)
            let arraySucursalesRespuestaBE = self.leerSucursales(deArraySucusales: arraySucursalRespuesta)
            let arrayHorariosRespuestaBE = self.leerHorarios(deArrayHorarios: arrayHorariosRespuesta)
            
            completion(arrayPeliculasRespuestaBE, arraySucursalesRespuestaBE, arrayHorariosRespuestaBE)
        }
    }
}
