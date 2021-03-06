Bundle your app in an executable file
===========================

Here is how to create an .exe or .app file from your code.

The following procedure has been written for OSX users.

## Requirements

- Little terminal knowledge
- Minimal git knowledge
- XCode developer command-line tools ([more info here](http://osxdaily.com/2012/05/22/install-wget-mac-os-x/))

## Step 1 : Prepare the build properties file

Edit `resources/build.properties` with your favorite text editor, and modify properties to reflect your project.

- **project.author** : you full name (human-redable)
- **project.author.appleId** : apply only if you have a developper ID (otherwise, write 'xxx')
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
- **lauch4j.path** : the absolute path where you installed launch4j (see *launch4j* step)


## Step 2 : Build

In Eclipse, open *Ant* window and drag `build.xml` inside the *Ant* window. Click on the arrow to expand the possible build list.

1. **deploy multi-plateform JAR** : copie de tous les fichiers pour macosx et windows en 32 et 64 bits. L'application peut-être lancée par un .bat ou un .sh selon la plate-forme.
2. **deploy OSX** : wrap application in a macosx application (.app).
3. **deploy WIN** : wrap application in a windows appplication (using *launch4j*, see next step).

Double-click on wanted build. If errors occur, they will be listed in the Eclipse's console.

Applications will be created in `/release` folder.


## Optional : Launch4j to bundle windows executable

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

Télécharger la plus récente version des binutils, disponible au [http://www.gnu.org/software/binutils/](http://www.gnu.org/software/binutils/). Ensuite, il faut exécuter la commande *make* pour créer les fichier binaires.

```
wget http://ftp.gnu.org/gnu/binutils/binutils-2.23.2.tar.gz
tar zxf binutils-2.23.2.tar.gz
cd binutils-2.23.2
./configure --target=i686-pc-mingw32
make
```

Finalement, copier les fichiers `binutils/windres` et `ld/ld-new` dans le dossier bin de *launch4j* (il faut renommer `ld-new` en `ld`). 
