
// Desert
var tDesertStart = TextChapter(typeC: "text", txt: "Devant elle s’étendait un immense désert, où des dunes se perdaient à l'infini, des palmiers immenses se dressaient comme des phares dans le paysage chaud. Leurs grandes feuilles créaient une danse, tandis que des petits animaux, comme des scarabées aux carapaces scintillantes, s'approchèrent avec curiosité.", dialog: [:], citation: [:])

var D1Desert = TextChapter(typeC: "dialog", txt: "", dialog: ["Scarabées": "Bonjour petite fille, comment t’appelles-tu ?"], citation: [:])

var D2Desert = TextChapter(typeC: "dialog", txt: "", dialog: ["Rebecca": "Je m’appelle Rebecca."], citation: [:])

var D3Desert = TextChapter(typeC: "dialog", txt: "", dialog: ["Scarabées": "C’est rare d’avoir de la visite par ici !"], citation: [:])

var D4Desert = TextChapter(typeC: "dialog", txt: "", dialog: ["Rebecca": "C’est dommage tout est si beau et immense !"], citation: [:])

var C1Desert = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["audio": "Jouez de vos instruments pour faire ressentir l’émerveillement de Rebecca."])

var tDesertMiddle = TextChapter(typeC: "text", txt: "La source d’eau scintillante, reflétait le ciel d'un bleu profond comme un miroir enchanté, et le doux murmure de l'eau était une mélodie rafraîchissante au milieu de cet océan de sable brûlant.", dialog: [:], citation: [:])

var C2Desert = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["visual": "Utilisez vos outils pour faire apparaître les scintillements de bonheur."])

var tDesertEnd = TextChapter(typeC: "text", txt: "Rebecca, émerveillée par ce désert immense, décida de suivre les petites empreintes lumineuses sur le sol, tracées par des créatures invisibles.", dialog: [:], citation: [:])

var chapterDesert = Chapter(id: 2, titleC: "Le désert", textL: [tDesertStart, D1Desert, D2Desert, D3Desert, D4Desert, C1Desert, tDesertMiddle, C2Desert, tDesertEnd], visualIntraction: ["tapSphero","turnSphero", "button1", "button2", "rotocoder", "micro"], audioInteraction: ["tapSphero": "e-tapSphero", "turnSphero": "e-turnSphero", "button1": "e-button1", "button2": "e-button2", "rotocoder": "e-levier", "micro": "e-micro"], image: "desert-E",backgroundMusic: "desert-e")


// Aquatique
var tAquaE1 = TextChapter(typeC: "text", txt: "Devant elle s'étendait un vaste océan, où des vagues se perdaient à l'infini. Les coraux colorés ondulants créaient une danse aquatique, tandis que de petits poissons, aux écailles scintillantes comme des étoiles, s'approchèrent avec curiosité.", dialog: [:], citation: [:])

var dAE1 = TextChapter(typeC: "dialog", txt: "", dialog: ["Poissons": "Bonjour petite fille, comment t’appelles-tu ?"], citation: [:])

var dAE2 = TextChapter(typeC: "dialog", txt: "", dialog: ["Rebecca": "Je m’appelle Rebecca."], citation: [:])

var dAE3 = TextChapter(typeC: "dialog", txt: "", dialog: ["Poissons": "C’est rare d’avoir de la visite par ici !"], citation: [:])

var dAE4 = TextChapter(typeC: "dialog", txt: "", dialog: ["Rebecca": "C’est dommage tout est si beau et coloré !"], citation: [:])

var cAE1 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["audio": "Jouez de vos instruments pour faire ressentir l’émerveillement de Rebecca."])

var tAE2 = TextChapter(typeC: "text", txt: "Les rayons du soleil filtraient à travers les profondeurs, créant des jeux de lumière semblables à un miroir enchanté, et le doux murmure des courants sous-marins formait une mélodie apaisante au milieu de cet océan.", dialog: [:], citation: [:])

