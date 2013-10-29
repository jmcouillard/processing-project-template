processing-project-template
===========================

Custom project template and build ant file.

# Step 1 : Create a project reflecting the template

### Get a copy of the template

There are two ways to get a copy of the template. You may want to download it as a zip file :

[https://github.com/jmcouillard/processing-project-template/archive/master.zip](https://github.com/jmcouillard/processing-project-template/archive/master.zip)

Or, using the Terminal, clone the template repository to a folder of your choice.

```
git clone https://github.com/jmcouillard/processing-project-template.git

```

### Create a compatible Eclipse project

If you want to create a new, empty project :

1. Copier et renommer le dossier `processing-project-template` dans votre *workspace*.
2. Importer le nouveau dossier dans Eclipse en tant que nouveau projet.
3. Commencer à coder dans `src/com/MyProject.java`.

If the project already exists, and you want to use the build file :

1. Renommer les dossiers pour qu'ils reflète les indications de `processing-project-template` dans votre *workspace*.
2. S'assurer que le projet est toujours fonctionnel. Si ce n'est pas le cas, reviser le Build Path.


# Step 2 : Edit properties file

Edit `resources/build.properties` with your favorite text editor, and modify properties to reflect your project.

- **project.author** : you full name (human-redable)
- **project.author.appleId** : s'applique seulement si vou avez un id developpeur (otherwise, write 'xxx')
- **project.name** : ptoject name (machine-readable, without space or special caracters)
- **project.version** : two-parts version (1.0)
- **project.fullversion** : four-parts version (1.0.0.0)
- **main.class** : your project main class (without package)
- **main.package.name** : your project main class package (with trailing dot)
- **main.package.path** : your project main class package (with trailing slash)

And then, OSX specific variables :

- **jvm.version** : java version to use (ex: 1.6+)
- **jvm.xms** : minimum memory to allocate (ex: 1024)
- **jvm.xmx** : maximum memory to allocate (ex: 2048)
- **osx.devtools** : path to xcode tools which are used to create the .dmg fule (ex:/Developer)
- **osx.dmgcopy** : true or false, depending on wheter you want or not a .dmg
- **osx.presentmode** : 0 or 1
- **osx.safeposition** : true or false

And then, Windows specific variables :

- **jvm.version.min** : minimum JVM version to allow (ex: 1.6.0)
- **jvm.version.max** : maximum JVM version to allow (ex: 1.6.9)

# Step 3 : Launch4j (pour déploiement sur windows)

Launch4j est utilisé pour créer un exe à partir de n'importe quel plate-forme, y compris OSX. Si vous ne souhaitez pas créer un fichier exe pour Windows, sautez cette étape.

### Clone repository

Télécharger le repository, et changer de branch pour le Release 3.0.2

```
git clone git://git.code.sf.net/p/launch4j/git launch4j-git
git checkout Release_launch4j-3_0_2

```


### Build

Dans le dossier du repository, exécuter le code suivant pour créer un fichier jar utilisable dans Eclipse.


```
ant clean jar

```


### OSX only : Update binaries

D'abord aller dans le dossier bin de launch4j :

```
cd launch4j-git/bin

```

Ensuite, télécharger la plus récente version des binutils, disponible au [http://www.gnu.org/software/binutils/](http://www.gnu.org/software/binutils/). Ensuite, il faut exécuter la commande *make* pour créer les fichier binaires.

```
wget http://ftp.gnu.org/gnu/binutils/binutils-2.23.2.tar.gz
tar zxf binutils-2.23.2.tar.gz
cd binutils-2.23.2
./configure --target=i686-pc-mingw32
make
```

Finalement, copier les fichiers `binutils/windres` et `ld/ld-new` dans le dossier bin de *launch4j* (il faut renommer `ld-new` en `ld`). 


### Utiliser dans Eclipse (this is already included in the build.xml file)

Copy launch config file to application (to avoid Cannot run program "./bin/windres" error) 

```
<copy file="resources/launch4jconfig.xml" todir="${launch4j.dir}" overwrite="true" />
<copy file="resources/icon.ico" todir="${launch4j.dir}" overwrite="true"  />
						
```

Définir la tâche *launch4j* et l'exécuter.

```
<taskdef name="launch4j" classname="net.sf.launch4j.ant.Launch4jTask" classpath="${launch4j.dir}/launch4j.jar:${launch4j.dir}/lib/xstream.jar" />

<launch4j configFile="${launch4j.dir}/launch4jconfig.xml" />
```


# Step 4 : Build

In Eclipse, open *Ant* window and drag `build.xml`. Click on the arrow to expand the possible build list.

1. **deploy multi-plateform JAR** : copie de tous les fichiers pour macosx et windows en 32 et 64 bits. L'application peut-être lancée par un .bat ou un .sh selon la plate-forme.
2. **deploy OSX** : wrap application in a macosx application (.app).
3. **deploy WIN** : wrap application in a windows appplication (using *launch4j*).

Double-click on wanted build. If errors occur, they will be listed in the Eclipse's console.

Applications will be created in `/release` folder.



