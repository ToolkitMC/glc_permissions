$data modify storage glc:ui ui.actions append value {label:"⚡ Repeat: $(id)",action:{type:"minecraft:run_command",command:"/function custom_admin:handler/execute/action {id:\"$(id)\"}"}}
