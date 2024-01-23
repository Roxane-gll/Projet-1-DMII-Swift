//aqua
var tAP1 = TextChapter(typeC: "text", txt: "À chaque mouvement, Rebecca découvrait des créatures extraordinaires : des poissons serpentant silencieusement à travers les algues, des coraux aux formes fantaisistes qui ondulaient sous le courant marin.", dialog: [:], citation: [:])

var dAP1 = TextChapter(typeC: "dialog", txt: "", dialog: ["Poissons": "Viens nager avec nous à travers les algues !"], citation: [:])

var tAP2 = TextChapter(typeC: "text", txt: "Rebecca se mit à se faufiler à travers les algues chatouilleuses. Cependant, alors que Rebecca s'amusait à explorer cet univers sous-marin, elle remarqua soudain des éclats lumineux dans les profondeurs, comme des petits yeux qui la suivait.", dialog: [:], citation: [:])

var dAP2 = TextChapter(typeC: "dialog", txt: "", dialog: ["Rebecca": "Qu’est-ce que c’est, c’est étonnant ces petites lumières…"], citation: [:])

var tAP3 = TextChapter(typeC: "text", txt: "Puis, quelques instants plus tard, elle se retrouva entourée d’une bande de requin terrifiants dans l'obscurité des fonds marins.", dialog: [:], citation: [:])

var cAP1 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["audio": "Jouez les instruments pour faire ressentir la peur de Rebecca."])

var tAP4 = TextChapter(typeC: "text", txt: "Prise de panique face à leurs mâchoires pleines de dents, elle décida de nager rapidement vers un abri sous-marin qu'elle distingua à proximité.", dialog: [:], citation: [:])

var cAP2 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["visual": "Utilisez vos outils pour faire apparaître la peur."])

var tAP5 = TextChapter(typeC: "text", txt: "Rebecca était tétanisée de peur, quand tout à coup elle entendit des petites voix :", dialog: [:], citation: [:])

var dAP3 = TextChapter(typeC: "dialog", txt: "", dialog: ["Requin": "Nous sommes gentils, je sais que notre apparence peut être trompeuse, mais nous ne te voulons pas de mal !"], citation: [:])

var tAP6 = TextChapter(typeC: "text", txt: "Rebecca pris son courage à deux mains et retrouva la bande de requin, elle réalisa que malgré leurs apparences étranges ils étaient très drôles. Rebecca était fière d’elle, elle avait réussi à surmonter sa peur avait gagné de nouveaux amis.", dialog: [:], citation: [:])

var tAP7 = TextChapter(typeC: "text", txt: "Rebecca décida de poursuivre en s’aventurant dans une grotte sous-marine. La grotte sombre au début, révéla peu à peu une lueur douce provenant du fond. Intriguée et curieuse, Rebecca se dirigea prudemment vers cette lumière.", dialog: [:], citation: [:])

var chapterAquaP = Chapter(id: 7, titleC: "La peur Aqua", textL: [tAP1, dAP1, tAP2, dAP2, tAP3, cAP1, tAP4, cAP2, tAP5, dAP3, tAP6, tAP7], visualIntraction: ["tapSphero","turnSphero", "button1", "button2", "rotocoder", "micro"], audioInteraction: ["tapSphero": "p-tapSphero", "turnSphero": "p-turnSphero", "button1": "p-button1", "button2": "p-button2", "rotocoder": "p-lever", "micro": "p-micro"], image: "aqua-p",backgroundMusic: "aqua-p", interactionColor: [(74,167,184)])

// jungle

var tJungle1 = TextChapter(typeC: "text", txt: "À chaque pas, Rebecca découvrait des créatures extraordinaires : des grenouilles aux peaux gluantes, des orchidées aux formes fantastiques qui dansaient sous la brise tropicale.", dialog: [:], citation: [:])

var tAqua2 = TextChapter(typeC: "text", txt: "Les grenouilles l'invitèrent à coasser avec eux :", dialog: [:], citation: [:])

var D1Aqua = TextChapter(typeC: "dialog", txt: "", dialog: ["Grenouille": "Viens chanter avec nous !"], citation: [:])

