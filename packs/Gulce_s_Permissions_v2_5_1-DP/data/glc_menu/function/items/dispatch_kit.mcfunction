# dispatch_kit {target:"self"|"all"|"player", player:"isim"}
$data modify storage glc:temp dk_target set value "$(target)"
$data modify storage glc:temp dk_player set value "$(player)"
function glc_menu:items/dispatch_kit_run with storage glc:temp
