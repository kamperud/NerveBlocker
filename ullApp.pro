TEMPLATE = app

QT += qml quick widgets svg core gui multimedia

CONFIG += c++11

SOURCES += main.cpp \
    gamehandler.cpp \
    task.cpp \
    game.cpp \
    question.cpp \
    ultrasoundimage.cpp \
    organ.cpp \
    mode.cpp \
    multimedia.cpp

RESOURCES += \
    qml/qml.qrc \
    images/images.qrc \
    fonts/fonts.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

OTHER_FILES += \
    android/AndroidManifest.xml \

HEADERS += \
    gamehandler.h \
    task.h \
    game.h \
    question.h \
    ultrasoundimage.h \
    organ.h \
    constants.h \
    mode.h \
    multimedia.h

macx:CONFIG += x86

## Facebook SDK framework
LIBS += -F/path/to/FacebookSDK -framework FacebookSDK
INCLUDEPATH += /path/to/QtFacebook
HEADERS += \
    /path/to/QtFacebook/qfacebook.h
SOURCES += \
    /path/to/QtFacebook/qfacebook.cpp
OBJECTIVE_SOURCES += \
    /path/to/QtFacebook/qfacebook_ios.mm