var tAqua3 = TextChapter(typeC: "text", txt: "Rebecca se mit à se coasser avec ses nouveaux amis gluants !", dialog: [:], citation: [:])

var tJungle4 = TextChapter(typeC: "text", txt: " Cependant, alors que Rebecca s'amusait à explorer cette forêt tropicale, elle remarqua soudain deux lueurs éclatantes à travers les fougères.", dialog: [:], citation: [:])

var D2Aqua = TextChapter(typeC: "dialog", txt: "", dialog: ["Rebecca": "Qu’est-ce que c’est, c’est étonnant ces petites lumières…"], citation: [:])

var tAqua5 = TextChapter(typeC: "text", txt: "Puis, quelques instants plus tard, elle se retrouva entourée de petites lucioles dorées qui brillaient doucement dans l'obscurité de la jungle, créant une lueur intrigante.", dialog: [:], citation: [:])

var C1Aqua = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["audio": "Jouez les instruments pour faire ressentir la peur de Rebecca."])

var tAqua6 = TextChapter(typeC: "text", txt: "Prise de panique face à l'inconnu, elle décida de courir se cacher derrière une grande fougère à proximité.", dialog: [:], citation: [:])

var C2Aqua = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["visual": "Utilisez vos outils pour faire apparaître la peur."])

var tAqua7 = TextChapter(typeC: "text", txt: "Rebecca était tétanisée de peur, quand tout à coup elle entendit des petites voix :", dialog: [:], citation: [:])

var D3Aqua = TextChapter(typeC: "dialog", txt: "", dialog: ["Lucioles": "Nous sommes gentilles, je sais que notre apparence peut être trompeuse, mais nous ne te voulons pas de mal ! Nous ne voulions pas te faire peur…"], citation: [:])

var tAqua8 = TextChapter(typeC: "text", txt: "Rebecca pris son courage à deux mains et sorti de sa cachette pour retrouver les lucioles, elle se rendit compte que malgré leurs apparences étranges elles étaient très drôles. Rebecca était fière d’elle, elle avait réussi à surmonter sa peur avait gagné de nouveaux amis.", dialog: [:], citation: [:])

var tJungle9 = TextChapter(typeC: "text", txt: "Rebecca décida de poursuivre en s’aventurant dans une grotte cachée sous des lianes. La grotte sombre au début, révéla peu à peu une lueur douce provenant du fond. Intriguée et curieuse, Rebecca se dirigea prudemment vers cette lumière.", dialog: [:], citation: [:])

var chapterP = Chapter(id: 3, titleC: "La jungle", textL: [tJungle1, tAqua2, D1Aqua, tAqua3, tJungle4, D2Aqua, tAqua5, C1Aqua, tAqua6, C2Aqua, tAqua7, D3Aqua, tAqua8, tJungle9], visualIntraction: ["tapSphero","turnSphero", "button1", "button2", "rotocoder", "micro"], audioInteraction: ["tapSphero": "p-tapSphero", "turnSphero": "p-turnSphero", "button1": "p-button1", "button2": "p-button2", "rotocoder": "p-lever", "micro": "p-micro"], image: "jungle-P",backgroundMusic: "jungle-p")


// banquise
var tBP1 = TextChapter(typeC: "text", txt: "À chaque pas sur la banquise, Rebecca contemplait des créatures extraordinaires : des aurores boréales dansant parmi les icebergs, des manchots dansant sur la banquise.", dialog: [:], citation: [:])

var dBP1 = TextChapter(typeC: "dialog", txt: "", dialog: ["Manchots": "Viens glisser avec nous sur les pentes glacées !"], citation: [:])

var tBP2 = TextChapter(typeC: "text", txt: "Rebecca se mit à se mis à glisser et dévaler les pentes glacées avec ses nouveaux amis rigolo ! Cependant, alors que Rebecca s’amusait à explorer cet univers glacial, elle repéra soudain deux ailerons noirs à travers les eaux polaires.", dialog: [:], citation: [:])

var dBP2 = TextChapter(typeC: "dialog", txt: "", dialog: ["Rebecca": "Qu’est-ce que c’est, c’est étonnant ces petits drapeaux qui sortent de l’eau…"], citation: [:])

