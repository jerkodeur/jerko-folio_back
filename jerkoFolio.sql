-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: jerkoFolio
-- ------------------------------------------------------
-- Server version	5.7.31-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET latin1 NOT NULL,
  `description` longtext CHARACTER SET latin1 NOT NULL,
  `url_github` varchar(155) CHARACTER SET latin1 DEFAULT NULL,
  `url_test` varchar(155) CHARACTER SET latin1 DEFAULT NULL,
  `image` varchar(55) CHARACTER SET latin1 NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`title`),
  UNIQUE KEY `url_UNIQUE` (`url_github`),
  UNIQUE KEY `url_test_UNIQUE` (`url_test`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (5,'HowToBeFat','### Description\nLe but de cette application est de permettre aux personnes qui n\'arrivent pas à grossir d\'obtenir des conseils coaching, des recettes bien caloriques et des bières pour accompagner leurs repas !\nLe tout dans une ambiance fun et gourmande !   \n\nVenez tester !!! \n\n### Contexte\nDeuxième projet fictif réalisé à la [Wild Code School](https://www.wildcodeschool.com/fr-FR)\nProjet en __full React__ conçu par une équipe de 4 developpeurs en apprentissage et pendant une durée de 4 semaines.\n\nCelui-ci à été mené entièrement à distance du fait du Covid19, en suivant le concept __Scrum__ et la __méthodologie agile__.\nAu départ du projet, nous n\'avions pas encore appris à utiliser React, c\'est donc en partant de zéro que nous nous sommes lancés dans la réalisation de cette application.\n\n### Fonctionnalités\n- Une recette aléatoire vous est proposé chaque jour, accompagnée de sa bière et de son conseil coaching\n- Faites une recherche personnalisée de recettes, sélectionnez vos ingrédients, régimes spéciaux, définissez un nombre de calorie minimal et/ou un temps de préparation à ne pas dépasser\n- Recherchez votre bière selon un nombre de degré d\'alcool minimum\n- Définissez-vous un objectif de poids à atteindre grâce à notre calculateur de poids\n\n### Caractéristiques techniques\n- L\'application a été pensé responsive, en mode __mobile first__ comme il est vivement conseillé de le faire.\n- Afin de fournir les informations nécessaires, nous avons fait appel à 2 API, une pour l\'affichage des recettes de cuisine, et l\'autre pour les bières.\n- Utilisation de prop-types, des hooks, et de la syntaxe ECMAScript 6 de javascript.\n\n### Limitations\nL\'api de cuisine est limitée en nombre de requêtes, il est donc possible que notre mascotte soit déboussolé, si cela devait vous arriver, attendez quelques instants, et rafraichissez la page.','https://github.com/jerkodeur/howToBeFat','https://how-to-be-fat.netlify.app/','howtobefat.png','2020-05-01'),(6,'DrakeRporter','\n### Le premier projet réalisé en équipe à la Wild Code School\n\nLe thème du projet était de construire un site __HTML/CSS__ ayant au minimum une galerie photo.  \nLe choix du théme était libre, la durée du projet d\'une semaine.  \nMes joyeux camarades et moi, avons facilement décidé d\'un thème... Un bien bizarre personnage ci-nommé R.Drake Porter...  \nCes goûts sont pour le moins \"étranges\" ; mais tout ceci n\'est en fin de compte qu\'une mascarde et cache un coté bien plus sombre de notre personnage !  \n\nLa page d\'accueil est en fait un leurre qui cache la véritable nature de celui qui, au final, se révèlera être Dark Reporter, parti silloner le monde afin de proposer tout un tas de produits bien peu recommandables et illicites..\n\n### Un petit indice pour entrer du coté obscur du site...  \n    \n>Trouver et cliquer sur le copyright ...\n>Sur la page intermédiaire, n\'importe quel mot de passe est accepté mais il va falloir appuyer sur un bouton pour rentrer!','https://github.com/jerkodeur/DrakeRporter','https://jerkodeur.github.io/DrakeRporter/','darkrporter.png','2020-03-01'),(7,'Whack-a-virus','### Premier __hackaton__ de ma vie de Dev. \n Projet réalisé à la [wild Code School](https://www.wildcodeschool.com/fr-FR).  \nUn groupe de 8 devs en formation, __24h de code__ et un projet finalement assez abouti !  \nUn virus ravage notre planète depuis des années maintenant !   \nIl est tant de lutter et de combattre afin d\'enrayer le mal qu\'il engendre ... ','https://github.com/jerkodeur/whack-a-virus','https://condescending-hypatia-22b592.netlify.app/','whackavirus.jpeg','2020-04-01'),(9,'Checkpoint 2','### Description\nRendu de mon 2ème checkpoint afin d\'évaluer les compétences apprises en __React__ à la [wildCodeSchool](https://www.wildcodeschool.com/fr-FR).  \n### Fiche technique\n#### Les instructions suivantes devaient être respectées:  \n- __Consommer une api__ sur le thème des jeux vidéos,\n- Afficher une liste des jeux, avec différentes informations\n- Créer un bouton pour supprimer un fichier de la liste contenue dans le state.\n- Filtrer les jeux vidéos par rating ( optionnel )\n### Technos utilisées:\n- React hooks, routes, prop-types\n- ECMAScript6\n- CSS Grid\n### Particularités:\n- Le site est __responsive__','https://github.com/jerkodeur/CheckPoint2-WCS-React','https://loving-booth-82aa55.netlify.app/','checkpoint2.png','2020-04-01');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_techno`
--

DROP TABLE IF EXISTS `project_techno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_techno` (
  `project_id` int(11) NOT NULL,
  `techno_id` int(11) NOT NULL,
  KEY `fk_project_techno_1_idx` (`project_id`),
  KEY `fk_project_techno_2_idx` (`techno_id`),
  CONSTRAINT `fk_project_techno_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_project_techno_2` FOREIGN KEY (`techno_id`) REFERENCES `techno` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_techno`
--

LOCK TABLES `project_techno` WRITE;
/*!40000 ALTER TABLE `project_techno` DISABLE KEYS */;
INSERT INTO `project_techno` VALUES (5,1),(5,2),(5,3),(5,6),(6,1),(6,2),(7,1),(7,2),(7,3),(7,6),(9,7),(9,6),(9,3),(9,2),(9,1);
/*!40000 ALTER TABLE `project_techno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techno`
--

DROP TABLE IF EXISTS `techno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `techno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `image_name` varchar(55) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `image_UNIQUE` (`image_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techno`
--

LOCK TABLES `techno` WRITE;
/*!40000 ALTER TABLE `techno` DISABLE KEYS */;
INSERT INTO `techno` VALUES (1,'HTML','html.png'),(2,'CSS','css.png'),(3,'JavaScript','js.png'),(4,'NodeJs','node.png'),(5,'Mysql','mysql.png'),(6,'React','react.png'),(7,'Grid','grid.png');
/*!40000 ALTER TABLE `techno` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-31 15:21:22