var cAE2 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["visual": "Utilisez vos outils pour faire apparaître les scintillements de bonheur."])

var tAE3 = TextChapter(typeC: "text", txt: "Rebecca, émerveillée par cet océan infini, décida de suivre les petites empreintes lumineuses sur le sol marin, tracées par des créatures invisibles.", dialog: [:], citation: [:])

var chapterAquaE = Chapter(id: 6, titleC: "La beauté Aqua", textL: [tAquaE1, dAE1, dAE2, dAE3, dAE4, cAE1, tAE2, cAE2, tAE3], visualIntraction: ["tapSphero","turnSphero", "button1", "button2", "rotocoder", "micro"], audioInteraction: ["tapSphero": "e-tapSphero", "turnSphero": "e-turnSphero", "button1": "e-button1", "button2": "e-button2", "rotocoder": "e-lever", "micro": "e-micro"], image: "aqua-e",backgroundMusic: "aqua-t") // music de fond

// Banquise
var tBE1 = TextChapter(typeC: "text", txt: "Devant elle s'étendait un ciel rempli de petites étoiles qui scintillaient comme des paillettes magiques. Des icebergs en forme de tours se dressaient, effectuant une danse joyeuse en tournant lentement. De petits phoques avec des fourrures brillantes, comme des étoiles, s'approchèrent pour observer ce qui se passait.", dialog: [:], citation: [:])

var dBE1 = TextChapter(typeC: "dialog", txt: "", dialog: ["Phoques": "Bonjour petite fille, comment t’appelles-tu ?"], citation: [:])

var dBE2 = TextChapter(typeC: "dialog", txt: "", dialog: ["Rebecca": "Je m’appelle Rebecca."], citation: [:])

var dBE3 = TextChapter(typeC: "dialog", txt: "", dialog: ["Phoques": "C’est rare d’avoir de la visite par ici !"], citation: [:])

var dBE4 = TextChapter(typeC: "dialog", txt: "", dialog: ["Rebecca": "C’est dommage tout est si beau et gigantesque !"], citation: [:])

var cBE1 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["audio": "Jouez de vos instruments pour faire ressentir l’émerveillement de Rebecca."])

var tBE2 = TextChapter(typeC: "text", txt: "La lune projeta des rayons spéciaux, créant des lumières magiques comme dans un conte de fées, tandis qu'une douce mélodie glaciale résonnait dans l'air.", dialog: [:], citation: [:])

var cBE2 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["visual": "Utilisez vos outils pour faire apparaître les scintillements."])

var tBE3 = TextChapter(typeC: "text", txt: "Rebecca, émerveillée par cette étendue infinie, décida de suivre les petites empreintes lumineuses, tracées par des créatures invisibles.", dialog: [:], citation: [:])

var chapterBanquiseE = Chapter(id: 8, titleC: "La banquise", textL: [tBE1, dBE1, dBE2, dBE3, dBE4, cBE1, tBE2, cBE2, tBE3], visualIntraction: ["tapSphero","turnSphero", "button1", "button2", "rotocoder", "micro"], audioInteraction: ["tapSphero": "e-tapSphero", "turnSphero": "e-turnSphero", "button1": "e-button1", "button2": "e-button2", "rotocoder": "e-lever", "micro": "e-micro"], image: "banquise-e",backgroundMusic: "banquise-e") // background Music


// Foret
var tFE1 = TextChapter(typeC: "text", txt: "Devant elle s'étendait un paysage éblouissant, où des arbres magiques s'étiraient vers le ciel, leurs feuilles scintillantes créant une danse de couleurs. Des petits animaux curieux, tels que des lapins aux yeux brillants et des oiseaux aux plumes chatouilleuses, s'approchèrent avec des sourires.", dialog: [:], citation: [:])

var dFE1 = TextChapter(typeC: "dialog", txt: "", dialog: ["Lapin": "Bonjour petite fille, comment t’appelles-tu ?"], citation: [:])

var dFE2 = TextChapter(typeC: "dialog", txt: "", dialog: ["Rebecca": "Je m’appelle Rebecca."], citation: [:])

