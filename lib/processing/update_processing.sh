# This build processing and copy its libs files
# to your project folder.

# 1. Clone https://github.com/processing/
# 2. Defines location variables
# 3. Choose your Processing version
# 4. Run this script


# ################
# DEFINE VARIABLES
# ################

#  Location variables
GIT_DIR="/my/git/clone/folder"
PROJECT_DIR="/my/project/folder"
P5_DIR="${PROJECT_DIR}/lib/processing"

#  Github tag
P5_VERSION="processing-0227-2.2.1"


# ##################
# Clear screen
# ##################

clear

# ##################
# UPDATE FROM Github
# ##################

cd "$GIT_DIR"
git remote -v update
git checkout tags/$P5_VERSION
git remote -v update


# #####################################
# BUILD USING ANT (core.jar, video.jar)
# #####################################

cd "${PROJECT_DIR}/lib/processing/"
ant -f $GIT_DIR/core/build.xml clean build
ant -f $GIT_DIR/java/libraries/video/build.xml clean build
ant -f $GIT_DIR/java/libraries/net/build.xml clean build


# #####################
# COPY FILES TO PROJECT
# #####################

# COPY CORE JARs
cd "${GIT_DIR}/core/library/"
cp *.jar "${PROJECT_DIR}/lib/processing/"

# COPY LIBS JARs
cd "${GIT_DIR}/java/libraries/"
cp minim/library/minim.jar "${P5_DIR}/minim.jar"
# cp opengl/library/opengl.jar opengl.jar
cp video/library/video.jar "${P5_DIR}/video.jar"
cp net/library/net.jar "${P5_DIR}/net.jar"
cp video/library/gstreamer-java.jar "${P5_DIR}/gstreamer-java.jar"
cp video/library/jna.jar "${P5_DIR}/jna.jar"
cp minim/library/jl1.0.jar "${P5_DIR}/jl1.0.jar"
cp minim/library/jsminim.jar "${P5_DIR}/jsminim.jar"
cp minim/library/minim.jar "${P5_DIR}/minim.jar"
cp minim/library/mp3spi1.9.4.jar "${P5_DIR}/mp3spi1.9.4.jar"
cp minim/library/tritonus_aos.jar "${P5_DIR}/tritonus_aos.jar"
cp minim/library/tritonus_share.jar "${P5_DIR}/tritonus_share.jar"
cp -r video/library/macosx32* "${P5_DIR}/macosx32"
cp -r video/library/macosx64* "${P5_DIR}/macosx64"
cp -r video/library/windows32* "${P5_DIR}/windows32"
cp -r video/library/windows64* "${P5_DIR}/windows64"


# ###############
# CREATE SRC ZIPs
# ###############

cd "$GIT_DIR/core/"
zip -R "${P5_DIR}/core_src.zip" "*.java"
cd "$GIT_DIR/java/libraries/video/"
zip -R "${P5_DIR}/video_src.zip" "*.java"

