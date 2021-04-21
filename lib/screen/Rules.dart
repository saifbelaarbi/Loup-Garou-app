import 'package:flutter/material.dart';
import 'Role.dart';
import 'HomeScreen.dart';

class Rules extends StatelessWidget {
  @override
  List<Role> next;

  Rules({Key key, @required this.next}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Règles', style: TextStyle(fontFamily: 'Cinzel', fontWeight: FontWeight.w900),),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeScreen(next : next)));
            }),
        backgroundColor: Color(0xff193540),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                'Règles du jeu de base',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                  """La partie doit être menée par une personne ne prenant pas part au jeu. Le meneur distribue une carte à chaque joueur, au hasard. Puis chaque joueur découvre secrètement son identité en regardant sa carte.

Les joueurs sont divisés en deux camps : les villageois (certains d'entre eux jouant un rôle spécial) et les loups-garous. Le but des villageois est de découvrir et d'éliminer les loups-garous, et le but des loups-garous est de ne pas se faire démasquer et d'éliminer tous les villageois.

Les tours de jeu sont rythmés par une période de jour et une période de nuit."""),
              Text(
                'Durant la nuit',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'tous les joueurs ont les yeux fermés et ne doivent pas communiquer. Appelés par le meneur de jeu, les loups-garous se réveillent, et désignent ensemble (par gestes pour éviter de se faire reconnaître) un villageois qui sera leur victime. Les villageois qui ont des capacités spéciales (cupidon, sorcière, voyante…), sont également appelés tour à tour pour utiliser leurs pouvoirs respectifs.',
              ),
              Text(
                'Le jour revenu',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                  """tout le monde se réveille et ouvre les yeux et le meneur de jeu révèle l'identité de la (ou les) victime(s). Les victimes n'interviennent plus jusqu'à la fin du jeu mais pourront garder les yeux ouverts et y assister. Les Villageois vont tenter de découvrir qui sont les loups-garous par déductions, discours, révélations… Les loups-garous (qui participent aux débats, bien sûr : ils habitent le village !) doivent éviter de se faire incriminer en détournant les soupçons sur d'autres personnes. Il y a donc un temps de discussion au cours duquel chacun tente de découvrir la véritable identité de chaque joueur.

À la fin du débat, chaque joueur pointe du doigt une personne qu'il suspecte d'être loup-garou. Celui étant désigné par la majorité est "exécuté" et le meneur montre son identité. Il est donc éliminé, puis le jeu recommence à la tombée de la nuit.

Lors de la première journée, il peut y avoir une action supplémentaire à faire avant de décider du coupable : il s'agit de l'élection du Capitaine du village. N'importe qui peut se présenter (même un loup-garou) et sa nomination est effectuée par vote. Son pouvoir se cumule avec ses éventuelles autres compétences, et il est très important. En effet, lors du vote des villageois, sa voix compte double. Quand le capitaine du village est éliminé (quelle qu'en soit la raison), c'est lui-même qui désigne son successeur, dans son dernier souffle.

Le jeu se termine lorsqu'il ne reste plus que des villageois ou plus que des loups-garous."""),
              SizedBox(
                height: 30,
              ),
              Text(
                'Les charactères',
                style: TextStyle(fontSize: 35),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '-Simple Villageois-',
                style: TextStyle(fontSize: 25),
              ),
              Image.asset(
                'assets/images/sv.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  'Il n’a aucune compétence particulière, il faut juste que le joueur soit très intuitif.'),
              SizedBox(
                height: 20,
              ),
              Text(
                '-Voyante-',
                style: TextStyle(fontSize: 25),
              ),
              Image.asset(
                'assets/images/voyante.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  'Chaque nuit, elle connaît la vrai personnalité d’un joueur de son choix, elle doit aider les Villageois, sans être démasquée par les Loups-Garous.'),
              SizedBox(
                height: 20,
              ),
              Text(
                '-Chasseur-',
                style: TextStyle(fontSize: 25),
              ),
              Image.asset(
                'assets/images/Chasseur.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  'Le chasseur, s’il se fait égorger par les Loups-Garous ou lyncher par les joueurs, a le pouvoir de répliquer en tuant immédiatement n’importe quel autre joueur.'),
              SizedBox(
                height: 20,
              ),
              Text(
                '-Cupidon-',
                style: TextStyle(fontSize: 25),
              ),
              Image.asset(
                'assets/images/cupidon.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  """La première nuit, il désigne 2 joueurs qui seront follement Amoureux l’un de l’autre. Si l’un d’eux meurt, l’autre meurt de chagrin immédiatement. Un Loup-Garou et un villageois peuvent être Amoureux l'un de l'autre. Ils jouent alors contre tous les autres, Loups-Garous et Villageois.Si les amoureux survivent, alors ce sont eux qui gagnentLe cupidon peut se désigner lui-même comme un des 2 Amoureux."""),
              SizedBox(
                height: 20,
              ),
              Text(
                '-Sorcière-',
                style: TextStyle(fontSize: 25),
              ),
              Image.asset(
                'assets/images/Sorcière.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text("""Elle sait concocter 2 potions extrêmement puissantes :
une potion de guérison, pour ressusciter le joueur tué par les Loups-Garous,
une potion d’empoisonnement, utilisée la nuit pour éliminer un joueur.
La Sorcière doit utiliser chaque potion 1 seule fois dans la partie. Elle peut se servir des ses 2 potions la même nuit. Le matin suivant l’usage de ce pouvoir, il pourra donc y avoir soit 0 mort, 1 mort ou 2 morts. La sorcière peut utiliser les potions à son profit, et donc se guérir elle-même."""),
              SizedBox(
                height: 20,
              ),
              Text(
                '-Salvateur-',
                style: TextStyle(fontSize: 25),
              ),
              Image.asset(
                'assets/images/salva.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  """Le salvateur se réveille chaque nuit avant les loups-garous, et désigne au meneur de jeu un joueur qu'il protégera. Si ce joueur est la victime désignée par les loups-garous cette nuit, il survit à leur assaut. Il ne peut pas protéger la même personne deux tours de suite, mais il peut se protéger lui-même. La protection du Salvateur n'a aucune efficacité sur la victime de la sorcière et ne peut empêcher un amoureux de mourir de chagrin. S'il sauve la personne dévorée par les loups, la sorcière ne connaît pas la victime. C'est donc un rôle qui doit aller de pair avec la sorcière pour un maximum d'efficacité."""),
              SizedBox(
                height: 20,
              ),
              Text(
                '-Idiot du village-',
                style: TextStyle(fontSize: 25),
              ),
              Image.asset(
                'assets/images/sv.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  """Il n'a pas de pouvoir étant vivant. S'il est lynché par les villageois, ceux-ci le gracient immédiatement. Par la suite, l'idiot du village reste en vie, mais ne peut plus voter ni être élu capitaine du village. S'il assumait ce rôle, le capitaine est supprimé jusqu'à la fin de la partie. À l'inverse du vote des villageois, la potion de la sorcière, le tir du chasseur ou les loups-garous le tuent sans le gracier. L'utilité de ce rôle est souvent questionnée par des joueurs moins portés sur le côté analytique du jeu. En fait, l'avantage d'être gracié est d'obtenir, au prix de son droit de vote, la confiance de tous, qui savent désormais qu'il n'est pas un loup. De plus, même s'il ne peut plus voter, il a toujours le droit de communiquer avec les autres villageois et de les encourager à tuer un personnage. S'il est amoureux et est désigné par le village son couple reste en vie!"""),
              SizedBox(
                height: 20,
              ),
              Text(
                '-Capitaine-',
                style: TextStyle(fontSize: 25),
              ),
              Image.asset(
                'assets/images/capitaine.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  'Cette carte est confiée à un des joueurs, en plus de sa carte personnage. Le Capitaine est élu par vote, à la majorité relative. On ne peut refuser l’honneur d’être capitaine.Dorénavant, les votes de ce joueur comptent pour 2 voix. Si ce joueur se fait éliminer, dans son dernier souffle il désigne son successeur.'),
              SizedBox(
                height: 20,
              ),
              Text(
                """-L'ancien-""",
                style: TextStyle(fontSize: 25),
              ),
              Image.asset(
                'assets/images/Ancien.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  """La première fois que les loups-garous le dévorent, sa carte n'est alors pas retournée par le meneur, mais par la seconde fois. Attention ! Le tir du chasseur, le vote du village et la potion de la sorcière le tuent instantanément. Si l'ancien est la victime du vote du village, de la potion d'empoisonnement de la sorcière ou du tir du chasseur, il meurt et tous les villageois perdent leurs pouvoirs (le joueur de flûte et les loups-garous ne sont pas des villageois)."""),
              SizedBox(
                height: 20,
              ),
              Text(
                '-Le joueur de flûte-',
                style: TextStyle(fontSize: 25),
              ),
              Image.asset(
                'assets/images/Joueur de Flute.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  """Ennemi à la fois des villageois et des loups-garous, le joueur de flûte se réveille à la fin de chaque nuit et choisit chaque fois deux nouveaux joueurs qu'il va charmer. Puis, il se rendort et le meneur de jeu réveille tous les joueurs charmés (anciens et nouveaux) pour qu'ils se reconnaissent. Les joueurs charmés continuent à jouer normalement (quel que soit leur rôle), mais si, à n'importe quel moment, le joueur de flûte est en vie et tous les autres joueurs vivants sont charmés, le joueur de flûte gagne immédiatement, seul. Selon les variantes, sa victoire peut ne pas arrêter la partie pour les autres joueurs ou la terminer instantanément.

Si le joueur de flûte est en couple, il devra charmer tout le monde sauf lui et son amoureux.

Si le joueur de flûte est infecté (cf rubrique infect père des loups), son objectif change et il devra alors gagner avec les loups-garous."""),
              SizedBox(
                height: 20,
              ),
              Text(
                '-Le barbier-',
                style: TextStyle(fontSize: 25),
              ),
              Image.asset(
                'assets/images/barbier.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  """Peut (à tout moment de la journée) éliminer un joueur de son choix (sauf les vagabonds). Si le joueur éliminé est un Loup-garou, il survit à son acte. Sinon, il est immédiatement éliminé. Il ne peut utiliser son pouvoir qu’une fois lors de la partie."""),
              SizedBox(
                height: 20,
              ),
              Text(
                '-Le corbeau-',
                style: TextStyle(fontSize: 25),
              ),
              Image.asset(
                'assets/images/Corbeau.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  """Il se réveille en dernier toutes les nuits et peut désigner au maître du jeu un joueur qu'il pense être le loup-garou. Ce joueur aura automatiquement deux voix contre lui pour le prochain vote. Le corbeau est donc un personnage important car comme il est avec les villageois, il montre logiquement une personne qu'il pense être le loup-garou, et donc ne bluffe pas."""),
              SizedBox(
                height: 20,
              ),
              Text(
                '-Le pyromane-',
                style: TextStyle(fontSize: 25),
              ),
              Image.asset(
                'assets/images/pyro.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  """Il est dans le camp des villageois et se réveille avant les loups-garous. Il peut une fois par partie brûler un bâtiment qui sera retiré définitivement du jeu, son occupant devient alors vagabond. Si le bâtiment choisi est celui de la victime des loups-garous, il ne meurt pas ; par contre, le premier loup-garou à droite de la victime est éliminé."""),
              SizedBox(
                height: 20,
              ),
              Text(
                '-Enfant sauvage-',
                style: TextStyle(fontSize: 25),
              ),
              Image.asset(
                'assets/images/enfant sauvage.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  """L'enfant sauvage choisit un joueur au début de la partie qui devient son modèle. Si le modèle meurt, l'enfant sauvage devient un loup-garou."""),
              SizedBox(
                height: 20,
              ),
              Text(
                '-Renard-',
                style: TextStyle(fontSize: 25),
              ),
              Image.asset(
                'assets/images/renard.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  """La nuit, à l'appel du meneur, il désigne trois joueurs voisins. Si au moins un de ces joueurs est loup-garou, le renard peut recommencer plus tard. (N'est pas obligé de le faire chaque nuit). Par contre, si ce sont trois non loups-garous, il perd son pouvoir définitivement en innocentant trois personnes."""),
              SizedBox(
                height: 20,
              ),
              Text(
                '-Servante-',
                style: TextStyle(fontSize: 25),
              ),
              Image.asset(
                'assets/images/servante.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  """La servante dévouée "se sacrifie" à la place d'un autre joueur choisi durant le vote (ou plus exactement change de rôle sans disparaître du jeu). Le joueur qui joue la servante échange la carte de la servante avec la carte du personnage qui vient d'être désigné comme mise à mort par le village (sans la révéler au village). Le joueur qui joue la servante joue maintenant cette carte, tandis que le joueur désigné à l'origine est bel et bien éliminé... mais avec la carte de la servante. De plus, le pouvoir de la carte échangée est "réinitialisé". En bref, la servante peut voler la carte d'un joueur mis à mort et donc prendre son pouvoir. Néanmoins, quand la servante est en couple, elle ne peut utiliser son pouvoir, l'amour étant plus fort que sa volonté de changer de rôle. Le meneur de jeu doit tout de même demander à la servante si elle souhaite échanger sa carte pour maintenir l'illusion."""),
              SizedBox(
                height: 20,
              ),
              Text(
                '-Trois frères-',
                style: TextStyle(fontSize: 25),
              ),
              Image.asset(
                'assets/images/frere.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  """Les 3 frères durant toutes les nuits, après les loups garous, se réveillent ensemble et décident ce qu'ils vont faire pendant le jour, donc pour qui ils vont voter. Ce sont, sinon, de simples villageois. Ces cartes sont utiles dans les grands groupes de joueurs, puisque cela crée des sous-groupes de villageois qui se connaissent. Certains meneurs de jeu autorisent les 3 frères à communiquer avec des mots, mais c'est moins sûr."""),
              SizedBox(
                height: 20,
              ),
              Text(
                '-Deux sœurs-',
                style: TextStyle(fontSize: 25),
              ),
              Image.asset(
                'assets/images/soeur.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  """Les 2 sœurs durant toutes les nuits, après les loups garous, se réveillent ensemble et décident ce qu'ils vont faire pendant le jour, donc pour qui ils vont voter. Ce sont, sinon, de simples villageois. Ces cartes sont utiles dans les grands groupes de joueurs, puisque cela crée des sous-groupes de villageois qui se connaissent. Certains meneurs de jeu autorisent les 2 sœurs à communiquer avec des mots, mais c'est moins sûr."""),
              SizedBox(
                height: 20,
              ),
              Text(
                """-L'ours-""",
                style: TextStyle(fontSize: 25),
              ),
              Image.asset(
                'assets/images/Ours.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  """Le matin, si l'ours se trouve à côté d'un loup garou, l'ours (le meneur de jeu) grogne indiquant au montreur d'ours qu'à sa droite ou sa gauche se trouve un loup garou. Si le montreur d'ours a lui-même été infecté par l'infect père des loups (cf rubrique infect père des loups), alors l'ours grognera à tous les tours."""),
              SizedBox(
                height: 20,
              ),
              Text(
                """-Le chevalier à l'épée rouillée-""",
                style: TextStyle(fontSize: 25),
              ),
              Image.asset(
                'assets/images/Chevalier.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  """Le chevalier à l'épée rouillée donne le tétanos au premier loup à sa gauche (qui était présent lors du vote des loups) s'il est mangé par les loups durant la nuit. Ce loup-garou mourra la nuit d'après, sans manger, innocentant au passage toutes les personnes entre lui et le chevalier."""),
              SizedBox(
                height: 20,
              ),
              Text(
                '-Ange-',
                style: TextStyle(fontSize: 25),
              ),
              Image.asset(
                'assets/images/ange.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  """Le but de l'ange est de se faire éliminer dès le premier vote. S'il réussit, la partie se termine et il a gagné. Dans le cas contraire, le jeu continue mais l'ange devient un simple villageois sans pouvoir. Cela permet de rendre plus intéressant le premier vote en mettant fin à l'habitude qu'ont certains joueurs à vouloir éliminer les moins bons dès le début. Grâce à ce personnage, les joueurs vont devoir choisir le premier lynché avec plus de parcimonie, de peur de perdre en condamnant l'ange."""),
              SizedBox(
                height: 20,
              ),
              Text(
                '-Infect père des loups-',
                style: TextStyle(fontSize: 25),
              ),
              Image.asset(
                'assets/images/Infecte pere.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  """C'est un loup-garou qui se réunit avec ses amis loups-garous et une fois dans la partie, il peut choisir d'infecter la victime des loups-garous et la transformer en loup mais l'infecté garde les pouvoirs de sa carte initiale et conserve son rôle initial. L'infecté pourra être détecté seulement par le montreur d'ours, le flair du renard ou la petite fille. Il garde sa carte de base donc la voyante ne pourra jamais savoir que c'est un loup-garou. En créant un loup-garou en cours de partie, l'infect père des loups vient semer la confusion chez les villageois et apporte un stimulant au jeu.

si le joueur de flute est infecté, son but est maintenant de gagner avec les loups garous et non charmer tout le monde ;
si l'ancien est infecté la première fois, l'infection ne marche pas ;
si le montreur d'ours est infecté, le meneur grognera à tous les tours."""),
              SizedBox(
                height: 20,
              ),
              Text(
                '-Chien-loup-',
                style: TextStyle(fontSize: 25),
              ),
              Image.asset(
                'assets/images/Chien-loup.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  """Personnage qui à l'appel du meneur de jeu choisit entre loup-garou et villageois. S'il choisit la première, il devient loup-garou. Sinon, il reste villageois. Il est conseillé pour le meneur de jeu de le considérer comme un loup-garou dans le choix des cartes car les joueurs préfèrent en général être loup-garou à villageois. On ne sait pas son choix lors de sa mort. Donc on ne peut jamais savoir s'il était devenu loup-garou ou non (à part les loups-garous eux-mêmes). Une variante est de faire dépendre la possibilité de son choix du hasard (pièce de monnaie, dés) à chaque tour. À chaque début de nuit, le meneur de jeu peut par exemple tirer les dés ou lancer une pièce. Si cela tombe sur le(s) bon(s) nombre(s) ou la bonne face, le chien-loup peut opérer son choix. Dans cette variante, le chien-loup devra donc attendre les tours pour faire son choix. Cela évite qu'il choisisse dès le départ de devenir loup-garou, vidant par là le rôle de chien-loup de tout intérêt. En étant un loup-garou à retardement, le chien-loup vient semer la confusion chez les villageois et apporte un stimulant au jeu. Une seconde variante offre une autre palette de choix au chien-loup : celui de devenir loup-garou ou celui d'aider le chasseur. Dans cette seconde variante, si le chien-loup choisit cette seconde option, alors il rejoint le camp des villageois. Le chasseur devra alors impérativement prendre en compte son avis lorsqu'il fera usage de son pouvoir et il ne peut bien sûr tuer le chien-loup. Afin d'éviter de révéler le choix opéré par le chien-loup, le meneur de jeu tapera sur l'épaule du chasseur pour qu'il reconnaisse le chien-loup lorsque celui-ci décide de se mettre à son service. Si le chasseur est tué la nuit et si le chien-loup et le chasseur sont en désaccord sur la personne à éliminer, il convient de réveiller le capitaine qui tranchera. Tout se fait en silence la nuit et le meneur de jeu ne doit pas révéler aux autres joueurs que le chien-loup est impliqué dans la décision du chasseur. Si le chasseur est tué de jour par le vote du village, alors le chien-loup pourra tenter de ne pas révéler son identité mais ça lui sera difficile. Si les deux sont en désaccord et que le capitaine intervient, il trahit son rôle. Au chien-loup alors de juger ce qu'il préfère faire : trahir son rôle ou tenter de tuer celui qu'il pense être un loup-garou."""),
              SizedBox(
                height: 20,
              ),
              Text(
                '-Grand méchant loup-',
                style: TextStyle(fontSize: 25),
              ),
              Image.asset(
                'assets/images/Grand Méchant Loup.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  """Le grand méchant loup mange dans un premier temps avec les loups-garous, puis il mange une deuxième fois seul un villageois mais il ne peut manger une deuxième victime que si aucun loup-garou n'est mort avant cette nuit (chien/loup et enfant sauvage compris). Son rôle est plus apprécié dans les parties avec beaucoup de joueurs. En effet, avec peu de joueurs, la partie risque de rapidement se terminer avec deux victimes en une nuit. Dans les parties avec beaucoup de joueurs et donc de nombreux loups-garous, il pourra aussi jouer le rôle de chef de meute en cas de désaccord entre loups-garous sur la victime. Dans ce cas, il a des pouvoirs analogues au capitaine du village dans la décision des loups-garous la nuit: son vote compte double et en cas d'égalité c'est à lui de trancher."""),
              SizedBox(
                height: 20,
              ),
              Text(
                '-Juge-',
                style: TextStyle(fontSize: 25),
              ),
              Image.asset(
                'assets/images/juge.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  """Le juge bègue montre, la nuit, au meneur, un signe particulier. Si, lors d'un vote de village, il fait ce signe au meneur, le meneur lancera alors un deuxième vote après la mort du premier voté. Il doit choisir un signe discret pour ne pas se faire remarquer par les loups-garous. Tout comme le rôle du grand méchant loup, le rôle du juge bègue est plus apprécié dans les parties avec beaucoup de joueurs. En effet, avec peu de joueurs, la partie risque de rapidement se terminer avec deux victimes en une journée (puisque le village effectue deux votes)."""),
              SizedBox(
                height: 20,
              ),
              Text(
                '-Loups-Garous-',
                style: TextStyle(fontSize: 25),
              ),
              Image.asset(
                'assets/images/Loup-Garou.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  """Ils se réveillent chaque nuit pour éliminer un villageois. Le jour, Possibilité d'éliminer le loup Garou infecté par eux même, ils participent aux débats en essayant de ne pas faire découvrir leur activité nocturne. Ils ont le droit de voter comme tous les autres joueurs (car personne ne sait qui ils sont), et éventuellement contre un des leurs par nécessité.

Leur but est de tuer tous les autres villageois."""),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