var tBP3 = TextChapter(typeC: "text", txt: "Puis, quelques instants plus tard, elle se retrouva entourée d’ailerons autour d’elle.", dialog: [:], citation: [:])

var cBP1 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["audio": "Jouez les instruments pour faire ressentir la peur de Rebecca."])

var tBP4 = TextChapter(typeC: "text", txt: "Prise de panique devant l’inconnu elle se précipita pour se cacher dans une grotte de glace.", dialog: [:], citation: [:])

var cBP2 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["visual": "Utilisez vos outils pour faire apparaître la peur."])

var tBP5 = TextChapter(typeC: "text", txt: "Rebecca était tétanisée de peur, quand tout à coup elle entendit des petites voix :", dialog: [:], citation: [:])

var dBP3 = TextChapter(typeC: "dialog", txt: "", dialog: ["Orques": "Nous sommes gentils, je sais que notre apparence peut être trompeuse, mais nous ne te voulons pas de mal !"], citation: [:])

var tBP6 = TextChapter(typeC: "text", txt: "Rebecca pris son courage à deux mains et retrouva les orques, elle réalisa que malgré leurs apparences étranges ils étaient très drôles. Rebecca était fière d’elle, elle avait réussi à surmonter sa peur et se faire de nouveaux amis.", dialog: [:], citation: [:])

var tBP7 = TextChapter(typeC: "text", txt: "Rebecca décida de poursuivre son aventure en s’aventurant dans une grotte glacée. La grotte sombre au début, révéla peu à peu une lueur douce provenant du fond. Intriguée et curieuse, Rebecca se dirigea prudemment vers cette lumière.", dialog: [:], citation: [:])

var chapterBanquiseP = Chapter(id: 9, titleC: "La peur blanche", textL: [tBP1, dBP1, tBP2, dBP2, tBP3, cBP1, tBP4, cBP2, tBP5, dBP3, tBP6, tBP7], visualIntraction: ["tapSphero","turnSphero", "button1", "button2", "rotocoder", "micro"], audioInteraction: ["tapSphero": "p-tapSphero", "turnSphero": "p-turnSphero", "button1": "p-button1", "button2": "p-button2", "rotocoder": "p-lever", "micro": "p-micro"], image: "banquise-p",backgroundMusic: "banquise-p")

// Desert

var tDP1 = TextChapter(typeC: "text", txt: "À chaque pas, Rebecca découvrait des créatures extraordinaires : des serpents ondulant silencieusement à travers le sable, des cactus aux formes fantaisistes qui dansait sous le vent.", dialog: [:], citation: [:])

var tDP2 = TextChapter(typeC: "text", txt: "Les serpents l’invitèrent à danser avec eux :", dialog: [:], citation: [:])

var dDP1 = TextChapter(typeC: "dialog", txt: "", dialog: ["Serpents": "Sssss Viens danser avec nous ! Ssssss"], citation: [:])

var tDP3 = TextChapter(typeC: "text", txt: "Rebecca se mit à se trémousser avec ses nouveaux amis !", dialog: [:], citation: [:])

var tDP4 = TextChapter(typeC: "text", txt: "Cependant, alors que Rebecca s'amusait à explorer ce désert, elle remarqua soudain deux éclats lumineux dans la chaleur étourdissante.", dialog: [:], citation: [:])

var dDP2 = TextChapter(typeC: "dialog", txt: "", dialog: ["Rebecca": "Qu’est-ce que c’est, c’est étonnant ces petites lumières…"], citation: [:])

var tDP5 = TextChapter(typeC: "text", txt: "Puis, quelques instants plus tard, elle se retrouva entourée de petits éclats dorés qui brillaient doucement dans l'obscurité du désert, créant une lueur mystérieuse.", dialog: [:], citation: [:])

var cDP1 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["audio": "Jouez les instruments pour faire ressentir la peur de Rebecca."])

var tDP6 = TextChapter(typeC: "text", txt: "Prise de panique face à l'inconnu, elle décida de courir se cacher dans un terrier d’animal qu’elle distingua à proximité.", dialog: [:], citation: [:])