var dFE3 = TextChapter(typeC: "dialog", txt: "", dialog: ["Lapin": "C’est rare d’avoir de la visite par ici !"], citation: [:])

var dFE4 = TextChapter(typeC: "dialog", txt: "", dialog: ["Rebecca": "C’est dommage tout est si beau et coloré !"], citation: [:])

var cFE1 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["audio": "Jouez de vos instruments pour faire ressentir l’émerveillement de Rebecca."])

var tFE2 = TextChapter(typeC: "text", txt: "Les rivières scintillantes reflétaient le ciel comme un miroir enchanté, et le doux murmure de l'eau était une belle mélodie.", dialog: [:], citation: [:])

var cFE2 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["visual": "Utilisez vos outils pour faire apparaître les scintillements de bonheur."])

var tFE3 = TextChapter(typeC: "text", txt: "Rebecca, émerveillée par ce monde magique, décida de suivre les petites empreintes lumineuses sur le sol, tracées par des créatures invisibles.", dialog: [:], citation: [:])

var chapterForetE = Chapter(id: 13, titleC: "La banquise", textL: [tFE1, dFE1, dFE2, dFE3, dFE4, cFE1, tFE2, cFE2, tFE3], visualIntraction: ["tapSphero","turnSphero", "button1", "button2", "rotocoder", "micro"], audioInteraction: ["tapSphero": "e-tapSphero", "turnSphero": "e-turnSphero", "button1": "e-button1", "button2": "e-button2", "rotocoder": "e-lever", "micro": "e-micro"], image: "foret-e",backgroundMusic: "foret-e")


// iles
var tIE1 = TextChapter(typeC: "text", txt: "Devant elle s'étendait une île paradisiaque, baignée par des eaux cristallines et bordée de plages de sable fin. Le doux murmure des vagues berçait l'atmosphère, invitant Rebecca à pénétrer dans ce havre de paix.", dialog: [:], citation: [:])

var tIE2 = TextChapter(typeC: "text", txt: "Les plages étaient comme des toiles d'or déployées à perte de vue, tandis que le soleil peignait des reflets chatoyants sur l'eau. Des coquillages aux couleurs vives parsemaient le rivage, comme des joyaux éparpillés par la mer généreuse.", dialog: [:], citation: [:])

var dIE1 = TextChapter(typeC: "dialog", txt: "", dialog: ["Coquillage": "Bonjour petite fille, comment t’appelles-tu ?"], citation: [:])

var dIE2 = TextChapter(typeC: "dialog", txt: "", dialog: ["Rebecca": "Je m’appelle Rebecca."], citation: [:])

var dIE3 = TextChapter(typeC: "dialog", txt: "", dialog: ["Coquillage": "C’est rare d’avoir de la visite par ici !"], citation: [:])

var dIE4 = TextChapter(typeC: "dialog", txt: "", dialog: ["Rebecca": "C’est dommage tout est si beau et calme !"], citation: [:])

var cIE1 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["audio": "Jouez de vos instruments pour faire ressentir l’émerveillement de Rebecca."])

var tIE3 = TextChapter(typeC: "text", txt: "Rebecca s'émerveilla devant les grands arbres qui dansait avec le vent, libre et sauvage. Des immenses palmiers étendaient leurs bras vers le ciel, tandis que des fleurs aux teintes éclatantes donnait au paysage des couleurs éblouissantes.", dialog: [:], citation: [:])

var cIE2 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["visual": "Utilisez vos outils pour faire apparaître le nuage de bonheur. "])

var tIE4 = TextChapter(typeC: "text", txt: "Un doux parfum de fleurs embaumait l'air. La petite fille s'aventura plus loin, découvrant des rivières aux eaux cristallines serpentant à travers la végétation. Des papillons multicolores virevoltaient autour d'elle, créant un ballet enchanteur, elle décida de les suivre.", dialog: [:], citation: [:])

