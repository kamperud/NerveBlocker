TEMPLATE = app

QT += qml quick widgets svg

SOURCES += main.cpp \
    platformdetailes.cpp \
    gamehandler.cpp

RESOURCES += qml.qrc \
    images.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

OTHER_FILES += \
    android/AndroidManifest.xml \
    ios/images/back-50-3399FF.png

HEADERS += \
    platformdetailes.h \
    gamehandler.h