var cDP2 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["visual": "Utilisez vos outils pour faire apparaître la peur."])

var tDP7 = TextChapter(typeC: "text", txt: "Rebecca était tétanisée de peur, quand tout à coup elle entendit des petites voix :", dialog: [:], citation: [:])

var dDP3 = TextChapter(typeC: "dialog", txt: "", dialog: ["Serpents": "Rebecca, ne t’inquiète pas, ce sont nos sonnettes elles s’illuminent lorsque nous sommes très heureux."], citation: [:])

var tDP8 = TextChapter(typeC: "text", txt: "Rebecca pris son courage à deux mains et retrouva les serpents, elle réalisa qu’il s’agissait de ses amis et que leurs lumières étaient finalement très rigolotes. Rebecca était fière d’elle, elle avait réussi à surmonter sa peur et se faire de nouveaux amis.", dialog: [:], citation: [:])

var tDP9 = TextChapter(typeC: "text", txt: "Rebecca décida de poursuivre son aventure en s’aventurant dans un terrier de fennecs. Le terrier sombre au début, révéla peu à peu une lueur douce provenant du fond. Intriguée et curieuse, Rebecca se dirigea prudemment vers cette lumière.", dialog: [:], citation: [:])

var chapterDesertP = Chapter(id: 11, titleC: "La peur desert", textL: [tDP1,tDP2, dDP1, tDP3,tDP4, dDP2, tDP5, cDP1, tDP6, cDP2, tDP7, dDP3, tDP8, tDP9], visualIntraction: ["tapSphero","turnSphero", "button1", "button2", "rotocoder", "micro"], audioInteraction: ["tapSphero": "p-tapSphero", "turnSphero": "p-turnSphero", "button1": "p-button1", "button2": "p-button2", "rotocoder": "p-lever", "micro": "p-micro"], image: "desert-p",backgroundMusic: "desert-p")


// foret
var tFP1 = TextChapter(typeC: "text", txt: "À chaque pas, Rebecca découvrait des créatures : des champignons qui brillaient dans l'obscurité, des fleurs qui s'ouvraient pour raconter des histoires, des renards aux regards malicieux et des rires venant des cachettes secrètes.", dialog: [:], citation: [:])

var dFP1 = TextChapter(typeC: "dialog", txt: "", dialog: ["Renard": "Viens t’amuser avec nous !"], citation: [:])

var tFP3 = TextChapter(typeC: "text", txt: "Rebecca se mit à se faufiler à travers les fougères.", dialog: [:], citation: [:])

var tFP4 = TextChapter(typeC: "text", txt: "Cependant, tandis que Rebecca s'amusait à explorer cette forêt enchantée, elle remarqua soudain deux billes jaunes dans la pénombre.", dialog: [:], citation: [:])

var dFP2 = TextChapter(typeC: "dialog", txt: "", dialog: ["Rebecca": "Qu’est-ce que c’est, c’est étonnant ces petites lumières…"], citation: [:])

var tFP5 = TextChapter(typeC: "text", txt: "Puis quelques instants plus tard, Rebecca se trouva entourée de billes jaunes étincelantes dans l'obscurité, émettant une lueur douce et mystérieuse.", dialog: [:], citation: [:])

var cFP1 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["audio": "Jouez les instruments pour faire ressentir la peur de Rebecca."])

var tFP6 = TextChapter(typeC: "text", txt: "Prise de panique face à l'inconnu, elle décida de courir se cacher dans une grotte qu'elle aperçut à proximité.", dialog: [:], citation: [:])

var cFP2 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["visual": "Utilisez vos outils pour faire apparaître la peur."])

var tFP7 = TextChapter(typeC: "text", txt: "Rebecca était tétanisée de peur, quand tout à coup elle entendit des petites voix :", dialog: [:], citation: [:])

var dFP3 = TextChapter(typeC: "dialog", txt: "", dialog: ["Sanglier": "Nous sommes gentils, je sais que notre apparence peut être trompeuse, mais nous ne te voulons pas de mal ! Nous ne voulions pas te faire peur…"], citation: [:])