var chapterIlesE = Chapter(id: 16, titleC: "Les îles", textL: [tIE1, tIE2, dIE1, dIE2, dIE3, dIE4, cIE1, tIE3, cIE2, tIE4], visualIntraction: ["tapSphero","turnSphero", "button1", "button2", "rotocoder", "micro"], audioInteraction: ["tapSphero": "e-tapSphero", "turnSphero": "e-turnSphero", "button1": "e-button1", "button2": "e-button2", "rotocoder": "e-lever", "micro": "e-micro"], image: "iles-e",backgroundMusic: "iles-e")


// jungle
var tJE1 = TextChapter(typeC: "text", txt: "Devant elle s'étendait une vaste jungle tropicale, où des arbres immenses s'élevaient vers le ciel, leurs feuilles créant des cachettes pour les animaux vivants au-dessous. Des lianes pendantes dansaient doucement, tandis que des perroquets aux plumes éclatantes survolaient le paysage. Des perroquets vinrent la voir :", dialog: [:], citation: [:])

var dJE1 = TextChapter(typeC: "dialog", txt: "", dialog: ["Perroquets": "Bonjour petite fille, comment t’appelles-tu ?"], citation: [:])

var dJE2 = TextChapter(typeC: "dialog", txt: "", dialog: ["Rebecca": "Je m’appelle Rebecca."], citation: [:])

var dJE3 = TextChapter(typeC: "dialog", txt: "", dialog: ["Perroquets": "C’est rare d’avoir de la visite par ici !"], citation: [:])

var dJE4 = TextChapter(typeC: "dialog", txt: "", dialog: ["Rebecca": "C’est dommage tout est si beau et coloré !"], citation: [:])

var cJE1 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["audio": "Jouez de vos instruments pour faire ressentir l’émerveillement de Rebecca."])

var tJE3 = TextChapter(typeC: "text", txt: "Les plantes extraordinaires, aux couleurs vives et aux formes étonnantes, semblaient s'animer dans une danse enchanteresse. Des papillons aux ailes chatoyantes, telles des étoiles, volaient autour de fleurs exotiques.", dialog: [:], citation: [:])

var cJE2 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["visual": "Utilisez vos outils pour faire apparaître le nuage de bonheur. "])

var tJE4 = TextChapter(typeC: "text", txt: "Rebecca, émerveillée par cette jungle vivante, décida de suivre les petites empreintes lumineuses, tracées par des créatures invisibles.", dialog: [:], citation: [:])

var chapterJngleE = Chapter(id: 19, titleC: "La jungle", textL: [tJE1, dJE1, dJE2, dJE3, dJE4, cJE1, tJE3, cJE2, tJE4], visualIntraction: ["tapSphero","turnSphero", "button1", "button2", "rotocoder", "micro"], audioInteraction: ["tapSphero": "e-tapSphero", "turnSphero": "e-turnSphero", "button1": "e-button1", "button2": "e-button2", "rotocoder": "e-lever", "micro": "e-micro"], image: "jungle-e",backgroundMusic: "jungle-e")


// Riziere

var tRE1 = TextChapter(typeC: "text", txt: "Face à elle s'étendait une vaste étendue de verdure, où des rizières ondulaient comme des vagues infinies, formant un tapis d'un vert éclatant. Des cerfs-volants dansaient gracieusement dans le ciel, tandis que des grues au plumage éclatant planaient majestueusement au-dessus du paysage.", dialog: [:], citation: [:])

var dRE1 = TextChapter(typeC: "dialog", txt: "", dialog: ["Grues": "Bonjour petite fille, comment t’appelles-tu ?"], citation: [:])

var dRE2 = TextChapter(typeC: "dialog", txt: "", dialog: ["Rebecca": "Je m’appelle Rebecca."], citation: [:])

var dRE3 = TextChapter(typeC: "dialog", txt: "", dialog: ["Grues": "C’est rare d’avoir de la visite par ici !"], citation: [:])

