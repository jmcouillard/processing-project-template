processing-project-template
===========================

Custom project template and build Ant file. Tested with Processing 2.0.3.


## Requirements

- Have a Java JDK 7 installed. You may install it from [here](http://www.oracle.com/technetwork/java/javase/downloads/index.html?ssSourceSiteId=ocomen).

## Step 1 : Get a copy of the template

There are two ways to get a copy of the template. You may want to download it as a zip file :

[https://github.com/jmcouillard/processing-project-template/archive/master.zip](https://github.com/jmcouillard/processing-project-template/archive/master.zip)

Or, using the Terminal, clone the template repository to a folder of your choice.

```
git clone https://github.com/jmcouillard/processing-project-template.git
```


## Step 2 : Create a compatible Eclipse project

1. Copy and rename `processing-project-template` folder in your Eclipse *workspace*.
2. Import the copied folder in Eclipse. To do so, right-click inside the package explorer, then click on **Import->Existing Projects into Workspace**.
3. Copy the libraries as explained in the next part.


## Step 3 : Copy libraries (.jar)

You will also need to fill up the `lib` folder.

**THIS SECTION NEED TO BE UPDATED : A SCRIPT NOW DO THIS JOB FOR YOU**

1. Copy all the required **Processing** libraries (.jar, .dll, .jnilib, etc.) into the `lib/processing` folder. Take a look at the [README](https://github.com/jmcouillard/processing-project-template/tree/master/lib/processing) in the folder for more information. You can find the main libraries that you need to copy in `Processing.app/Contents/Java/core/library` (on OSX). 
2. Copy all the required **contributed** libraries into the `lib` folder. Once again, take a look at the [README](https://github.com/jmcouillard/processing-project-template/tree/master/lib) in the folder for more information.
3. In you eclipse workspace, link these .jar to the project by right-clicking on the .jar, and then **Build Path->Add to build path**


## Step 4 : Code!

Start your coding in `src/com/MyProject.java`.


## Optional : Bundle your app in an executable file

You may also bundle you app in an executable file if you wish so. More details here.

[https://github.com/jmcouillard/processing-project-template/blob/master/BUILD.md](https://github.com/jmcouillard/processing-project-template/blob/master/BUILD.md)


## Optional : Using SimpleOpenNI ?

You will have a hard time configuring this build file with SimpleOpenNI on OSX because of that weird function getLibraryPathLinux() that it is used in SimpleOpenNI.java. To make it work:

1. Delete al related file from the build.
2. Recopy manually the folder named `SimpleOpenNi` into lib folder.
3. This should allow your application to find `SimpleOpenNi` library.


## Acknowledgement

Build file is based on the work of ste.fielder[near]gmail.com.

