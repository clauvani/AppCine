//
//  CDMWebTranslator.swift
//  Survey
//
//  Created by Kenyi Rodriguez on 8/04/16.
//  Copyright © 2016 Core Data Media. All rights reserved.
//

import UIKit

class CDMWebTranslator: NSObject {

    class func translateSucursalBE(diccionario objDiccionario : NSDictionary) -> SucursalBE{
        
        let objSucursal = SucursalBE()
        
        objSucursal.sucursal_id = objDiccionario["idSucursal"] as? String
        objSucursal.sucursal_nombre = objDiccionario["nombreSucursal"] as? String
        
        return objSucursal
    }
    
    
    class func translateHorarioBE(diccionario objDiccionario : NSDictionary) -> HorarioBE{
        
        let objHorario = HorarioBE()
        
        objHorario.horario_idSucursal = objDiccionario["idSucursal"] as? String
        objHorario.horario_idPelicula = objDiccionario["idPelicula"] as? String
        objHorario.horario_horario = objDiccionario["horario"] as? String
        
        return objHorario
    }
    
    
    class func translatePeliculaBE(diccionario objDiccionario : NSDictionary) -> PeliculaBE{
        
        let objPelicula = PeliculaBE()
        
        objPelicula.pelicula_id             = objDiccionario["idPelicula"] as? String
        objPelicula.pelicula_nombre         =  objDiccionario["nombreComercial"] is NSNull ? "-" : objDiccionario["nombreComercial"] as? String
        objPelicula.pelicula_resumen        = objDiccionario["resumen"] as? String
        objPelicula.pelicula_urlImagen      = objDiccionario["aficheOficial"] as? String
        
        return objPelicula
    }
    
}
