import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import calamares.slideshow 1.0

Presentation
{
    id: presentation

    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: presentation.nextSlide()
    }

    Slide {
        anchors.fill: parent

        Rectangle {
            anchors.fill: parent
            color: "#1a0a2e"
        }

        Text {
            anchors.centerIn: parent
            text: "FlexOS Linux"
            font.pixelSize: 48
            font.bold: true
            color: "#ffffff"
        }

        Text {
            anchors.top: parent.verticalCenter
            anchors.topMargin: 60
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Glassmorphism Edition"
            font.pixelSize: 24
            color: "#7c4dff"
        }

        Text {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Beauté. Performance. Simplicité."
            font.pixelSize: 16
            color: "#888888"
        }
    }

    Slide {
        anchors.fill: parent

        Rectangle {
            anchors.fill: parent
            color: "#1a0a2e"
        }

        Text {
            anchors.centerIn: parent
            text: "Bureau XFCE\nThème Glassmorphism\nEffet verre dépoli"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 32
            color: "#ffffff"
            lineHeight: 1.5
        }

        Text {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Un environnement moderne et élégant"
            font.pixelSize: 16
            color: "#888888"
        }
    }

    Slide {
        anchors.fill: parent

        Rectangle {
            anchors.fill: parent
            color: "#1a0a2e"
        }

        Text {
            anchors.centerIn: parent
            text: "Applications pré-installées :\n\nFirefox · Alacritty · Thunar\nGParted · VLC · Geany\nEt bien plus..."
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 28
            color: "#ffffff"
            lineHeight: 1.6
        }

        Text {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Prêt à l'emploi dès le premier démarrage"
            font.pixelSize: 16
            color: "#888888"
        }
    }

    Slide {
        anchors.fill: parent

        Rectangle {
            anchors.fill: parent
            color: "#1a0a2e"
        }

        Text {
            anchors.centerIn: parent
            text: "Merci d'avoir choisi FlexOS !"
            font.pixelSize: 36
            font.bold: true
            color: "#ffffff"
        }

        Text {
            anchors.top: parent.verticalCenter
            anchors.topMargin: 60
            anchors.horizontalCenter: parent.horizontalCenter
            text: "L'installation va commencer..."
            font.pixelSize: 20
            color: "#7c4dff"
        }
    }
}
