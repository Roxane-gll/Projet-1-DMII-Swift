//
//  Chapter.swift
//  RVR_Brain
//
//  Created by RG on 10/01/2024.
//

import Foundation

struct Chapter : Equatable, Identifiable {
    static func == (lhs: Chapter, rhs: Chapter) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id:Int
    var titleC:String
    var textL:[TextChapter]
    var visualIntraction:[String]
    var audioInteraction:[String:String]
    var image:String
}

struct TextChapter: Identifiable, Hashable {
    var id=UUID().uuidString
    
    var typeC:String
    var txt:String
    var dialog:[String: String]
    var citation:[String:String]
}

var tC11 = TextChapter(typeC: "text", txt: "Devant elle s'étendait une vaste jungle tropicale, où des arbres majestueux s'élevaient vers le ciel, leurs feuilles créant une canopée vivante au-dessus. Des lianes pendantes dansaient doucement, tandis que des perroquets aux plumes éclatantes survolaient le paysage luxuriant. ", dialog: [:], citation: [:])

var tC12 = TextChapter(typeC: "dialog", txt:"", dialog: ["Perroquets": "Bonjour petite fille, comment t’appelles-tu ? ", "Rebecca": "Je m’appelle Rebecca. "], citation: [:])
var tC122 = TextChapter(typeC: "dialog", txt: "", dialog: ["Perroquets": "C’est rare d’avoir de la visite par ici !", "Rebecca": "C’est dommage tout est si beau et coloré !"], citation: [:])

var tC13 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["audio": "Jouez de vos instruments pour faire ressentir l’émerveillement de Rebecca. "])

var tC1T2 = TextChapter(typeC: "text", txt: "Les plantes extraordinaires, aux couleurs vives et aux formes étonnantes, semblaient s'animer dans une danse enchanteresse. Des papillons aux ailes chatoyantes, telles des étoiles, voletaient autour de fleurs exotiques.", dialog: [:], citation: [:])

var tC1C2 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["visual": "Utilisez vos outils pour faire apparaître le nuage de bonheur."])

var tC1T3 = TextChapter(typeC: "text", txt: "Rebecca, émerveillée par cet jungle luxuriante infini, décida de suivre les petites empreintes lumineuses, tracées par des créatures invisibles.", dialog: [:], citation: [:])

var chaper1 = Chapter(id: 1, titleC: "La jungle", textL: [tC11,tC12, tC122, tC13, tC1T2,tC1C2,tC1T3], visualIntraction: ["tapSphero", "turnSphero", "button1", "button2", "rotocoder"], audioInteraction: ["tapSphero": "jungle-tapSphero", "turnSphero": "jungle-turnSphero", "button1": "jungle-button1", "button2": "jungle-button2", "rotocoder": "jungle-rotocoder"], image: "jungle")


var tC21 = TextChapter(typeC: "text", txt: "À chaque mouvement, Rebecca découvrait des créatures extraordinaires : des poissons serpentant silencieusement à travers les algues, des coraux aux formes fantaisistes qui ondulaient sous le courant marin. ", dialog: [:], citation: [:])

var tC22 = TextChapter(typeC: "dialog", txt:"", dialog: ["Poissons": "Viens nager avec nous à travers les algues !"], citation: [:])

var tC2T2 = TextChapter(typeC: "text", txt: "Rebecca se mit à se faufiler à travers les algues chatouilleuse. Cependant, alors que Rebecca s'amusait à explorer cet univers sous-marin, elle remarqua soudain des éclats lumineux dans les profondeurs, comme des petits yeux qui la suivait.", dialog: [:], citation: [:])

var tC222 = TextChapter(typeC: "dialog", txt: "", dialog: ["Rebecca": "Qu’est-ce que c’est, c’est étonnant ces petites lumières… "], citation: [:])

var tC2T3 = TextChapter(typeC: "text", txt: "Puis, quelques instants plus tard, elle se retrouva entourée d’une bande de requin terrifiants dans l'obscurité des fonds marins.", dialog: [:], citation: [:])

var tC23 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["audio": "Jouez les instruments pour faire ressentir la peur de Rebecca."])

var tC2T4 = TextChapter(typeC: "text", txt: "Prise de panique face à leurs mâchoires pleines de dents, elle décida de nager rapidement vers un abri sous-marin qu'elle distingua à proximité.", dialog: [:], citation: [:])

var tC2C2 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["visual": "Utilisez vos outils pour faire apparaître la peur."])

var tC2T5 = TextChapter(typeC: "text", txt: "Rebecca était tétanisée de peur, quand tout à coup elle entendit des petites voix :", dialog: [:], citation: [:])

var tC2D3 = TextChapter(typeC: "dialog", txt: "", dialog: ["Requin": "Nous sommes gentils, je sais que notre apparence peut-être trompeuse, mais nous ne te voulons pas de mal ! "], citation: [:])

var tC2T6 = TextChapter(typeC: "text", txt: "Rebecca pris son courage à deux mains et retrouva la bande de requin, elle réalisa que malgré leurs apparences étrange ils étaient très drôle. Rebecca était fière d’elle, elle avait réussit à surmonter sa peur avait gagné de nouveaux amis. ", dialog: [:], citation: [:])

var tC2T7 = TextChapter(typeC: "text", txt: "Rebecca décida de poursuivre en s’aventurant dans une grotte sous marine. La grotte sombre au début, révéla peu à peu une lueur douce provenant du fond. Intriguée et curieuse, Rebecca se dirigea prudemment vers cette lumière. ", dialog: [:], citation: [:])

var chaper2 = Chapter(id: 2, titleC: "Aquatique", textL: [tC21,tC22, tC2T2, tC222, tC2T3, tC23, tC2T4, tC2C2, tC2T5, tC2D3,tC2T6, tC2T7], visualIntraction: ["turnSphero", "button1", "button2", "rotocoder"], audioInteraction: ["tapSphero": "aqua-tapSphero", "turnSphero": "aqua-turnSphero", "button1": "aqua-button1", "button2": "aqua-button2", "rotocoder": "aqua-rotocoder"], image: "aqua")