var tFP8 = TextChapter(typeC: "text", txt: "Rebecca pris son courage à deux mains et retrouva les sangliers, elle réalisa que malgré leurs apparences étranges ils étaient très drôles. Rebecca était fière d’elle, elle avait réussi à surmonter sa peur avait gagné de nouveaux amis.", dialog: [:], citation: [:])

var tFP9 = TextChapter(typeC: "text", txt: "Rebecca décida de poursuivre en s’aventurant dans la grotte qu’elle avait découverte. La grotte sombre au début, révéla peu à peu une lueur douce provenant du fond. Intriguée et curieuse, Rebecca se dirigea prudemment vers cette lumière.", dialog: [:], citation: [:])

var chapterForetP = Chapter(id: 14, titleC: "La foret interdite", textL: [tFP1, dFP1, tFP3,tFP4, dFP2, tFP5, cFP1, tFP6, cFP2, tFP7, dFP3, tFP8, tFP9], visualIntraction: ["tapSphero","turnSphero", "button1", "button2", "rotocoder", "micro"], audioInteraction: ["tapSphero": "p-tapSphero", "turnSphero": "p-turnSphero", "button1": "p-button1", "button2": "p-button2", "rotocoder": "p-lever", "micro": "p-micro"], image: "foret-p",backgroundMusic: "foret-p")


// iles

var tIP1 = TextChapter(typeC: "text", txt: "Alors que Rebecca continuait son exploration de l'île enchantée, elle s'enfonça plus profondément dans la végétation luxuriante. Le sol sous ses pieds était recouvert d'une mousse douce, et le chant mélodieux des oiseaux remplissait l'air.", dialog: [:], citation: [:])

var dIP1 = TextChapter(typeC: "dialog", txt: "", dialog: ["Oiseau": "Viens chanter avec nous !"], citation: [:])

var tIP3 = TextChapter(typeC: "text", txt: "Rebecca se mit à chanter avec les oiseaux tout en continuant son chemin. Cependant, à mesure qu'elle avançait, une étrange lueur semblait danser entre les feuillages.", dialog: [:], citation: [:])

var dIP2 = TextChapter(typeC: "dialog", txt: "", dialog: ["Rebecca": "Qu’est-ce que c’est, c’est étonnant cette lumière… "], citation: [:])

var tIP5 = TextChapter(typeC: "text", txt: "Soudain, au détour d'un sentier, une silhouette émergea de l'ombre. Des yeux brillants comme des étoiles se posèrent sur Rebecca, et une voix douce murmura : 'Bienvenue, petite voyageuse, dans notre domaine enchanté.' Un groupe de fées, apparut devant elle.", dialog: [:], citation: [:])

var tIP4 = TextChapter(typeC: "text", txt: "Au début, la curiosité de Rebecca l'emplit d'émerveillement, mais une pointe de peur commença à s'insinuer dans son cœur. Les créatures, bien qu'elles fussent délicates et gracieuses, semblaient différentes de tout ce qu'elle n'avait jamais vu.", dialog: [:], citation: [:])

var cIP1 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["audio": "Jouez les instruments pour faire ressentir la peur de Rebecca."])

var tIP6 = TextChapter(typeC: "text", txt: "La lueur dans leurs yeux prenait des teintes mystérieuses, et leur présence évoquait un monde au-delà de la réalité qu'elle connaissait. La petite fille hésita un instant, submergée par l'incertitude et la peur de l'inconnu.", dialog: [:], citation: [:])

var cIP2 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["visual": "Utilisez vos outils pour faire apparaître la peur."])

var tIP7 = TextChapter(typeC: "text", txt: "Cependant, elle se rappela les paroles de sa grand-mère, qui lui disait que parfois, il fallait affronter ses peurs pour découvrir la véritable beauté cachée derrière elles.", dialog: [:], citation: [:])

var tIP8 = TextChapter(typeC: "text", txt: "Armée de courage, Rebecca s'approcha lentement des créatures. Elles lui sourirent chaleureusement et lui racontèrent les légendes de l’île. Les créatures invitaient Rebecca à danser avec elles sous la lueur des étoiles, et elle se retrouva bientôt enveloppée par la magie qui émanait de leur présence bienveillante. Sa décision de surmonter sa peur l'avait conduit à une découverte extraordinaire, à une rencontre qui enrichirait son cœur pour le reste de sa vie.", dialog: [:], citation: [:])

