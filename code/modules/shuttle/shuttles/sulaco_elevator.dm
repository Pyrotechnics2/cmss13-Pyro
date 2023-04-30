/obj/docking_port/mobile/sulaco_central1
	name="Central 1 Elevator"
	id=MOBILE_SULACO_CEN1_ELEVATOR

	// Map information
	height=6
	width=7
	preferred_direction = NORTH
	port_direction = SOUTH

	area_type = /area/shuttle/sulaco/elevator_cen1/elevator

	// Shuttle timings
	callTime = 30 SECONDS
	rechargeTime = 30 SECONDS
	ignitionTime = 4 SECONDS
	ambience_flight = 'sound/vehicles/tank_driving.ogg'
	ignition_sound = 'sound/mecha/powerup.ogg'

	movement_force = list("KNOCKDOWN" = 0, "THROW" = 0)
	var/datum/door_controller/aggregate/door_control

/obj/docking_port/mobile/sulaco_central1/Initialize(mapload, ...)
	. = ..()
	door_control = new()
	door_control.label = "elevator"
	for(var/area/shuttle_area in shuttle_areas)
		for(var/obj/structure/machinery/door/door in shuttle_area)
			door_control.add_door(door, door.id)

/obj/docking_port/mobile/sulaco_central1/Destroy(force, ...)
	. = ..()
	QDEL_NULL(door_control)

/obj/docking_port/mobile/sulaco_central1/beforeShuttleMove(turf/newT, rotation, move_mode, obj/docking_port/mobile/moving_dock)
	. = ..()
	door_control.control_doors("force-lock-launch", "all", force=TRUE)

/obj/docking_port/stationary/sulaco_central1
	dir=NORTH
	width=7
	height=6
	// shutters to clear the area
	var/airlock_area
	var/airlock_exit

/obj/docking_port/stationary/sulaco_central1/proc/get_doors()
	. = list()
	for(var/area/target_area in world)
		if(istype(target_area, airlock_area))
			for(var/obj/structure/machinery/door/door in target_area)
				. += list(door)

/obj/docking_port/stationary/sulaco_central1/on_arrival(obj/docking_port/mobile/arriving_shuttle)
	. = ..()
	// open elevator doors
	if(istype(arriving_shuttle, /obj/docking_port/mobile/sulaco_central1))
		var/obj/docking_port/mobile/sulaco_central1/elevator = arriving_shuttle
		elevator.door_control.control_doors("open", airlock_exit)

	// open dock doors
	var/datum/door_controller/single/door_control = new()
	door_control.doors = get_doors()
	door_control.control_doors("open", FALSE, FALSE)
	qdel(door_control)

	playsound(src, 'sound/machines/ping.ogg', 25, 1)
	playsound(arriving_shuttle, 'sound/machines/ping.ogg', 25, 1)

/obj/docking_port/stationary/sulaco_central1/on_departure(obj/docking_port/mobile/departing_shuttle)
	. = ..()
	var/datum/door_controller/single/door_control = new()
	door_control.doors = get_doors()
	door_control.control_doors("force-lock-launch")
	qdel(door_control)

/obj/docking_port/stationary/sulaco_central1/upperdeck
	name="Upperdeck Central 1 Elevator"
	id=STAT_SULACO_CEN1UPR
	airlock_area=/area/shuttle/sulaco/elevator_cen1/upperdeck
	airlock_exit="east"
	roundstart_template = /datum/map_template/shuttle/sulaco_central1

/obj/docking_port/stationary/sulaco_central1/lowerdeck
	name="Lowerdeck Central 1 Elevator"
	id=STAT_SULACO_CEN1LWR
	airlock_area=/area/shuttle/sulaco/elevator_cen1/lowerdeck
	airlock_exit="east"

/datum/map_template/shuttle/sulaco_central1
	name = "Sulaco Central 1 Elevator"
	shuttle_id = MOBILE_SULACO_CEN1_ELEVATOR

// Central 2 Setup
/obj/docking_port/mobile/sulaco_central2
	name="Central 2 Elevator"
	id=MOBILE_SULACO_CEN2_ELEVATOR

	// Map information
	height=6
	width=7
	preferred_direction = NORTH
	port_direction = SOUTH

	area_type = /area/shuttle/sulaco/elevator_cen2/elevator

	// Shuttle timings
	callTime = 30 SECONDS
	rechargeTime = 30 SECONDS
	ignitionTime = 4 SECONDS
	ambience_flight = 'sound/vehicles/tank_driving.ogg'
	ignition_sound = 'sound/mecha/powerup.ogg'

	movement_force = list("KNOCKDOWN" = 0, "THROW" = 0)
	var/datum/door_controller/aggregate/door_control

/obj/docking_port/mobile/sulaco_central2/Initialize(mapload, ...)
	. = ..()
	door_control = new()
	door_control.label = "elevator"
	for(var/area/shuttle_area in shuttle_areas)
		for(var/obj/structure/machinery/door/door in shuttle_area)
			door_control.add_door(door, door.id)

/obj/docking_port/mobile/sulaco_central2/Destroy(force, ...)
	. = ..()
	QDEL_NULL(door_control)

/obj/docking_port/mobile/sulaco_central2/beforeShuttleMove(turf/newT, rotation, move_mode, obj/docking_port/mobile/moving_dock)
	. = ..()
	door_control.control_doors("force-lock-launch", "all", force=TRUE)

/obj/docking_port/stationary/sulaco_central2
	dir=NORTH
	width=7
	height=6
	// shutters to clear the area
	var/airlock_area
	var/airlock_exit

/obj/docking_port/stationary/sulaco_central2/proc/get_doors()
	. = list()
	for(var/area/target_area in world)
		if(istype(target_area, airlock_area))
			for(var/obj/structure/machinery/door/door in target_area)
				. += list(door)

/obj/docking_port/stationary/sulaco_central2/on_arrival(obj/docking_port/mobile/arriving_shuttle)
	. = ..()
	// open elevator doors
	if(istype(arriving_shuttle, /obj/docking_port/mobile/sulaco_central2))
		var/obj/docking_port/mobile/sulaco_central2/elevator = arriving_shuttle
		elevator.door_control.control_doors("open", airlock_exit)

	// open dock doors
	var/datum/door_controller/single/door_control = new()
	door_control.doors = get_doors()
	door_control.control_doors("open", FALSE, FALSE)
	qdel(door_control)

	playsound(src, 'sound/machines/ping.ogg', 25, 1)
	playsound(arriving_shuttle, 'sound/machines/ping.ogg', 25, 1)

/obj/docking_port/stationary/sulaco_central2/on_departure(obj/docking_port/mobile/departing_shuttle)
	. = ..()
	var/datum/door_controller/single/door_control = new()
	door_control.doors = get_doors()
	door_control.control_doors("force-lock-launch")
	qdel(door_control)

/obj/docking_port/stationary/sulaco_central2/upperdeck
	name="Upperdeck Central 2 Elevator"
	id=STAT_SULACO_CEN2UPR
	airlock_area=/area/shuttle/sulaco/elevator_cen2/upperdeck
	airlock_exit="east"
	roundstart_template = /datum/map_template/shuttle/sulaco_central2

/obj/docking_port/stationary/sulaco_central2/lowerdeck
	name="Lowerdeck Central 2 Elevator"
	id=STAT_SULACO_CEN2LWR
	airlock_area=/area/shuttle/sulaco/elevator_cen2/lowerdeck
	airlock_exit="east"

/datum/map_template/shuttle/sulaco_central2
	name = "Sulaco Central 2 Elevator"
	shuttle_id = MOBILE_SULACO_CEN2_ELEVATOR
