//Meatcubes and Krampus cube moved to cube.dm

/mob/living/carbon/wall
	name = "living wall"
	real_name = "living wall"
	icon = 'icons/mob/mob.dmi'
	icon_state = "livingwall"
	a_intent = "disarm" // just so they don't swap with help intent users
	health = INFINITY
	anchored = 1
	density = 1
	nodamage = 1
	opacity = 1

	//Life(datum/controller/process/mobs/parent)
		//..(parent)
		//return

	examine()
		boutput(usr, "<span style=\"color:blue\">*---------*</span>")
		boutput(usr, "<span style=\"color:blue\">This is a [bicon(src)] <B>[src.name]</B>!</span>")
		if(prob(50) && ishuman(usr) && usr.bioHolder.HasEffect("clumsy"))
			boutput(usr, "<span style=\"color:red\">You can't help but laugh at it.</span>")
			usr.emote("laugh")
		else
			boutput(usr, "<span style=\"color:red\">It looks pretty disturbing.</span>")

	say_understands(var/other)
		if (ishuman(other) || isrobot(other) || isAI(other))
			return 1
		return ..()

	attack_hand(mob/user as mob)
		boutput(user, "<span style=\"color:blue\">You push the [src.name] but nothing happens!</span>")
		playsound(src.loc, "sound/impact_sounds/Generic_Stab_1.ogg", 25, 1)
		src.add_fingerprint(user)
		return

	ex_act(severity)
		..() // Logs.
		switch(severity)
			if(1.0)
				src.gib(1)
				return
			if(2.0)
				if (prob(25))
					src.gib(1)
			else
		return

	attackby(obj/item/W as obj, mob/user as mob)
		if (istype(W, /obj/item/weldingtool) && W:welding)
			src.gib(1)
		else
			..()