var tIP9 = TextChapter(typeC: "text", txt: "Ainsi, Rebecca continua son voyage à travers l'île, prête à explorer chaque recoin de ce monde merveilleux, maintenant libérée de l'ombre de la peur.", dialog: [:], citation: [:])

var chapterIlesP = Chapter(id: 17, titleC: "Les fées de la fôret", textL: [tIP1, dIP1, tIP3, dIP2, tIP5, tIP4, cIP1, tIP6, cIP2, tIP7, tIP8, tIP9], visualIntraction: ["tapSphero","turnSphero", "button1", "button2", "rotocoder", "micro"], audioInteraction: ["tapSphero": "p-tapSphero", "turnSphero": "p-turnSphero", "button1": "p-button1", "button2": "p-button2", "rotocoder": "p-lever", "micro": "p-micro"], image: "iles-p",backgroundMusic: "iles-p")


// rizière

var tRP1 = TextChapter(typeC: "text", txt: "Courant à travers les rizières japonaises, Rebecca découvrait des créatures extraordinaires : des dragons volants et des cigognes qui dansaient à travers les courants du vent parmi les épis de riz.", dialog: [:], citation: [:])

var tRP2 = TextChapter(typeC: "text", txt: "Les dragons volants l'invitèrent à s’amuser avec eux :", dialog: [:], citation: [:])

var dRP1 = TextChapter(typeC: "dialog", txt: "", dialog: ["Dragon": "Viens t’amuser avec nous !"], citation: [:])

var tRP3 = TextChapter(typeC: "text", txt: "Rebecca s’amusait avec ses nouveaux amis !", dialog: [:], citation: [:])

var tRP4 = TextChapter(typeC: "text", txt: "Cependant, alors qu'elle explorait ce ciel au-dessus des rizières, elle remarqua soudain deux lueurs éclatantes à travers les herbes hautes.", dialog: [:], citation: [:])

var dRP2 = TextChapter(typeC: "dialog", txt: "", dialog: ["Rebecca": "Qu’est-ce que c’est, c’est étonnant ces petites lumières…"], citation: [:])

var tRP5 = TextChapter(typeC: "text", txt: "Puis, quelques instants plus tard, elle se retrouva entourée de petites lucioles dorées qui brillaient doucement dans l'obscurité du ciel, créant une lueur mystérieuse.", dialog: [:], citation: [:])

var cRP1 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["audio": "Jouez les instruments pour faire ressentir la peur de Rebecca."])

var tRP6 = TextChapter(typeC: "text", txt: "Prise de panique face à l'inconnu, elle décida de courir se cacher derrière les herbes hautes.", dialog: [:], citation: [:])

var cRP2 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["visual": "Utilisez vos outils pour faire apparaître la peur."])

var tRP7 = TextChapter(typeC: "text", txt: "Rebecca était tétanisée de peur, quand tout à coup elle entendit des petites voix :", dialog: [:], citation: [:])

var dRP3 = TextChapter(typeC: "dialog", txt: "", dialog: ["Lucioles": "Nous sommes gentilles, je sais que notre apparence peut être trompeuse, mais nous ne te voulons pas de mal ! Nous ne voulions pas te faire peur…"], citation: [:])

var tRP8 = TextChapter(typeC: "text", txt: "Rebecca prit son courage à deux mains et sortit de sa cachette pour retrouver les lucioles, elle se rendit compte que malgré leurs apparences étranges, elles étaient très drôles. Rebecca était fière d’elle, elle avait réussi à surmonter sa peur et avait gagné de nouveaux amis.", dialog: [:], citation: [:])

var tRP9 = TextChapter(typeC: "text", txt: "Rebecca décida de poursuivre son aventure en s’aventurant dans une grotte cachée par les plans de rizière. La grotte sombre au début, révéla peu à peu une lueur douce provenant du fond. Intriguée et curieuse, Rebecca se dirigea prudemment vers cette lumière.", dialog: [:], citation: [:])

