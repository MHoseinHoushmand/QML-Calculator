import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.3
import my_calculator 1.0
Window {
    visible: true
    width: 420
    height: 520
    minimumHeight: 520
    maximumHeight: 520
    minimumWidth: 420
    maximumWidth: 420
    title: qsTr("Calculator")
    Calculator{
        id:my_calculator
    }



    Item {
        id: calculator
        height: 520
        anchors.fill: parent
        property bool is_input: false

        Image {
            id: dark_image
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            clip: false
            visible: true
            anchors.fill: parent
            fillMode: Image.Stretch
            source: "image/dark_background.jpg"



        }

        Image {
            id: light_image
            height: 520
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent
            fillMode: Image.Stretch
            source: "image/light_background.jpg"
            states: [
                State {
                    name: "light_theme"
                    when:switch_mode.position==0
                    PropertyChanges {
                        target: light_image
                        opacity:1
                    }
                },
                State {
                    name: "dark_theme"
                    when:switch_mode.position==1
                    PropertyChanges {
                        target:light_image
                        opacity:0

                    }
                }
            ]
            transitions: [
                Transition {
                    from: "light_theme"
                    to: "dark_theme"

                    NumberAnimation {
                        target: light_image
                        property: "opacity"
                        duration: 200
                        easing.type: Easing.InOutQuad
                    }

                },
                Transition {
                    from: "dark_theme"
                    to: "light_theme"
                    NumberAnimation {
                        target: light_image
                        property: "opacity"
                        duration: 200
                        easing.type: Easing.InOutQuad
                    }
                }
            ]




        }


        Item {
            id: main_page
            anchors.fill: parent


            Column {
                id: column_main
                spacing: 26
                anchors.rightMargin: 33
                anchors.topMargin: 50
                anchors.bottomMargin: 37
                anchors.leftMargin: 34
                anchors.fill: parent


                Rectangle {
                    id: output
                    width: 353
                    height: 65
                    color: "#f3f6ff"
                    radius: 18
                    opacity: 0.65
                    border.color: "#85a4f6"
                    border.width: 5

                    Text {
                        id: output_text
                        text: qsTr("0")
                        anchors.right: parent.right
                        anchors.rightMargin: 21
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.leftMargin: 21
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignRight
                        font.pixelSize: 37

                        NumberAnimation {
                            id:text_animation
                            target: output_text
                            property: "opacity"
                            from: 0
                            to:1
                            duration: 200
                            easing.type: Easing.InOutQuad
                        }
                    }
                }

                Row {
                    id: buttons_row
                    width: 353
                    height: 275
                    spacing: 10

                    Column {
                        id: column1
                        width: 80
                        height: 273
                        spacing: 13

                        Item {
                            id: clearbutt
                            width: 80
                            height: 44
                            opacity: 1

                            Rectangle {
                                id: rectangle_clear

                                radius: 14
                                opacity: 0.7
                                gradient: Gradient {
                                    GradientStop {
                                        id: gradient_clear
                                        position: 0
                                        color: "#fed7b5"
                                    }

                                    GradientStop {
                                        position: 1
                                        color: "#f98e68"
                                    }
                                }
                                border.color: "#ef2121"
                                anchors.fill: parent

                                Text {
                                    id: text_clear
                                    color: "#fd0606"
                                    text: "C"
                                    anchors.fill: parent
                                    fontSizeMode: Text.Fit
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pixelSize: 20
                                }

                                MouseArea {
                                    id: mouseArea_clear
                                    anchors.rightMargin: 0
                                    anchors.bottomMargin: 0
                                    anchors.leftMargin: 0
                                    anchors.topMargin: 0
                                    hoverEnabled: true
                                    anchors.fill: parent
                                    onHoveredChanged: containsMouse ? clearbutt.state = "State1clear" : clearbutt.state ="base state"
                                    onPressedChanged: pressed && containsMouse ? clearbutt.state= "State2clear" : clearbutt.state= "State1clear"
                                    onClicked:{
                                        output_text.text="0"
                                        buttdot.check=false
                                        my_calculator.set_new_num(true)
                                        my_calculator.set_output_result("0")
                                        my_calculator.set_last_sign("+")
                                        text_animation.start()
                                        calculator.is_input=false
                                        my_calculator.set_check_last_input(true);
                                        my_calculator.set_last_input("0.000000001")


                                    }
                                }

                            }

                            states: [
                                State {
                                    name: "State1clear"

                                    PropertyChanges {
                                        target: rectangle_clear
                                        height: 51
                                        border.color: "#ffa07b"
                                        border.width: 3
                                    }
                                },
                                State {
                                    name: "State2clear"

                                    PropertyChanges {
                                        target: gradient_clear
                                        color: "#ef2121"
                                    }
                                    //
                                    PropertyChanges {
                                        target: rectangle_clear
                                        color: "#ff4500"
                                    }

                                    PropertyChanges {
                                        target: text_clear
                                        color: "#8b4513"
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                }
                            ]
                        }
                        ////////////////////butt7
                        Item {
                            id: butt7
                            width: 80
                            height: 44

                            Rectangle {
                                id: rectangle_butt7
                                radius: 14
                                opacity: 0.7
                                gradient: Gradient {
                                    GradientStop {
                                        id: gradient_butt7
                                        position: 0
                                        color: "#ffffffff"
                                    }

                                    GradientStop {
                                        position: 1
                                        color: "#43e7de"
                                    }
                                }
                                border.color: "#38ed69"
                                anchors.fill: parent

                                Text {
                                    id: text_butt7
                                    text: "7"
                                    anchors.fill: parent
                                    fontSizeMode: Text.Fit
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pixelSize: 20
                                }

                                MouseArea {
                                    id: mouseArea_butt7
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onHoveredChanged: containsMouse ? butt7.state = "State1butt7" : butt7.state ="base state"
                                    onPressedChanged: pressed && containsMouse ? butt7.state= "State2butt7" : butt7.state= "State1butt7"
                                    onPressed : {
                                        text_animation.start()
                                        if(output_text.text!="Error!"){
                                            calculator.is_input=true
                                            if(output_text.text=="0"||my_calculator.get_new_num()===true){
                                                output_text.text="7"
                                                my_calculator.set_new_num(false);
                                            }
                                            else
                                                if(output_text.text.length<10)
                                                    output_text.text+="7"
                                        }
                                    }
                                }

                            }

                            states: [
                                State {
                                    name: "State1butt7"

                                    PropertyChanges {
                                        target: rectangle_butt7
                                        height: 51
                                        border.color: "#2db7e7"
                                        border.width: 3
                                    }
                                },
                                State {
                                    name: "State2butt7"

                                    PropertyChanges {
                                        target: gradient_butt7
                                        color: "#2db7e7"
                                    }

                                    PropertyChanges {
                                        target: rectangle_butt7
                                        color: "#11ee37"
                                    }

                                    PropertyChanges {
                                        target: text_butt7
                                        color: "#152ac8"
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                }
                            ]
                        }
                        //////////////////butt4
                        Item {
                            id: butt4
                            width: 80
                            height: 44

                            Rectangle {
                                id: rectangle_butt4
                                radius: 14
                                opacity: 0.7
                                gradient: Gradient {
                                    GradientStop {
                                        id: gradient_butt4
                                        position: 0
                                        color: "#ffffffff"
                                    }

                                    GradientStop {
                                        position: 1
                                        color: "#43e7de"
                                    }
                                }
                                border.color: "#38ed69"
                                anchors.fill: parent

                                Text {
                                    id: text_butt4
                                    text: "4"
                                    anchors.fill: parent
                                    fontSizeMode: Text.Fit
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pixelSize: 20
                                }

                                MouseArea {
                                    id: mouseArea_butt4
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onHoveredChanged: containsMouse ? butt4.state = "State1butt4" : butt4.state ="base state"
                                    onPressedChanged: pressed && containsMouse ? butt4.state= "State2butt4" : butt4.state= "State1butt4"
                                    onPressed : {
                                        text_animation.start()
                                        if(output_text.text!="Error!"){
                                            calculator.is_input=true
                                            if(output_text.text=="0"||my_calculator.get_new_num()===true){
                                                output_text.text="4"
                                                my_calculator.set_new_num(false)
                                            }
                                            else
                                                if(output_text.text.length<10)
                                                    output_text.text+="4"
                                        }
                                    }
                                }

                            }

                            states: [
                                State {
                                    name: "State1butt4"

                                    PropertyChanges {
                                        target: rectangle_butt4
                                        height: 51
                                        border.color: "#2db7e7"
                                        border.width: 3
                                    }
                                },
                                State {
                                    name: "State2butt4"

                                    PropertyChanges {
                                        target: gradient_butt4
                                        color: "#2db7e7"
                                    }

                                    PropertyChanges {
                                        target: rectangle_butt4
                                        color: "#11ee37"
                                    }

                                    PropertyChanges {
                                        target: text_butt4
                                        color: "#152ac8"
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                }
                            ]
                        }

                        //////////////////butt1
                        Item {
                            id: butt1
                            width: 80
                            height: 44

                            Rectangle {
                                id: rectangle_butt1
                                radius: 14
                                opacity: 0.7
                                gradient: Gradient {
                                    GradientStop {
                                        id: gradient_butt1
                                        position: 0
                                        color: "#ffffffff"
                                    }

                                    GradientStop {
                                        position: 1
                                        color: "#43e7de"
                                    }
                                }
                                border.color: "#38ed69"
                                anchors.fill: parent

                                Text {
                                    id: text_butt1
                                    text: "1"
                                    anchors.fill: parent
                                    fontSizeMode: Text.Fit
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pixelSize: 20
                                }

                                MouseArea {
                                    id: mouseArea_butt1
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onHoveredChanged: containsMouse ? butt1.state = "State1butt1" : butt1.state ="base state"
                                    onPressedChanged: pressed && containsMouse ? butt1.state= "State2butt1" : butt1.state= "State1butt1"
                                    onPressed : {
                                        text_animation.start()
                                        if(output_text.text!="Error!"){
                                            calculator.is_input=true
                                            if(output_text.text=="0"||my_calculator.get_new_num()===true){
                                                output_text.text="1"
                                                my_calculator.set_new_num(false);
                                            }
                                            else
                                                if(output_text.text.length<10)
                                                    output_text.text+="1"
                                        }
                                    }
                                }

                            }

                            states: [
                                State {
                                    name: "State1butt1"

                                    PropertyChanges {
                                        target: rectangle_butt1
                                        height: 51
                                        border.color: "#2db7e7"
                                        border.width: 3
                                    }
                                },
                                State {
                                    name: "State2butt1"

                                    PropertyChanges {
                                        target: gradient_butt1
                                        color: "#2db7e7"
                                    }

                                    PropertyChanges {
                                        target: rectangle_butt1
                                        color: "#11ee37"
                                    }

                                    PropertyChanges {
                                        target: text_butt1
                                        color: "#152ac8"
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                }
                            ]
                        }



                        //////////////////butt0
                        Item {
                            id: butt0
                            width: 80
                            height: 44

                            Rectangle {
                                id: rectangle_butt0
                                radius: 14
                                opacity: 0.7
                                gradient: Gradient {
                                    GradientStop {
                                        id: gradient_butt0
                                        position: 0
                                        color: "#ffffffff"
                                    }

                                    GradientStop {
                                        position: 1
                                        color: "#43e7de"
                                    }
                                }
                                border.color: "#38ed69"
                                anchors.fill: parent

                                Text {
                                    id: text_butt0
                                    text: "0"
                                    anchors.fill: parent
                                    fontSizeMode: Text.Fit
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pixelSize: 20
                                }

                                MouseArea {
                                    id: mouseArea_butt0
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onHoveredChanged: containsMouse ? butt0.state = "State1butt0" : butt0.state ="base state"
                                    onPressedChanged: pressed && containsMouse ? butt0.state= "State2butt0" : butt0.state= "State1butt0"
                                    onPressed : {
                                        text_animation.start()
                                        if(output_text.text!="Error!"){
                                            calculator.is_input=true
                                            if(output_text.text=="0"||my_calculator.get_new_num()===true){
                                                output_text.text="0"
                                                my_calculator.set_new_num(false)
                                            }
                                            else
                                                if(output_text.text.length<10)
                                                    output_text.text+="0"

                                        }
                                    }

                                }

                            }

                            states: [
                                State {
                                    name: "State1butt0"

                                    PropertyChanges {
                                        target: rectangle_butt0
                                        height: 51
                                        border.color: "#2db7e7"
                                        border.width: 3
                                    }
                                },
                                State {
                                    name: "State2butt0"

                                    PropertyChanges {
                                        target: gradient_butt0
                                        color: "#2db7e7"
                                    }

                                    PropertyChanges {
                                        target: rectangle_butt0
                                        color: "#11ee37"
                                    }

                                    PropertyChanges {
                                        target: text_butt0
                                        color: "#152ac8"
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                }
                            ]
                        }




                    }

                    Column {
                        id: column2
                        width: 81
                        height: 273
                        spacing: 13
                        /////////////buttrad
                        Item {
                            id: buttrad
                            width: 80
                            height: 44
                            opacity: 1

                            Rectangle {
                                id: rectangle_buttrad
                                radius: 14
                                opacity: 0.7
                                gradient: Gradient {
                                    GradientStop {
                                        id: gradient_buttrad
                                        position: 0
                                        color: "#ffffffff"
                                    }

                                    GradientStop {
                                        position: 1
                                        color: "#43e7de"
                                    }
                                }
                                border.color: "#38ed69"
                                anchors.fill: parent

                                Text {
                                    id: text_buttrad
                                    text: "√"
                                    anchors.fill: parent
                                    fontSizeMode: Text.Fit
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pixelSize: 20
                                }

                                MouseArea {
                                    id: mouseArea_buttrad
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onHoveredChanged: containsMouse ? buttrad.state = "State1buttrad" : buttrad.state ="base state"
                                    onPressedChanged: pressed && containsMouse ? buttrad.state= "State2buttrad" : buttrad.state= "State1buttrad"
                                    onClicked: {
                                        text_animation.start()
                                        if(output_text.text!="Error!"){
                                            output_text.text=my_calculator.calculate_rad(output_text.text)
                                            my_calculator.set_new_num(true)
                                            buttdot.check=false
                                            calculator.is_input=false
                                        }
                                    }
                                }

                            }

                            states: [
                                State {
                                    name: "State1buttrad"

                                    PropertyChanges {
                                        target: rectangle_buttrad
                                        height: 51
                                        border.color: "#2db7e7"
                                        border.width: 3
                                    }
                                },
                                State {
                                    name: "State2buttrad"

                                    PropertyChanges {
                                        target: gradient_buttrad
                                        color: "#2db7e7"
                                    }

                                    PropertyChanges {
                                        target: rectangle_buttrad
                                        color: "#11ee37"
                                    }

                                    PropertyChanges {
                                        target: text_buttrad
                                        color: "#152ac8"
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                }
                            ]
                        }
                        ////////////////butt8
                        Item {
                            id: butt8
                            width: 80
                            height: 44

                            Rectangle {
                                id: rectangle_butt8
                                radius: 14
                                opacity: 0.7
                                gradient: Gradient {
                                    GradientStop {
                                        id: gradient_butt8
                                        position: 0
                                        color: "#ffffffff"
                                    }

                                    GradientStop {
                                        position: 1
                                        color: "#43e7de"
                                    }
                                }
                                border.color: "#38ed69"
                                anchors.fill: parent

                                Text {
                                    id: text_butt8
                                    text: "8"
                                    anchors.fill: parent
                                    fontSizeMode: Text.Fit
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pixelSize: 20
                                }

                                MouseArea {
                                    id: mouseArea_butt8
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onHoveredChanged: containsMouse ? butt8.state = "State1butt8" : butt8.state ="base state"
                                    onPressedChanged: pressed && containsMouse ? butt8.state= "State2butt8" : butt8.state= "State1butt8"
                                    onPressed : {
                                        text_animation.start()
                                        if(output_text.text!="Error!"){
                                            calculator.is_input=true
                                            if(output_text.text=="0"||my_calculator.get_new_num()===true){
                                                output_text.text="8"
                                                my_calculator.set_new_num(false)
                                            }
                                            else
                                                if(output_text.text.length<10)
                                                    output_text.text+="8"
                                        }
                                    }
                                }

                            }

                            states: [
                                State {
                                    name: "State1butt8"

                                    PropertyChanges {
                                        target: rectangle_butt8
                                        height: 51
                                        border.color: "#2db7e7"
                                        border.width: 3
                                    }
                                },
                                State {
                                    name: "State2butt8"

                                    PropertyChanges {
                                        target: gradient_butt8
                                        color: "#2db7e7"
                                    }

                                    PropertyChanges {
                                        target: rectangle_butt8
                                        color: "#11ee37"
                                    }

                                    PropertyChanges {
                                        target: text_butt8
                                        color: "#152ac8"
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                }
                            ]
                        }

                        ////////////////butt5
                        Item {
                            id: butt5
                            width: 80
                            height: 44

                            Rectangle {
                                id: rectangle_butt5
                                radius: 14
                                opacity: 0.7
                                gradient: Gradient {
                                    GradientStop {
                                        id: gradient_butt5
                                        position: 0
                                        color: "#ffffffff"
                                    }

                                    GradientStop {
                                        position: 1
                                        color: "#43e7de"
                                    }
                                }
                                border.color: "#38ed69"
                                anchors.fill: parent

                                Text {
                                    id: text_butt5
                                    text: "5"
                                    anchors.fill: parent
                                    fontSizeMode: Text.Fit
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pixelSize: 20
                                }

                                MouseArea {
                                    id: mouseArea_butt5
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onHoveredChanged: containsMouse ? butt5.state = "State1butt5" : butt5.state ="base state"
                                    onPressedChanged: pressed && containsMouse ? butt5.state= "State2butt5" : butt5.state= "State1butt5"
                                    onPressed : {
                                        text_animation.start()
                                        if(output_text.text!="Error!"){
                                            calculator.is_input=true
                                            if(output_text.text=="0"||my_calculator.get_new_num()===true){
                                                output_text.text="5"
                                                my_calculator.set_new_num(false)
                                            }
                                            else
                                                if(output_text.text.length<10)
                                                    output_text.text+="5"
                                        }
                                    }
                                }

                            }

                            states: [
                                State {
                                    name: "State1butt5"

                                    PropertyChanges {
                                        target: rectangle_butt5
                                        height: 51
                                        border.color: "#2db7e7"
                                        border.width: 3
                                    }
                                },
                                State {
                                    name: "State2butt5"

                                    PropertyChanges {
                                        target: gradient_butt5
                                        color: "#2db7e7"
                                    }

                                    PropertyChanges {
                                        target: rectangle_butt5
                                        color: "#11ee37"
                                    }

                                    PropertyChanges {
                                        target: text_butt5
                                        color: "#152ac8"
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                }
                            ]
                        }

                        ////////////////butt2
                        Item {
                            id: butt2
                            width: 80
                            height: 44

                            Rectangle {
                                id: rectangle_butt2
                                radius: 14
                                opacity: 0.7
                                gradient: Gradient {
                                    GradientStop {
                                        id: gradient_butt2
                                        position: 0
                                        color: "#ffffffff"
                                    }

                                    GradientStop {
                                        position: 1
                                        color: "#43e7de"
                                    }
                                }
                                border.color: "#38ed69"
                                anchors.fill: parent

                                Text {
                                    id: text_butt2
                                    text: "2"
                                    anchors.fill: parent
                                    fontSizeMode: Text.Fit
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pixelSize: 20
                                }

                                MouseArea {
                                    id: mouseArea_butt2
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onHoveredChanged: containsMouse ? butt2.state = "State1butt2" : butt2.state ="base state"
                                    onPressedChanged: pressed && containsMouse ? butt2.state= "State2butt2" : butt2.state= "State1butt2"
                                    onPressed : {
                                        text_animation.start()
                                        if(output_text.text!="Error!"){
                                            calculator.is_input=true
                                            if(output_text.text=="0"||my_calculator.get_new_num()===true){
                                                output_text.text="2"
                                                my_calculator.set_new_num(false)
                                            }
                                            else
                                                if(output_text.text.length<10)
                                                    output_text.text+="2"
                                        }
                                    }
                                }

                            }

                            states: [
                                State {
                                    name: "State1butt2"

                                    PropertyChanges {
                                        target: rectangle_butt2
                                        height: 51
                                        border.color: "#2db7e7"
                                        border.width: 3
                                    }
                                },
                                State {
                                    name: "State2butt2"

                                    PropertyChanges {
                                        target: gradient_butt2
                                        color: "#2db7e7"
                                    }

                                    PropertyChanges {
                                        target: rectangle_butt2
                                        color: "#11ee37"
                                    }

                                    PropertyChanges {
                                        target: text_butt2
                                        color: "#152ac8"
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                }
                            ]
                        }
                        ////////////////buttdot
                        Item {
                            id: buttdot
                            width: 80
                            height: 44
                            property bool check: false
                            Rectangle {
                                id: rectangle_buttdot
                                radius: 14
                                opacity: 0.7
                                gradient: Gradient {
                                    GradientStop {
                                        id: gradient_buttdot
                                        position: 0
                                        color: "#ffffffff"
                                    }

                                    GradientStop {
                                        position: 1
                                        color: "#43e7de"
                                    }
                                }
                                border.color: "#38ed69"
                                anchors.fill: parent

                                Text {
                                    id: text_buttdot
                                    text: "."
                                    anchors.fill: parent
                                    fontSizeMode: Text.Fit
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pixelSize: 20
                                }

                                MouseArea {
                                    id: mouseArea_buttdot
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onHoveredChanged: containsMouse ? buttdot.state = "State1buttdot" : buttdot.state ="base state"
                                    onPressedChanged: pressed && containsMouse ? buttdot.state= "State2buttdot" : buttdot.state= "State1buttdot"
                                    onPressed : {
                                        text_animation.start()
                                        if(output_text.text!="Error!"){
                                            calculator.is_input=true
                                            if(output_text.text=="0"||my_calculator.get_new_num()===true){
                                                output_text.text="0"
                                                output_text.text+="."
                                                buttdot.check=true
                                                my_calculator.set_new_num(false)
                                            }
                                            else
                                                if(buttdot.check==false && output_text.text.length<10){
                                                    output_text.text+="."
                                                    buttdot.check=true
                                                }
                                        }
                                    }
                                }

                            }

                            states: [
                                State {
                                    name: "State1buttdot"

                                    PropertyChanges {
                                        target: rectangle_buttdot
                                        height: 51
                                        border.color: "#2db7e7"
                                        border.width: 3
                                    }
                                },
                                State {
                                    name: "State2buttdot"

                                    PropertyChanges {
                                        target: gradient_buttdot
                                        color: "#2db7e7"
                                    }

                                    PropertyChanges {
                                        target: rectangle_buttdot
                                        color: "#11ee37"
                                    }

                                    PropertyChanges {
                                        target: text_buttdot
                                        color: "#152ac8"
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                }
                            ]
                        }
                    }

                    Column {
                        id: column3
                        width: 81
                        height: 273
                        spacing: 13

                        Item {
                            id: buttdiv
                            width: 80
                            height: 44

                            Rectangle {
                                id: rectangle_buttdiv
                                radius: 14
                                opacity: 0.7
                                gradient: Gradient {
                                    GradientStop {
                                        id: gradient_buttdiv
                                        position: 0
                                        color: "#ffffffff"
                                    }

                                    GradientStop {
                                        position: 1
                                        color: "#43e7de"
                                    }
                                }
                                border.color: "#38ed69"
                                anchors.fill: parent

                                Text {
                                    id: text_buttdiv
                                    text: "÷"
                                    anchors.fill: parent
                                    fontSizeMode: Text.Fit
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pixelSize: 20
                                }

                                MouseArea {
                                    id: mouseArea_buttdiv
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onHoveredChanged: containsMouse ? buttdiv.state = "State1buttdiv" : buttdiv.state ="base state"
                                    onPressedChanged: pressed && containsMouse ? buttdiv.state= "State2buttdiv" : buttdiv.state= "State1buttdiv"
                                    onClicked: {
                                        text_animation.start()
                                        my_calculator.set_check_last_input(false)
                                        if(output_text.text!="Error!"&& calculator.is_input==true){
                                            output_text.text=my_calculator.calculate(output_text.text)
                                            my_calculator.set_new_num(true)
                                            buttdot.check=false
                                            calculator.is_input=false
                                        }
                                        my_calculator.set_last_sign("/")
                                    }
                                }

                            }

                            states: [
                                State {
                                    name: "State1buttdiv"

                                    PropertyChanges {
                                        target: rectangle_buttdiv
                                        height: 51
                                        border.color: "#2db7e7"
                                        border.width: 3
                                    }
                                },
                                State {
                                    name: "State2buttdiv"

                                    PropertyChanges {
                                        target: gradient_buttdiv
                                        color: "#2db7e7"
                                    }

                                    PropertyChanges {
                                        target: rectangle_buttdiv
                                        color: "#11ee37"
                                    }

                                    PropertyChanges {
                                        target: text_buttdiv
                                        color: "#152ac8"
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                }
                            ]
                        }
                        //////////butt9
                        Item {
                            id: butt9
                            width: 80
                            height: 44

                            Rectangle {
                                id: rectangle_butt9
                                radius: 14
                                opacity: 0.7
                                gradient: Gradient {
                                    GradientStop {
                                        id: gradient_butt9
                                        position: 0
                                        color: "#ffffffff"
                                    }

                                    GradientStop {
                                        position: 1
                                        color: "#43e7de"
                                    }
                                }
                                border.color: "#38ed69"
                                anchors.fill: parent

                                Text {
                                    id: text_butt9
                                    text: "9"
                                    anchors.fill: parent
                                    fontSizeMode: Text.Fit
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pixelSize: 20
                                }

                                MouseArea {
                                    id: mouseArea_butt9
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onHoveredChanged: containsMouse ? butt9.state = "State1butt9" : butt9.state ="base state"
                                    onPressedChanged: pressed && containsMouse ? butt9.state= "State2butt9" : butt9.state= "State1butt9"
                                    onPressed : {
                                        text_animation.start()
                                        if(output_text.text!="Error!"){
                                            calculator.is_input=true
                                            if(output_text.text=="0"||my_calculator.get_new_num()===true){
                                                output_text.text="9"
                                                my_calculator.set_new_num(false)
                                            }
                                            else
                                                if(output_text.text.length<10)
                                                    output_text.text+="9"
                                        }
                                    }
                                }

                            }

                            states: [
                                State {
                                    name: "State1butt9"

                                    PropertyChanges {
                                        target: rectangle_butt9
                                        height: 51
                                        border.color: "#2db7e7"
                                        border.width: 3
                                    }
                                },
                                State {
                                    name: "State2butt9"

                                    PropertyChanges {
                                        target: gradient_butt9
                                        color: "#2db7e7"
                                    }

                                    PropertyChanges {
                                        target: rectangle_butt9
                                        color: "#11ee37"
                                    }

                                    PropertyChanges {
                                        target: text_butt9
                                        color: "#152ac8"
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                }
                            ]
                        }
                        //////////butt6
                        Item {
                            id: butt6
                            width: 80
                            height: 44

                            Rectangle {
                                id: rectangle_butt6
                                radius: 14
                                opacity: 0.7
                                gradient: Gradient {
                                    GradientStop {
                                        id: gradient_butt6
                                        position: 0
                                        color: "#ffffffff"
                                    }

                                    GradientStop {
                                        position: 1
                                        color: "#43e7de"
                                    }
                                }
                                border.color: "#38ed69"
                                anchors.fill: parent

                                Text {
                                    id: text_butt6
                                    text: "6"
                                    anchors.fill: parent
                                    fontSizeMode: Text.Fit
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pixelSize: 20
                                }

                                MouseArea {
                                    id: mouseArea_butt6
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onHoveredChanged: containsMouse ? butt6.state = "State1butt6" : butt6.state ="base state"
                                    onPressedChanged: pressed && containsMouse ? butt6.state= "State2butt6" : butt6.state= "State1butt6"
                                    onPressed : {
                                        text_animation.start()
                                        if(output_text.text!="Error!"){
                                            calculator.is_input=true
                                            if(output_text.text=="0"||my_calculator.get_new_num()===true){
                                                output_text.text="6"
                                                my_calculator.set_new_num(false)
                                            }
                                            else
                                                output_text.text+="6"
                                        }
                                    }
                                }

                            }

                            states: [
                                State {
                                    name: "State1butt6"

                                    PropertyChanges {
                                        target: rectangle_butt6
                                        height: 51
                                        border.color: "#2db7e7"
                                        border.width: 3
                                    }
                                },
                                State {
                                    name: "State2butt6"

                                    PropertyChanges {
                                        target: gradient_butt6
                                        color: "#2db7e7"
                                    }

                                    PropertyChanges {
                                        target: rectangle_butt6
                                        color: "#11ee37"
                                    }

                                    PropertyChanges {
                                        target: text_butt6
                                        color: "#152ac8"
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                }
                            ]
                        }


                        //////////butt3
                        Item {
                            id: butt3
                            width: 80
                            height: 44

                            Rectangle {
                                id: rectangle_butt3
                                radius: 14
                                opacity: 0.7
                                gradient: Gradient {
                                    GradientStop {
                                        id: gradient_butt3
                                        position: 0
                                        color: "#ffffffff"
                                    }

                                    GradientStop {
                                        position: 1
                                        color: "#43e7de"
                                    }
                                }
                                border.color: "#38ed69"
                                anchors.fill: parent

                                Text {
                                    id: text_butt3
                                    text: "3"
                                    anchors.fill: parent
                                    fontSizeMode: Text.Fit
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pixelSize: 20
                                }

                                MouseArea {
                                    id: mouseArea_butt3
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onHoveredChanged: containsMouse ? butt3.state = "State1butt3" : butt3.state ="base state"
                                    onPressedChanged: pressed && containsMouse ? butt3.state= "State2butt3" : butt3.state= "State1butt3"
                                    onPressed : {
                                        text_animation.start()
                                        if(output_text.text!="Error!"){
                                            calculator.is_input=true
                                            if(output_text.text=="0"||my_calculator.get_new_num()===true){
                                                output_text.text="3"
                                                my_calculator.set_new_num(false)
                                            }
                                            else
                                                if(output_text.text.length<10)
                                                    output_text.text+="3"
                                        }

                                    }
                                }

                            }

                            states: [
                                State {
                                    name: "State1butt3"

                                    PropertyChanges {
                                        target: rectangle_butt3
                                        height: 51
                                        border.color: "#2db7e7"
                                        border.width: 3
                                    }
                                },
                                State {
                                    name: "State2butt3"

                                    PropertyChanges {
                                        target: gradient_butt3
                                        color: "#2db7e7"
                                    }

                                    PropertyChanges {
                                        target: rectangle_butt3
                                        color: "#11ee37"
                                    }

                                    PropertyChanges {
                                        target: text_butt3
                                        color: "#152ac8"
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                }
                            ]
                        }
                        //////////buttequ
                        Item {
                            id: buttequ
                            width: 80
                            height: 44

                            Rectangle {
                                id: rectangle_buttequ
                                radius: 14
                                opacity: 0.7
                                gradient: Gradient {
                                    GradientStop {
                                        id: gradient_buttequ
                                        position: 0
                                        color: "#ffffffff"
                                    }

                                    GradientStop {
                                        position: 1
                                        color: "#43e7de"
                                    }
                                }
                                border.color: "#38ed69"
                                anchors.fill: parent

                                Text {
                                    id: text_buttequ
                                    text: "="
                                    anchors.fill: parent
                                    fontSizeMode: Text.Fit
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pixelSize: 20
                                }

                                MouseArea {
                                    id: mouseArea_buttequ
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onHoveredChanged: containsMouse ? buttequ.state = "State1buttequ" : buttequ.state ="base state"
                                    onPressedChanged: pressed && containsMouse ? buttequ.state= "State2buttequ" : buttequ.state= "State1buttequ"
                                    onClicked: {
                                        text_animation.start()
                                        if(my_calculator.get_check_last_input()===false){
                                            my_calculator.set_last_input(output_text.text)
                                            my_calculator.set_check_last_input(true)
                                        }
                                        if(output_text.text!="Error!"){
                                            output_text.text=my_calculator.calculate(my_calculator.get_last_input())
                                            my_calculator.set_new_num(true)
                                            buttdot.check=false
                                            calculator.is_input=false
                                        }

                                    }
                                }

                            }

                            states: [
                                State {
                                    name: "State1buttequ"

                                    PropertyChanges {
                                        target: rectangle_buttequ
                                        height: 51
                                        border.color: "#2db7e7"
                                        border.width: 3
                                    }
                                },
                                State {
                                    name: "State2buttequ"

                                    PropertyChanges {
                                        target: gradient_buttequ
                                        color: "#2db7e7"
                                    }

                                    PropertyChanges {
                                        target: rectangle_buttequ
                                        color: "#11ee37"
                                    }

                                    PropertyChanges {
                                        target: text_buttequ
                                        color: "#152ac8"
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                }
                            ]
                        }











                    }

                    Column {
                        id: column4
                        width: 80
                        height: 275
                        spacing: 13
                        //////////buttmul
                        Item {
                            id: buttmul
                            width: 80
                            height: 44

                            Rectangle {
                                id: rectangle_buttmul
                                radius: 14
                                opacity: 0.7
                                gradient: Gradient {
                                    GradientStop {
                                        id: gradient_buttmul
                                        position: 0
                                        color: "#ffffffff"
                                    }

                                    GradientStop {
                                        position: 1
                                        color: "#43e7de"
                                    }
                                }
                                border.color: "#38ed69"
                                anchors.fill: parent

                                Text {
                                    id: text_buttmul
                                    text: "×"
                                    anchors.fill: parent
                                    fontSizeMode: Text.Fit
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pixelSize: 20
                                }

                                MouseArea {
                                    id: mouseArea_buttmul
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onHoveredChanged: containsMouse ? buttmul.state = "State1buttmul" : buttmul.state ="base state"
                                    onPressedChanged: pressed && containsMouse ? buttmul.state= "State2buttmul" : buttmul.state= "State1buttmul"
                                    onClicked: {
                                        text_animation.start()
                                        my_calculator.set_check_last_input(false)
                                        if(output_text.text!="Error!"&& calculator.is_input==true){
                                            output_text.text=my_calculator.calculate(output_text.text)
                                            my_calculator.set_new_num(true)
                                            buttdot.check=false
                                            calculator.is_input=false
                                        }
                                        my_calculator.set_last_sign("*")

                                    }
                                }

                            }

                            states: [
                                State {
                                    name: "State1buttmul"

                                    PropertyChanges {
                                        target: rectangle_buttmul
                                        height: 51
                                        border.color: "#2db7e7"
                                        border.width: 3
                                    }
                                },
                                State {
                                    name: "State2buttmul"

                                    PropertyChanges {
                                        target: gradient_buttmul
                                        color: "#2db7e7"
                                    }

                                    PropertyChanges {
                                        target: rectangle_buttmul
                                        color: "#11ee37"
                                    }

                                    PropertyChanges {
                                        target: text_buttmul
                                        color: "#152ac8"
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                }
                            ]
                        }

                        //////////buttsub
                        Item {
                            id: buttsub
                            width: 80
                            height: 44

                            Rectangle {
                                id: rectangle_buttsub
                                radius: 14
                                opacity: 0.7
                                gradient: Gradient {
                                    GradientStop {
                                        id: gradient_buttsub
                                        position: 0
                                        color: "#ffffffff"
                                    }

                                    GradientStop {
                                        position: 1
                                        color: "#43e7de"
                                    }
                                }
                                border.color: "#38ed69"
                                anchors.fill: parent

                                Text {
                                    id: text_buttsub
                                    text: "-"
                                    anchors.fill: parent
                                    fontSizeMode: Text.Fit
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pixelSize: 20
                                }

                                MouseArea {
                                    id: mouseArea_buttsub
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onHoveredChanged: containsMouse ? buttsub.state = "State1buttsub" : buttsub.state ="base state"
                                    onPressedChanged: pressed && containsMouse ? buttsub.state= "State2buttsub" : buttsub.state= "State1buttsub"
                                    onClicked: {
                                        text_animation.start()
                                        my_calculator.set_check_last_input(false)
                                        if(output_text.text!="Error!"&& calculator.is_input==true){
                                            output_text.text=my_calculator.calculate(output_text.text)
                                            my_calculator.set_new_num(true)
                                            buttdot.check=false
                                            calculator.is_input=false
                                        }
                                        my_calculator.set_last_sign("-")

                                    }

                                }

                            }

                            states: [
                                State {
                                    name: "State1buttsub"

                                    PropertyChanges {
                                        target: rectangle_buttsub
                                        height: 51
                                        border.color: "#2db7e7"
                                        border.width: 3
                                    }
                                },
                                State {
                                    name: "State2buttsub"

                                    PropertyChanges {
                                        target: gradient_buttsub
                                        color: "#2db7e7"
                                    }

                                    PropertyChanges {
                                        target: rectangle_buttsub
                                        color: "#11ee37"
                                    }

                                    PropertyChanges {
                                        target: text_buttsub
                                        color: "#152ac8"
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                }
                            ]
                        }


                        //////////buttadd
                        Item {
                            id: buttadd
                            width: 80
                            height: 158


                            Rectangle {
                                id: rectangle_buttadd
                                radius: 14
                                opacity: 0.7
                                gradient: Gradient {
                                    GradientStop {
                                        id: gradient_buttadd
                                        position: 0
                                        color: "#ffffffff"
                                    }

                                    GradientStop {
                                        position: 1
                                        color: "#43e7de"
                                    }
                                }
                                border.color: "#38ed69"
                                anchors.fill: parent

                                Text {
                                    id: text_buttadd
                                    text: "+"
                                    anchors.fill: parent
                                    fontSizeMode: Text.Fit
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pixelSize: 20
                                }

                                MouseArea {
                                    id: mouseArea_buttadd
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onHoveredChanged: containsMouse ? buttadd.state = "State1buttadd" : buttadd.state ="base state"
                                    onPressedChanged: pressed && containsMouse ? buttadd.state= "State2buttadd" : buttadd.state= "State1buttadd"
                                    onClicked: {
                                        text_animation.start()
                                        my_calculator.set_check_last_input(false)
                                        if(output_text.text!="Error!"&& calculator.is_input==true){
                                            output_text.text=my_calculator.calculate(output_text.text)
                                            my_calculator.set_new_num(true)
                                            buttdot.check=false
                                            calculator.is_input=false
                                        }
                                        my_calculator.set_last_sign("+")


                                    }
                                }

                            }

                            states: [
                                State {
                                    name: "State1buttadd"

                                    PropertyChanges {
                                        target: rectangle_buttadd
                                        height: 51
                                        border.color: "#2db7e7"
                                        border.width: 3
                                    }
                                },
                                State {
                                    name: "State2buttadd"

                                    PropertyChanges {
                                        target: gradient_buttadd
                                        color: "#2db7e7"
                                    }

                                    PropertyChanges {
                                        target: rectangle_buttadd
                                        color: "#11ee37"
                                    }

                                    PropertyChanges {
                                        target: text_buttadd
                                        color: "#152ac8"
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                }
                            ]
                        }
                    }
                }

                Switch {
                    id: switch_mode
                    width: 77
                    height: 38
                    checkable: true

                    Text {
                        id: mode_text
                        x: 78
                        y: 13
                        width: 69
                        height: 19
                        text: qsTr("Dark mode")
                        font.pixelSize: 13

                    }
                    states: [
                        State {
                            name: "dark_text"
                            when: switch_mode.position==1
                            PropertyChanges {
                                target: mode_text
                                text:"Light mode"
                                color:"white"
                            }
                        },
                        State {
                            name: "light_text"
                            when: switch_mode.position==0
                            PropertyChanges {
                                target: mode_text
                                text:"Dark mode"
                                color:"black"
                            }
                        }
                    ]
                    Transition {
                        from: "*"
                        to: "*"
                        ColorAnimation {
                            target: mode_text
                            duration: 500
                        }
                    }

                }




            }

        }

        Item {
            id: loading_page
            height: 520

            BusyIndicator {
                id: busyIndicator
                x: 141
                y: 187
                width: 138
                height: 147
            }

            Text {
                id: main_taxt
                x: 161
                y: 368
                width: 98
                height: 56
                color: "#1d4dcd"
                text: qsTr("Calculator")
                font.strikeout: false
                font.underline: false
                font.italic: true
                font.bold: false
                styleColor: "#150000"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 60
            }

            Image {
                id: image
                x: 82
                y: 106
                opacity: 0.3
                fillMode: Image.PreserveAspectFit
                source: "image/calculator.png"
            }
        }


        state:"loading"

        Timer{
            id:loading_timer
            interval: 3000
            repeat: false
            running: true
            onTriggered:{

                loading_timer.stop()
                running = false
            }

        }




        states: [
            State {
                name: "loading"
                PropertyChanges {
                    target: main_page
                    opacity:0
                }
            },
            State {
                name: "main_state"
                when: loading_timer.running==false
                PropertyChanges {
                    target: loading_page
                    y:-540
                }
            }
        ]
        transitions: [
            Transition {
                from: "loading"
                to: "main_state"
                ParallelAnimation{

                    NumberAnimation {
                        target: loading_page
                        property: "y"
                        duration: 200
                        easing.type: Easing.InOutQuad
                    }

                    NumberAnimation {
                        target: main_page
                        property: "opacity"
                        duration: 200
                        easing.type: Easing.InOutQuad
                    }



                }

            }
        ]






    }
}





/*##^##
Designer {
    D{i:1;anchors_height:200;anchors_width:200}D{i:3;anchors_height:200;anchors_width:200}
D{i:5;anchors_height:400;anchors_width:300;anchors_x:235;anchors_y:171}D{i:4;anchors_height:400;anchors_width:300;anchors_x:235;anchors_y:171}
D{i:263;anchors_height:520}D{i:13;anchors_width:311;anchors_x:0;anchors_y:"-40"}D{i:2;anchors_height:200;anchors_width:200}
}
##^##*/
