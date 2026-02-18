$data modify storage glc:temp lang set value "$(lang)"

execute if data storage glc:temp {lang:"tr"} run  ban @s[tag=glc.banned,tag=glc.lang_tr] BANLANDINIZ - GULCE Admin System

execute if data storage glc:temp {lang:"en"} run  ban @s[tag=glc.banned,tag=glc.lang_en] YOU ARE BANNED - GULCE Admin System

execute unless data storage glc:temp {lang:"tr"} unless data storage glc:temp {lang:"en"} run ban @s[tag=glc.banned,tag=!glc.lang_tr,tag=!glc.lang_en] BANLANDINIZ / BANNED - GULCE

data remove storage glc:temp lang