var chapterRizieresP = Chapter(id: 22, titleC: "Les rizières de nuit", textL: [tRP1,tRP2, dRP1, tRP3,tRP4, dRP2, tRP5, cRP1, tRP6, cRP2, tRP7, dRP3, tRP8, tRP9], visualIntraction: ["tapSphero","turnSphero", "button1", "button2", "rotocoder", "micro"], audioInteraction: ["tapSphero": "p-tapSphero", "turnSphero": "p-turnSphero", "button1": "p-button1", "button2": "p-button2", "rotocoder": "p-lever", "micro": "p-micro"], image: "rizieres-p",backgroundMusic: "rizieres-p")


// volcan

var tVP1 = TextChapter(typeC: "text", txt: "À chaque pas, Rebecca découvrait des grottes à travers les falaises, elle rencontra des béliers qui l’invitèrent à sauter sur la plage avec elle : ", dialog: [:], citation: [:])

var dVP1 = TextChapter(typeC: "dialog", txt: "", dialog: ["Béliers": "Viens sauter avec nous à travers les falaises !"], citation: [:])

var tVP3 = TextChapter(typeC: "text", txt: "Rebecca se mit à se faufiler à travers les rochers en riant aux éclats. Cependant, alors que Rebecca s'amusait à explorer ces paysages, elle remarqua soudain des éclats lumineux à l’intérieur d’une des grottes, comme des petits yeux qui la suivait.", dialog: [:], citation: [:])

var dVP2 = TextChapter(typeC: "dialog", txt: "", dialog: ["Rebecca": "Qu’est-ce que c’est, c’est étonnant…"], citation: [:])

var tVP5 = TextChapter(typeC: "text", txt: "Rebecca décida de s’approcher de la grotte, puis, quelques instants plus tard, elle se retrouva entouré de plusieurs éclats jaunes dans la pénombre.", dialog: [:], citation: [:])

var cVP1 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["audio": "Jouez les instruments pour faire ressentir la peur de Rebecca."])

var tVP6 = TextChapter(typeC: "text", txt: "Prise de panique face à l’inconnu, elle décida de se cacher rapidement dans un des recoins de la grotte.", dialog: [:], citation: [:])

var cVP2 = TextChapter(typeC: "citation", txt: "", dialog: [:], citation: ["visual": "Utilisez vos outils pour faire apparaître la peur."])

var tVP7 = TextChapter(typeC: "text", txt: "Rebecca était tétanisée de peur, quand tout à coup elle entendit des petites voix :", dialog: [:], citation: [:])

var dVP3 = TextChapter(typeC: "dialog", txt: "", dialog: ["Renardeaux": "Nous sommes gentils, nous ne voulions pas te faire peur, nous sommes perdus…"], citation: [:])

var tVP8 = TextChapter(typeC: "text", txt: "Rebecca pris son courage à deux mains et retrouva les petits renardeaux, elle réalisa qu’elle avait pris peur face à l’inconnu et ce n’était au final pas effrayant du tout. Elle aida les petits renardeaux à remonter en haut de la falaise pour qu’il retrouve leur maman. Rebecca était fière d’elle, elle avait réussi à surmonter sa peur avait gagné de nouveaux amis.", dialog: [:], citation: [:])

var tVP9 = TextChapter(typeC: "text", txt: "Rebecca décida de poursuivre en s’aventurant dans une des grottes de la falaise. La grotte sombre au début, révéla peu à peu une lueur douce provenant du fond. Intriguée et curieuse, Rebecca se dirigea prudemment vers cette lumière.", dialog: [:], citation: [:])

var chapterVolcanP = Chapter(id: 25, titleC: "Les renardeaux", textL: [tVP1, dVP1, tVP3, dVP2, tVP5, cVP1, tVP6, cVP2, tVP7, dVP3, tVP8, tVP9], visualIntraction: ["tapSphero","turnSphero", "button1", "button2", "rotocoder", "micro"], audioInteraction: ["tapSphero": "p-tapSphero", "turnSphero": "p-turnSphero", "button1": "p-button1", "button2": "p-button2", "rotocoder": "p-lever", "micro": "p-micro"], image: "volcan-p",backgroundMusic: "volcan-p")
