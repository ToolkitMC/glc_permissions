execute as @a[tag=glc.banned,tag=glc.lang_tr] run function custom_admin:api/warn/ban_enforce_nacro {lang:"tr"}

execute as @a[tag=glc.banned,tag=glc.lang_en] run function custom_admin:api/warn/ban_enforce_nacro {lang:"en"}

execute as @a[tag=glc.banned,tag=!glc.lang_tr,tag=!glc.lang_en] run function custom_admin:api/warn/ban_enforce_nacro {lang:"tr"}