var dRE4 = TextChapter(typeC: "dialog", txt: "", dialog: ["Rebecca": "C’est dommage tout est si beau et calme !"], citation: [:])

var cRE1 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["audio": "Jouez de vos instruments pour faire ressentir l’émerveillement de Rebecca."])

var tRE3 = TextChapter(typeC: "text", txt: "Les nuages extraordinaires, aux teintes éclatantes et aux formes étonnantes, semblaient participer à une danse aérienne au-dessus de l'étendue verdoyante des rizières. Des libellules aux ailes lumineuses, évoquant des étoiles en mouvement, virevoltaient gracieusement autour, ajoutant une touche magique à ce tableau naturel.", dialog: [:], citation: [:])

var cRE2 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["visual": "Utilisez vos outils pour faire apparaître le nuage de bonheur. "])

var tRE4 = TextChapter(typeC: "text", txt: "Rebecca, émerveillée par ces rizières, décida de suivre les petites empreintes lumineuses, tracées par des créatures invisibles.", dialog: [:], citation: [:])

var chapterRizieresE = Chapter(id: 21, titleC: "Les rizières", textL: [tJE1, dJE1, dJE2, dJE3, dJE4, cJE1, tJE3, cJE2, tJE4], visualIntraction: ["tapSphero","turnSphero", "button1", "button2", "rotocoder", "micro"], audioInteraction: ["tapSphero": "e-tapSphero", "turnSphero": "e-turnSphero", "button1": "e-button1", "button2": "e-button2", "rotocoder": "e-lever", "micro": "e-micro"], image: "jungle-e",backgroundMusic: "jungle-e")


// volcan

var tVE1 = TextChapter(typeC: "text", txt: "Devant elle s'étendait une vaste étendue de sable noir, où des champs de lave ondulaient comme des vagues infinies, créant un tapis sombre sous le ciel islandais. Des oiseaux marins planaient gracieusement dans l'air, tandis que des macareux au plumage coloré plongeaient majestueusement au-dessus du paysage côtier.", dialog: [:], citation: [:])

var dVE1 = TextChapter(typeC: "dialog", txt: "", dialog: ["Macareux": "Bonjour petite fille, comment t’appelles-tu ?"], citation: [:])

var dVE2 = TextChapter(typeC: "dialog", txt: "", dialog: ["Rebecca": "Je m’appelle Rebecca."], citation: [:])

var dVE3 = TextChapter(typeC: "dialog", txt: "", dialog: ["Macareux": "C’est rare d’avoir de la visite par ici !"], citation: [:])

var dVE4 = TextChapter(typeC: "dialog", txt: "", dialog: ["Rebecca": "C’est dommage tout est si beau et calme !"], citation: [:])

var cVE1 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["audio": "Jouez de vos instruments pour faire ressentir l’émerveillement de Rebecca."])

var tVE3 = TextChapter(typeC: "text", txt: "Les nuages aux formes étonnantes, semblaient participer à une danse aérienne de l’océan. Rebecca s’amusait dans le sable avec ses nouveaux amis au pied des falaises.", dialog: [:], citation: [:])

var cVE2 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["visual": "Utilisez vos outils pour faire apparaître le nuage de bonheur. "])

var tVE4 = TextChapter(typeC: "text", txt: "Rebecca, émerveillée par ces grandes falaises, décida de suivre les petites empreintes lumineuses, tracées par des créatures invisibles.", dialog: [:], citation: [:])

var chapterVolcanE = Chapter(id: 24, titleC: "Sables noir", textL: [tVE1, dVE1, dVE2, dVE3, dVE4, cVE1, tVE3, cVE2, tVE4], visualIntraction: ["tapSphero","turnSphero", "button1", "button2", "rotocoder", "micro"], audioInteraction: ["tapSphero": "e-tapSphero", "turnSphero": "e-turnSphero", "button1": "e-button1", "button2": "e-button2", "rotocoder": "e-lever", "micro": "e-micro"], image: "volcan-e",backgroundMusic: "volcan-e")
