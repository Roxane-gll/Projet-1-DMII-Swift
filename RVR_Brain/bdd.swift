var tStart1 = TextChapter(typeC: "text", txt: "Dans le petit village de Rebecca, les journées étaient faites de magie. Chaque rayon de soleil semblait mettre de la magie dans l’air, et chaque brise douce portait avec elle des secrets enchantés. Un matin, alors que les oiseaux chantaient en chœur et que les fleurs s'étiraient doucement, Rebecca s'aventura près de la rivière qui murmurait des histoires.", dialog: [:], citation: [:])

var tStart2 = TextChapter(typeC: "text", txt: "Alors qu'elle jouait parmi les pétales colorés des fleurs, quelque chose d'extraordinaire attira son attention. Derrière un rideau de buissons, elle découvrit une porte secrète. Intriguée, Rebecca posa sa petite main sur la poignée, la tourna délicatement, et là, elle pénétra dans un monde qui semblait tout droit sorti d'un rêve.", dialog: [:], citation: [:])

var tStart3 = TextChapter(typeC: "text", txt: "Parmi les pétales colorés des fleurs, derrière un rideau de buissons, une porte secrète.", dialog: [:], citation: [:])

var chapterStart = Chapter(id: 1, titleC: "Le départ", textL: [tStart1, tStart2, tStart3], visualIntraction: [], audioInteraction: [:], image: "start",backgroundMusic: "start")

var tEnd1 = TextChapter(typeC: "text", txt: "Rebecca s'éveilla doucement de son sommeil, les images de ses aventures magiques encore fraîches dans son esprit. Le souvenir des mondes enchantés, des créatures mystiques, et des amis improbables la remplit d'une joie chaleureuse. Réalisant que tout cela avait été un rêve extraordinaire, elle ne put s'empêcher de sourire.", dialog: [:], citation: [:])

var tEnd2 = TextChapter(typeC: "text", txt: "Pleine d'enthousiasme, Rebecca se prépara pour la journée qui l'attendait. Elle se rendit à l'école avec un secret précieux qu'elle ne pouvait attendre de partager. Une fois à l'école, elle rassembla ses amis et les entraîna dans le récit envoûtant de ses aventures fantastiques.", dialog: [:], citation: [:])


var chapterEnd = Chapter(id: 5, titleC: "Le reveil", textL: [tEnd1, tEnd2], visualIntraction: [], audioInteraction: [:], image: "end",backgroundMusic: "start")


var story1 = Story(id: 1, title: "Story 1", chapters: [chapterStart], chosingFromChapter: [1: [chapterStart], 2: [chapterDesert, chapterAquaE, chapterBanquiseE, chapterForetE, chapterIlesE, chapterJngleE, chapterRizieresE, chapterVolcanE], 3: [chapterP, chapterAquaP, chapterBanquiseP, chapterDesertP, chapterForetP, chapterIlesP, chapterRizieresP, chapterVolcanP], 4: [chapterT, chapterBanquiseT, chapterDesertC, chapterForetT, chapterIlesC, chapterJungleT, chapterRizieresT, chapterVolcanC], 5: [chapterEnd]])
